chrome_tasks=`cat /sys/fs/cgroup/memory/chrome/agil/tasks | wc -l`
chrome_limit=`cat /sys/fs/cgroup/memory/chrome/agil/memory.limit_in_bytes`
chrome_usage=`cat /sys/fs/cgroup/memory/chrome/agil/memory.usage_in_bytes`
printf 'Chrome Tasks    : %10s\n' $chrome_tasks
printf 'Chrome Mem Limit: %10s\n' $chrome_limit
printf 'Chrome Mem Usage: %10s\n' $chrome_usage
