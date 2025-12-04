function clockin \
  --description="add \"in\" time entry to the appropriate time logging file. (found at ~/<year>/time_<month>.journal)"

  set usage 'Usage: clockin <time_account_name>'

  echo "$(date +"i %Y/%m/%d %H:%M:%S")   $argv" >> ~/$(date +%Y)/time_$(date +%m).journal
end
