apt -y update && apt -y upgrade
apt install -y gdb  && apt install -y git && apt install -y vim &&  apt install -y checksec
git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
apt install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential 
python3 -m pip install --upgrade pip 
python3 -m pip install --upgrade pwntoolscd

cd /root
rm -f install.sh