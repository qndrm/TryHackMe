docker build -t kali-image:linux  -f Dockerfile .
docker run --name kali -dit -p 1337:1337 kali-image:linux
docker exec -it kali /bin/zsh 