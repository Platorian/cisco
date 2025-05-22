# Linux
### Using the ‘dd’ Command -  Zero Fill

The ‘dd’ command in Linux is a versatile and powerful tool used for copying and converting data. It can also be used for disk wiping by writing zeros over an entire disk. The basic syntax for zero filling a disk using ‘dd’ is as follows:

```sh
sudo dd if=/dev/zero of=/dev/sdX bs=1M status=progress
```

In this command, replace `/dev/sdX` with the actual device identifier for your disk. The `bs=1M` sets the block size to 1 megabyte, and `status=progress` will display the progress of the wipe.
### Using the ‘dd’ Command - urandom

If you are wiping your hard drive for security, you should populate it with random data rather than zeros (This is going to take even longer than the first example.)

```sh
dd if=/dev/urandom of=/dev/sdX bs=1M 
```
- replace X with the target drive letter

Find the drive name in Linux:

```sh
lsblk
```

### Wipe Partitions

Filling the second partition on the /dev/sda disk with all zeros:

```sh
dd if=/dev/zero of=/dev/sdX2 bs=1M
```

Replace X with the target drive letter.

**2**. Filling the third partition with random data:

```sh
dd if=/dev/urandom of=/dev/sdX3 bs=1M
```

Replace X with the target drive letter.

## Erasing Disk Using shred Command

We start with the `shred` command because it is one of the best ways to erase private data securely on a Linux system.

Simply put, the command helps overwrite the data several times with random bits (by default, `shred` uses “_/dev/urandom_” for random data) to prevent data recovery.

If you want to erase a device that is present as “_/dev/sda_” on your Linux system, the command would be as follows:

```sh
sudo shred -v /dev/sda
```
- We’ve also included the “_-v_” (“_–verbose_“) option to see the disk wipe operation in detail

Fundamentally, the more times the data is overwritten, the less likely it is that any remnants can be recovered. However, completing these three subsequent cycles can be lengthy, especially if you do them, for example, on large terabyte disk arrays. You may have to wait for days for the process to be completed.

We can specify `shred` to perform only one loop (which is quite sufficient in most cases) using the “_-n_” (“_–iterations=N_“) option:

```sh
sudo shred -v -n 1 /dev/sda
```

The command provides the clever “_-z_” option, which adds a final overwrite pass with zeros after completing the random data overwrites. Why do you need it?

It’s simple. Overwriting with zeros can mask the shredding process, making the disk look as if the file was never securely deleted. This can be useful if you don’t want to draw attention to the fact that sensitive data was erased. Let’s give it a try.

```sh
sudo shred -v -n 1 -z /dev/sda
```

## Erasing Disk Using wipe Command

Another approach to completely erasing data from your disk is with the wipe command. As the name suggests, it is used to wipe data from a disk.

Under the hood, the wipe command uses a series of overwrite passes to obliterate the data. So, it doesn’t just write zeros or ones; it uses complex patterns and random data (34 patterns are used, of which eight are random) to overwrite the file’s contents multiple times and flush the cache.

This method adheres to data sanitization standards, making it exceedingly hard (practically almost impossible) for data recovery tools to reconstruct the original information.

On most Linux systems, the wipe command is not installed by default, so you must first install it using your package manager, such as APT, DNF, Pacman, etc. Search for a package named “wipe” and install it.

Next, using the command is relatively straightforward. Just run it, followed by the path to the disk:

```sh
sudo wipe /dev/sda
```

It’s worth noting that while the wipe command is highly reliable for securely deleting data, it can be very time-consuming because of the large number of loops (34 passes) it performs by default. Simply put, running it on terabyte-sized disks could take several days to finish.

The good news is that, similar to the shred command, you can speed things up by reducing the number of passes.

Using the “-q” option will tell wipe only to make (by default) 4 passes, writing random data. However, combining it with the “-Q <number_of_passes>” lets you set the number of passes for quick wiping.

Here’s what the command looks like if we reduce the passes to just one:

```sh
wipe -q -Q 1 /dev/sda
```

---
# Windows

Show options:

```cmd
format /?
```

At the prompt, type the following, followed by **Enter**:

```cmd
 format e: /fs:NTFS /p:2
```
- **/p:**_count_ - This format command option writes zeros to every sector of the  
_drive_
- **/fs:**_file-system_ - This option specifies the file system you want to format the drive: to. Options for file-system include FAT, FAT32, exFAT, NTFS, or UDF

The format command used in this way will **format the E drive** with the **NTFS** file system and write zeros to every sector of the drive twice. If you're formatting a different drive, change _e_ to whatever drive letter you need.

Enter the volume label of the drive you're formatting when asked, and then press Enter. The volume label is not case sensitive.

If you don't know the volume label, cancel the format using Ctrl+C and then see How to Find the Volume Label of a Drive From the Command Prompt. 

**Note: You will need to know the volume label.**

### How to Find a Drive's Volume Label or Serial Number From the Command Prompt

At the prompt, execute the vol command as shown below, and then press Enter:

```cmd
vol c:
```

Immediately below the prompt, you should see two lines similar to the following:

`Volume in drive C is Windows`

`Serial Number is C1F3-A79E`

As you can see, the volume label for the _C drive_ is _Windows_ and the volume serial number is _C1F3-A79E_.

**Note: If you instead see _Volume in drive C has no label_ then it means exactly that. Volume labels are optional and your drive happens to not have one.**

