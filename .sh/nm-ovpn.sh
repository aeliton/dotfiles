CREDENTIALS_FILE="credentials.txt"

function nm-ovpn-config() {
  if [ -z "$1" ]; then
    echo "usage: $0 <directory>\n"                                             \
    "\n"                                                                       \
    "Configures NetworkManager connections using OpenVPN files in bulk. This\n"\
    "is useful to ensure DNS leaks are prevented, which may occur when nm\n"   \
    "doesn't know about the VPN connection, which prevents it from sending\n"  \
    "DNS requests via the VPN tunnel.\n"                                       \
    "\n"                                                                       \
    "It's expected that: \n"                                                   \
    "  1. 'directory' contains a file named '${CREDENTIALS_FILE}' in the\n"    \
    "     format expected by OpenVPN: two lines file with username on the\n"   \
    "     first line and password on the second line.\n"                       \
    "  2. Dependency github.com/jonathanio/update-systemd-resolved is\n"       \
    "     installed (network-manager-openvpn on Debian).\n"                    \
    "\n"                                                                       \
    "    directory\n"                                                          \
    "        A directory with one or more .ovpn files."
    return 1
  fi

  if ! dpkg-query -s network-manager-openvpn >/dev/null 2>&1; then
    echo "sudo apt install network-manager-openvpn"
    sudo apt install network-manager-openvpn
  fi

  # The directory of the `.ovpn` files (e.g./etc/openvpn/provider)
  OVPN_DIR="${1%/}"

  if [ ! -d "${OVPN_DIR}" ]; then
    echo "error: ${OVPN_DIR} does not exist."
    return 1
  fi

  if ! ls ${OVPN_DIR}/*.ovpn 2>>&1 > /dev/null; then
    echo "error: ${OVPN_DIR} does not contains .ovpn files"
    return 1
  fi

  # The full path of your VPN credentials
  CREDENTIALS_PATH="${OVPN_DIR}/${CREDENTIALS_FILE}"
  if [ ! -f "${CREDENTIALS_PATH}" ]; then
    echo "error: ${CREDENTIALS_PATH} does not exist."
    return 1
  fi

  SUDO=""
  if [ ! -r "${CREDENTIALS_PATH}" ]; then
    SUDO="sudo"
  fi

  # The username MUST be at the first line of the file.
  vpn_user=$(${SUDO} head -n 1 ${CREDENTIALS_PATH})

  # The password MUST be at the last line of the file.
  vpn_pass=$(${SUDO} tail -n 1 ${CREDENTIALS_PATH})

  for file in ${OVPN_DIR}/*.ovpn; do
    # nm uses the basefilename minus the extension as connection name.
    conn_name=$(basename "${file%.*}")
    if nmcli con show ${conn_name} 2>>&1 > /dev/null; then
      nmcli con del ${conn_name}
    fi

    # Create and configure all connections.
    nmcli con import type openvpn file $file
    nmcli con mod ${conn_name} vpn.user-name ${vpn_user}
    nmcli con mod ${conn_name} +vpn.data "password-flags=0"
    nmcli con mod ${conn_name} vpn.secrets "password=${vpn_pass}"
  done
}
