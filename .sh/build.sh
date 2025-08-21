function devenv() {
  if [ ! -e ${PWD}/devenv/bin/activate ]
  then
    python -m venv devenv
    source devenv/bin/activate
    python -m pip install pip --upgrade
    pip install wheel setuptools
    [[ -e ${PWD}/requirements.txt ]] && pip install -r requirements.txt
  else
    source devenv/bin/activate
  fi
}

function build() {
  [[ "${1}" != "release" ]] && [[ "${1}" != "debug" ]] && echo "Usage: build [release | debug]" && return 1

  devenv

  if [[ -f ${PWD}/conanfile.txt || -f ${PWD}/conanfile.py ]] && [ ! -e ${PWD}/build/${1}/conan_paths.cmake ]
  then
    OS=$(uname | tr '[:upper:]' '[:lower:]')
    if ! type conan
    then
      python -m pip install conan
      # Set default CMake generator to Ninje
      echo 'tools.cmake.cmaketoolchain:generator="Ninja"' >> ${CONAN_HOME}/global.conf
    fi

    if conan profile detect > /dev/null 2>&1
    then
      export CONAN_HOME=$(conan config home)

      PR_DEFAULT=${CONAN_HOME}/profiles/default
      PR_RELEASE=${CONAN_HOME}/profiles/${OS}_release
      PR_DEBUG=${CONAN_HOME}/profiles/${OS}_debug

      if [ ! -f ${PR_RELEASE} ]
      then
        cp ${PR_DEFAULT} ${PR_RELEASE}
      fi

      if [ ! -f ${PR_DEBUG} ]
      then
        print "include(${OS}_release)\n[settings]\nbuild_type=Debug" > ${PR_DEBUG}
      fi
    fi

    conan install --build=missing -of build/${1} -pr ${OS}_${1} .
    export NOT_ON_C3I=1
  fi

  if [ -f ${PWD}/CMakePresets.json ]
  then
    [[ $? -eq 0 ]] && cmake --workflow --preset ${1}
    # [[ $? -eq 0 ]] && cmake --preset ${1}
    # [[ $? -eq 0 ]] && cmake --build --preset ${1}
  else
    BUILD_TYPE=$(echo ${1} | sed 's/\([a-zA-Z]\)\(.*\)/\u\1\2/')
    [[ $? -eq 0 ]] && cmake -B build/${1} \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    [[ $? -eq 0 ]] && cmake --build build/${1}
  fi

  if [ -e ${PWD}/build/${1}/compile_commands.json ]
  then
    ln -nfs ${PWD}/build/${1}/compile_commands.json .
  fi
}
