#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati

# Text format
normal="\e[0m"
bold="\e[1m"
faint="\e[2m"
underlined="\e[4m"
error_color="\e[1;31m"

# Dependencies check
dependencies=(figlet curl jq)
for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "${error_color}Error:${normal} '$cmd' is required but not installed. Please install it and try again." >&2
        exit 1
    fi
done

# Clear the screen
clear

print_banner() {
    figlet -f standard "Ualyze"
    echo -e "Analyze user-agent strings\n"
    echo -e " Author: Haitham Aouati"
    echo -e " GitHub: ${underlined}github.com/haithamaouati${normal}\n"
}

print_banner

API_URL="https://api.apicagent.com"

show_help() {
  echo "Usage: $0 -u <user-agent>"
  echo
  echo "Options:"
  echo "  -u, --ua <user-agent>   Specify a user-agent string to analyze"
  echo -e "  -h, --help              Show this help message\n"
  exit 0
}

analyze_ua() {
  local ua="$1"
  if [[ -z "$ua" ]]; then
    echo -e "[!] Error: No user-agent string provided.\n"
    exit 1
  fi

  response=$(curl -sG --data-urlencode "ua=$ua" "$API_URL")

  if [[ -z "$response" ]]; then
    echo -e "[!] No response from APIC.\n"
    exit 1
  fi

  echo -e "user-agent: $1\n"
  echo "browser_family: $(echo "$response" | jq -r '.browser_family')"
  echo

  echo "client:"
  echo "  engine: $(echo "$response" | jq -r '.client.engine')"
  echo "  engine_version: $(echo "$response" | jq -r '.client.engine_version')"
  echo "  name: $(echo "$response" | jq -r '.client.name')"
  echo "  type: $(echo "$response" | jq -r '.client.type')"
  echo "  version: $(echo "$response" | jq -r '.client.version')"
  echo

  echo "device:"
  echo "  brand: $(echo "$response" | jq -r '.device.brand')"
  echo "  model: $(echo "$response" | jq -r '.device.model')"
  echo "  type: $(echo "$response" | jq -r '.device.type')"
  echo

  echo "os:"
  echo "  name: $(echo "$response" | jq -r '.os.name')"
  echo "  platform: $(echo "$response" | jq -r '.os.platform')"
  echo "  version: $(echo "$response" | jq -r '.os.version')"
  echo

  echo -e "os_family: $(echo "$response" | jq -r '.os_family')\n"
}

# Flags parsing
while [[ $# -gt 0 ]]; do
  case "$1" in
    -u|--ua)
      shift
      USER_AGENT="$1"
      ;;
    -h|--help)
      show_help
      ;;
    *)
      echo "[!] Unknown option: $1"
      show_help
      ;;
  esac
  shift
done

analyze_ua "$USER_AGENT"
