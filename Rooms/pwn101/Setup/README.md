# My Setup

You can do this manually or you can just let the scripts do it.

First run the `setup.sh` on you machine then run the `install.sh` inside the Kali Linux container

Currently I am using a MacBook Pro from 2016 and the binaries are compiled on Linux thats why I use a Kali Linux Docker Container.

## Kali Linux
I like to use a Docker Container to run Kali, where you basically get a Kali Linux Terminal to work on, because Virtual Machines's tend to be slow on my Mac and I'm used to the Terminal but VM's should do the job too.
Get Kali Linux [here](https://www.kali.org/get-kali/#kali-platforms)

## Setting up your Docker Container
First you need to get [Docker](https://www.docker.com).
After intalling Docker run the following commands

To build the image run

```
docker pull kalilinux/kali-rolling 
```

To run the container
```
docker run --name kali -dit -p PORT:PORT kalilinux/kali-rolling:latest
```
To use Kali Linux run
```    
docker exec -it kali /bin/bash 
```

replace *kali* with a name for your container

After running the Terminal you need to update and upgrade apt
```
apt -y update && apt -y upgrade
```
### Useful thing you should already know
Install [gdb](https://www.sourceware.org/gdb/), [git](https://git-scm.com), [vim](https://www.vim.org) and [checksec](https://github.com/slimm609/checksec.sh)
```
apt install -y gdb  && apt install -y git && apt install -y vim &&  apt install -y checksec
```
### pwndbg
[pwndbg](https://github.com/pwndbg) is a GDB plug-in that makes debugging with GDB easier
```
git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
```


### Python
Install [Python](https://www.python.org)
```
apt install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential 
```
```
python3 -m pip install --upgrade pip 
```

### Pwntools
[pwntools](https://docs.pwntools.com/en/stable/) is a CTF framework and exploit development library. We will use this to write python exploits.
```
python3 -m pip install --upgrade pwntools
```