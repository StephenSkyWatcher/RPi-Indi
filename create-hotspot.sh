# ----------------------------
# MIGHT NOT WORK
# 
# Only keeping for reference later...
# ----------------------------

# sudo nmcli con add type wifi ifname wlx08bd43a8e965 con-name astrophotography autoconnect yes ssid astrophotography
# sudo nmcli con modify astrophotography 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
# sudo nmcli con modify astrophotography wifi-sec.key-mgmt wpa-psk
# sudo nmcli con modify astrophotography wifi-sec.psk "password"
# sudo nmcli con up astrophotography
# sudo nmcli con show
