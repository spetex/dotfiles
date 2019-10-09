task="$(
 toggl now |\
 head -n 1
)"

dur="$(
 toggl now |\
 grep 'Duration'
)"

echo "$dur   $task"

