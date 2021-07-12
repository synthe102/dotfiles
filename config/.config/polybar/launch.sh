#launch polybar

echo "---" | tee -a /tmp/example.log
polybar example >>/tmp/example.log 2>&1 &

echo "Bars launched..."
