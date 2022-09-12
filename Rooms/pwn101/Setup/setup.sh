#docker pull kalilinux/kali-rolling
docker run --name kali -dit -p 1337:1337 kalilinux/kali-rolling:latest
docker cp install.sh kali:/root
docker exec -it kali /bin/bash ./root/install.sh
docker exec -it kali /bin/bash