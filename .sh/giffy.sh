function giffy() {
  MKV_FILE="${1}.mkv"
  ffcast -s rec ${MKV_FILE}
  if [ ! -e "${MKV_FILE}" ]
  then
    echo "Unable to create ${MKV_FILE}"
    return 1
  fi
  ffmpeg -v warning -i "${MKV_FILE}" -vf fps=6,scale=-1:800:flags=lanczos -y "${1}.gif"
}
