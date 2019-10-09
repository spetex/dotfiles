# The Sway configuration file in ~/.config/sway/config calls this script.

GetBatteryPercentage() {
  echo $(
    upower --show-info $(upower --enumerate | grep $1) |\
    grep 'percentage' |\
    awk '{print $2}'
  )
}

GetBatteryStatus() {
  status=$(
    upower --show-info $(upower --enumerate | grep $1) |\
    grep 'state' |\
    awk '{print $2}'
  )
  percentage=$(GetBatteryPercentage $1)
  percent_value=${percentage%?}
  if [[ $status == "discharging" ]]; then
    if [[ $percent_value -gt "85" ]]; then
      echo ""
      return
    fi
    if [[ $percent_value -gt "55" ]]; then
      echo ""
      return
    fi
    if [[ $percent_value -gt "45" ]]; then
      echo ""
      return
    fi
    if [[ $percent_value -gt "15" ]]; then
      echo ""
      return
    fi
    if [[ $percent_value -lt "15" ]]; then
      echo ""
      return
    fi
  fi
  if [[ $status == "fully-charged" ]]; then
    echo ""
    return
  fi
  if [[ $status == "charging" ]]; then
    echo ""
    return
  fi
  echo "unknown"
}

GetWifiStatus() {
  wifi=$(
    nmcli device show wlp3s0 |\
    grep 'GENERAL.STATE' |\
    awk '{print $2}'
  )
  if [[ $wifi == "100" ]]; then
    echo "📶"
    return
  fi
  if [[ $wifi == "30" ]]; then
    echo "🚫"
    return
  fi
}

battery0="$(GetBatteryStatus 'BAT0') $(GetBatteryPercentage 'BAT0')"
battery1="$(GetBatteryStatus 'BAT1') $(GetBatteryPercentage 'BAT1')"

uptime=" $(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)"
date_formatted="$(date "+%a %d %b %H:%M")"

audio_status=$(amixer -Dpulse get Master |\
awk '/Right:+/ {print $6=="[off]" ?\
" ": \
""}' |\
tr -d [])
playback=( $(amixer -Dpulse get Master | grep 'Right' | sed -n '/.*\[\([0-9]*\)%].*/s//\1/p') )
audio_volume="${playback}%"

kernel=" $(uname -r | cut -d '-' -f1)"
host="💻 $(hostname)"
fan=" $(
  sensors |\
  grep 'fan1' |\
  awk '{print $2" "$3}'
)"
temp="$(
  sensors |\
  grep 'Package' |\
  awk '{print $4}'
)"

wifi_essid="$(cut -d '"' -f 2 <<< $(iwconfig wlp3s0 | grep "ESSID:\""))"
wifi=" $(echo $wifi_essid || "None")"

wifi_signal="$(
  iwconfig wlp3s0 |\
  grep 'Link Quality' |\
  awk '{print $2}'
)"

wifi_ip="$(
  ifconfig wlp3s0 |\
  grep 'inet ' |\
  awk '{print " - "$2}'
)"

ethernet="$(
  ifconfig enp0s25 |\
  grep 'inet ' |\
  awk '{print "       "$2}'
)"

GetBluetoothStatus() {
  bluetooth="$(
    ./.bin/bstatus |\
    grep 'Powered' |\
    awk '{print $2}'
  )"
  if [[ $bluetooth == "yes" ]]; then
    echo " on"
    return
  fi
  if [[ $bluetooth == "no" ]]; then
    echo " off"
    return
  fi
}

GetHeadphonesStatus() {
  headphones="$(
    ./.bin/bhstatus |\
    grep 'Connected' |\
    awk '{print $2}'
  )"
  if [[ $headphones == "yes" ]]; then
    echo " ()  ";
    return
  fi
  if [[ $headphones == "no" ]]; then
    echo "";
    return
  fi
}

bluetooth=$(GetBluetoothStatus)
headphones=$(GetHeadphonesStatus)

articles=" $(newsboat -x print-unread | awk '{print $1}')"


echo "$fan   $temp   $kernel   $articles   $uptime   ${wifi}  ${wifi_signal:8}$wifi_ip$ethernet   $bluetooth   $battery0  $battery1   $headphones$audio_status $audio_volume   $date_formatted "
