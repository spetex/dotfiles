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
  if [[ $status == "discharging" ]]; then
    echo "↯"
    return
  fi
  if [[ $status == "fully-charged" ]]; then
    echo "🔋"
    return
  fi
  if [[ $status == "charging" ]]; then
    echo "⚡"
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

uptime="↑ $(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)"
date_formatted="$(date "+%a %d %b %H:%M")"

audio_status=$(amixer -M get Master |\
awk '/Front Left:+/ {print $6=="[off]" ?\
"🔇": \
"🔉"}' |\
tr -d [])
playback=( $(amixer get Master playback | sed -n '/.*\[\([0-9]*\)%].*/s//\1/p') )
audio_volume="${playback[1]}%"

kernel="🐧 $(uname -r | cut -d '-' -f1)"
host="💻 $(hostname)"
temp=$(
  sensors |\
  grep 'temp1' |\
  awk '{print $2}'
)

wifi="$(GetWifiStatus) $(
  nmcli device show wlp3s0 |\
  grep 'GENERAL.CONNECTION' |\
  awk '{print $2}'
)"

echo "$temp   $kernel   $uptime   $wifi   $battery0 $battery1   $audio_status $audio_volume   $date_formatted   $host "

