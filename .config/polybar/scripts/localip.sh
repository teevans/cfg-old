IP=$(ip route get 1 | awk '{print $7}')
OUTSIDE_IP=$(curl -s https://ipinfo.io/ip)

echo "  $OUTSIDE_IP        $IP"
