I download the file and check what it is:

```php
file <FILE_NAME>
```

`0x41haz-1640335532346.0x41haz: ELF 64-bit MSB *unknown arch 0x3e00* (SYSV)`

**What is 0x41haz.0x41haz: ELF 64-bit MSB _unknown arch 0x3e00_ (SYSV)?**

- **ELF:** Executable Linkable Format it is a common format for executables in Linux/Unix.

- **64-bit:** This indicates that the ELF file is designed to run on 64-bit architectures.

- **MSB:** This refers to the endianness of the file. Most significant bit first means that the most significant byte (bit) of multi-byte data is stored at the lowest memory address. This endianness is commonly used in big-endian architectures.

- **unknown arch 0x3e00:** This means that the given file does not correspond to any architecture.

- **SYSV:** ABI (Application Binary Interface) used in the ELF file. “SYSV” stands for System V, which is a standard Unix ABI used in many Linux/Unix systems.

![[IMG/Pasted image 20241002073936.png]]

I copy the file so i have a backup and then run hexeditor:

```php
hexeditor 0x41haz-1640335532346.0x41haz
```

![[IMG/Pasted image 20241002074244.png]]

I change the fifth byte so it's 32bit then save and exit the hex editor. I re-run file to see what the output is.

```php
file 0x41haz-1640335532346.0x41haz
```

`0x41haz-1640335532346.0x41haz: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=6c9f2e85b64d4f12b91136ffb8e4c038f1dc6dcd, for GNU/Linux 3.2.0, stripped`

- I don't think strings will help me because it's been stripped, but i need to verify that. I'll open the file with ghidra and take a look.

I try to clean up the code a little bit so i can see what it's doing.

![[IMG/Pasted image 20241002081053.png]]

0xd is hex for 13.

The variables on lines 13/15 contain 13 characters: `fg$52@@2@&TsL`
I try the combination but it doesn't work, i should check to see if it's a different endianness. 

`fg$52@@2` -> `2@@25$gf`
`@&Ts` -> `sT&@`
`L`
Which becomes: `2@@25$gfsT&@L`

![[IMG/Pasted image 20241002082201.png]]

This completes the task. I add the format to the password and submit it. 
`thm{2@@25$gfsT&@L}`

---

**Completed:** _08:23 2024-10-02_


