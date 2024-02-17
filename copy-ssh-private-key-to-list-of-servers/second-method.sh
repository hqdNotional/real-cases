while read p; do
  cat ~/.ssh/$public | ssh -i ~/.ssh/$authentication $username@$p 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'
done <$inventory # $inventory is file store one ip address per each line
