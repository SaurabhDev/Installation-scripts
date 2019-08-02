wget https://dl.grafana.com/oss/release/grafana_6.2.5_amd64.deb
sudo dpkg -i grafana_6.2.5_amd64.deb
sudo apt-get install -y adduser libfontconfig1
apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb beta main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana
sudo apt-get install -y apt-transport-https
sudo service grafana-server start
sudo update-rc.d grafana-server defaults
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
sudo systemctl enable grafana-server.service
