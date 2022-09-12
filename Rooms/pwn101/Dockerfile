# Kali Linux Top10
# Docker image with kali-linux-top10 and a handful of other useful tools
# More info: https://medium.com/@infosec_stuff/kali-linux-in-a-docker-container-5a06311624eb

# docker build -t kali-image:linux  -f Dockerfile .
# docker run --name kali -dit -p 1337:1337 kali-image:linux
# docker exec -it kali /bin/zsh 
FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive
# do APT update
RUN apt -y update && apt -y upgrade && apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean && apt install -y zsh

RUN apt install -y gdb && apt install -y netcat-traditional && apt install -y checksec && apt install -y git && apt install -y vim

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential && python3 -m pip install --upgrade pip && python3 -m pip install --upgrade pwntools 
EXPOSE 1337

WORKDIR /root

CMD ["/bin/zsh"]