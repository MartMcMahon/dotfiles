function clockout \
  --description="add \"out\" time entry to the appropriate time logging file. (found at ~/<year>/time_<month>.journal)"

  set usage 'Usage: clockout <time_account_name>'

  echo "$(date +"o %Y/%m/%d %H:%M:%S")   $argv" >> ~/$(date +%Y)/time_$(date +%m).journal
end
