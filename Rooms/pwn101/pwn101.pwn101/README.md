After downaloading pwn101.pwn101 from TryHackMe we copy the file to our Kali container with this command

```shell
docker cp ~/PathToYourFile ContainerName:/PathToFile
```
in my case it's

```shell
docker cp ~/pwn101/pwn101.pwn101   kali:/root/pwn101
```

No to execute the programm we have to make the file executable

```shell
chmod +x pwn101.pwn101
```
Now let's just run it and input a random number of A's

![Start pwn101.pwn101](https://github.com/qndrm/TryHackMe/blob/main/Rooms/pwn101/pwn101.pwn101/pictures/start-pwn101.png "Start the program")

Okay as it seems the program terminated perfectly fine.

Let's use gdb to disassemble some parts of the program to see what it is doing.

![disassemble main](https://github.com/qndrm/TryHackMe/blob/main/Rooms/pwn101/pwn101.pwn101/pictures/disassemble-main.png "disassemble main")

In line <+4> we can see that the stack is being pushed 0x40 (64<sub>10 (in decimal)</sub>) bytes down meaning the stack has 64 bytes of storage.

The programm is basically just printing text before it waits for our input in line <+71>
```shell
0x00000000000008d5 <+71>:	call   0x6d0 <gets@plt>
```
Then it compares if 0x539 is equal to the stack cell at `rbp-0x4`, in line <+8> 0x539 has been move into that cell

```shell
0x00000000000008da <+76>:	cmp    DWORD PTR [rbp-0x4],0x539
```

If these two values are not equal then we jump to <+107> where we get some message and after that we get access to the shell in <+126> with the system command

```shell
0x000000000000090c <+126>:	call   0x6c0 <system@plt>
```

Let's set a breakpoint after gets, so the program starts after we give it some input.

```shell
pwndbg> b *main+76
```
Run the programm with run or just r

```shell
pwndbg> run 
```
Now we give let's try a input of letters beginning with A's

![Input](https://github.com/qndrm/TryHackMe/blob/main/Rooms/pwn101/pwn101.pwn101/pictures/give-input.png "give input")

After we press enter the program will stop at our breakpoint
![Breakpoint](https://github.com/qndrm/TryHackMe/blob/main/Rooms/pwn101/pwn101.pwn101/pictures/breakpoint.png "breakpoint")

