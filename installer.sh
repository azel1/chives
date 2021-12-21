apt update -y
apt upgrade -y
# MOUNTING RAM
sudo mkdir /mnt/ram
sudo mount -t tmpfs -o rw,size=32G tmpfs /mnt/ram
echo "Mounted RAM"

# RCLONE
curl https://rclone.org/install.sh | sudo bash
mkdir /root/.config/
mkdir /root/.config/rclone/
wget https://raw.githubusercontent.com/azel1/chives/main/rclone.conf -P /root/.config/rclone/
echo "Downloaded RClone Config"
mkdir ~/gdrive
mkdir ~/gdrive2
mkdir ~/gdrive3
mkdir ~/gdrive4
mkdir ~/gdrive5
mkdir ~/gdrive6
mkdir ~/gdrive7
apt install screen
screen -S gdrive -dm bash -c "echo 'Mounting gdrive';rclone mount gdrive:chiamain ~/gdrive --allow-non-empty"
screen -S gdrive2 -dm bash -c "echo 'Mounting gdrive2';rclone mount gdrive:chiamain ~/gdrive2 --allow-non-empty"
screen -S gdrive3 -dm bash -c "echo 'Mounting gdrive3';rclone mount gdrive:chiamain ~/gdrive3 --allow-non-empty"
screen -S gdrive4 -dm bash -c "echo 'Mounting gdrive4';rclone mount gdrive:chiamain ~/gdrive4 --allow-non-empty"
screen -S gdrive5 -dm bash -c "echo 'Mounting gdrive5';rclone mount gdrive:chiamain ~/gdrive5 --allow-non-empty"
screen -S gdrive6 -dm bash -c "echo 'Mounting gdrive6';rclone mount gdrive:chiamain ~/gdrive6 --allow-non-empty"
screen -S gdrive7 -dm bash -c "echo 'Mounting gdrive7';rclone mount gdrive:chiamain ~/gdrive7 --allow-non-empty"
echo "Finished RClone Section"

# MADMAX
cd /home
sudo apt install -y libsodium-dev cmake g++ git build-essential -y
git clone https://github.com/madMAx43v3r/chia-plotter.git
cd chia-plotter
git submodule update --init
pip install cmake --upgrade
./make_devel.sh
echo "Finished MADMAX Section"

# SWAR
mkdir /home/tmp
sudo apt-get install python3.7
cd /home
git clone https://github.com/TaijiMonster/Swar-Chia-Plot-Manager
cd Swar-Chia-Plot-Manager
pip3 install -r requirements.txt
wget https://raw.githubusercontent.com/azel1/chives/main/config.yaml
python3 manager.py start
echo -e "\033[0;31mEverything done???\033[0m"
