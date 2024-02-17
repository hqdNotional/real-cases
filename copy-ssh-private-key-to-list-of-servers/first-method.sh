SERVERS=$(cat <<-END
35.194.109.115
34.85.113.253
34.84.8.251
34.146.75.220
END
)


for srv in $SERVERS; do
  ssh-copy-id -o StrictHostKeyChecking=no -f -i "$HOME/.ssh/notional.pub" "gcp@${srv}"
done

