## Symmetric Encryption
Single Key. Private key algorithms where sender and receiver share the same key.
- Weaknesses
	- No non-repudiation
	- Distribution of keys
#### DES
Breaks the input into 64 bit blocks and uses transposition and substitution to create ciphertext using an effective key strength of only 56-bits.
#### 3DES
Three separate symmetric keys to encrypt, decrypt, and then encrypt the plaintext into ciphertext in order to increase the strength of DES. Total 112 bit key, technically.
#### IDEA
Symmetric block cipher which uses 64-bit blocks to encrypt plaintext into ciphertext.
#### AES
Symmetric block cipher that uses 128-bit, 192-bit, or 256-bit blocks and a matching encryption key size to encrypt plaintext into ciphertext.
#### Blowfish
Symmetric block cipher that uses 64-bit blocks and a variable length encryption key to encrypt plaintext into ciphertext.
#### Twofish
Provides the ability to use 128-bit blocks in its encryption algorithm and uses 128-bit, 192-bit, or 256-bit encryption keys.
#### Rivest Ciphers - RC Cipher Suite
Created by Ron Rivest, a cryptographer who's created six algorithms under the name RC which stands for the Rivest Cipher.
###### RC4
Symmetric stream cipher using a variable key size from 40-bits to 2048-bits that is used in SSL and WEP
###### RC5
Uses key sizes up to 2048-bits.
###### RC6
More secure than RC5 and introduced as a possible replacement for AES and DES.

## Asymmetric Encryption
Two different keys. Public key algorithms.
Strengths:
- Confidentiality
- Integrity
- Authentication
- Non-repudiation
#### Diffie-Hellman
Used to conduct key exchange and secure key distribution. Often used when creating VPN tunnels for IPSec. Susceptible to man-in-the-middle attacks, so some sort of authentication such as digital signature is suggested.
#### RSA
Relies on the mathematical difficulty of factoring large prime numbers. Supports key sizes between 1024-bits and 4096-bits. Widely used around the world.
#### ECC
Heavily used in mobile devices and low power computing devices. Based on the algebraic structure of elliptical curves over finite fields to define its keys. ECC with a 256-bit key is just as secure as RSA with a 2048-bit key.
###### ECDH
ECC version of the popular Diffie-Hellman protocol.
###### ECDHE
Uses a different key for each portion of the key establishment process inside the Diffie-Hellman key exchange.
###### ECDSA
Used as a public key encryption algorithm by the US Government in their digital signatures.

## Hybrid Implementation
Utilizes asymmetric encryption to securely transfer a private key that can then be used with symmetric encryption.

## Stream Cipher
Utilizes a keystream generator to encrypt data bit by bit using a mathematical XOR function to create ciphertext.

## Block Cipher
Breaks input into fixed-length blocks of data and performs the encryption on each block.
- Advantages
	- Easier to set up and implement
	- Less susceptible to security problems
	- Software solutions

## Hashing
One-way cryptographic function that takes an input and produces a unique message digest as its output. Always the same length (based upon chosen hashing algorithm).
#### MD5
Creates 128-bit hash value.
#### SHA-1
Creates a 160-bit hash digest, significantly reduces number of collisions.
#### SHA-2
Each version of SHA performs a different number of rounds of mathematical computations to create the hash digest.
Includes:
- SHA-224
- SHA-256
- SHA-384
- SHA-512
#### SHA-3
New family of SHA functions, and can go between 224-bits and 512-bits like SHA-2 can. Major increase in security, uses 120 rounds of computations.
#### RIPEMD (RACE Integrity Primitive Evaluation Message Digest)
Comes in 160-bit, 256-bit, and 320-bit versions.
#### HMAC (Hash-Based Message Authentication Code)
Used to check the integrity of a message and provides some level of assurance that its authenticity is real. Often paired with other algorithms to do the work.
- HMAC-MD5
- HMAC-SHA1
-  HMAC-SHA256
## Digital Signature
Verify message integrity and authenticate sender.
#### DSA
Relies upon a 160-bit message digest created by the Digital Security Algorithm.

## Hash/Password Attacks
#### Pass the Hash Attack
Hacking technique that lets the attacker authenticate to a remote server or service by using the underlying hash of a user's password instead of the password plaintext.
###### Mimikatz
Hacker tool that provides the ability to automate the process of harvesting the hashes and conducting the attack.
#### Birthday Attack
Where the attacker is able to send two different messages through a hash algorithm and it results in the same identical hash digest, referred to as a collision.
#### Dictionary Attack
Attacker tries every word from a predefined list.
#### Brute-force Attack
Tries every possible password combination.
#### Rainbow Tables
Precomputed tables for reversing cryptographic hash functions.

## Strengthening Hashes
#### Key Stretching
Mitigates a weaker key by increasing the time needed to crack it. 
#### Salting
Addition of random data into a one-way cryptographic hash to help protect against password cracking techniques.
#### Nonce
"Number used once (Nonce)" is a unique, often random number that is added to password-based authentication process.

## Public Key Infrastructure
System that creates asymmetrical key pairs of public and private keys for encryption/decryption.

## Certificate Authority
Issues digital certificates and keeps the level of trust between all of the certificate authorities around the world.

## Key Escrow
Cryptographic keys are stored in a secure third-party location, which is effectively an "escrow"
Disadvantages:
- Must be incredibly secure

## Digital Certificates
#### Wildcard Certificate
Allows all of the subdomains to use the same public key certificate and have it displayed as valid.
#### SAN Field (Subject Alternate Name)
Certificate that specifies what additional domains and IP addresses are going to be supported.
#### Single-Sided Certificate
Only requires the server to be validated.
#### Dual-Sided Certificate
Requires both the server and the user to be validated.
#### Self-Signed Certificate
Digital certificate that is signed by the same entity whose identity it certifies.
#### Third-Party Certificate
Digital certificate issued and signed by a trusted certificate authority (CA).
#### Root of Trust
Each certificate is validated using the concept of a root of trust or the chain of trust
#### Certificate Authority
Trusted third party who is going to issue digital certificates.
#### Registration Authority
Requests identifying information from the user and forwards that certificate request up to the certificate authority to create the digital certificate.
#### Certificate Signing Request
A block of encoded text that contains information about the entity requesting the certificate.
Includes:
- Organization name
- Domain name
- Locality
- Country
#### Certificate Revocation List
Serves as an online list of digital certificates that the certificate authority has already revoked.
#### OCSP (Online Certificate Status Protocol)
Allows to determine the revocation status of any digital certificate using its serial number.
#### OCSP Stapling
Allows the certificate holder to get the OCSP record from the server at regular intervals.
#### Public Key Pinning
Allows an HTTPS website to resist impersonation attacks from users who are trying to present fraudulent certificates.
#### Key Escrow
Occurs when a secure copy of a user's private key is being held.
#### Key Recovery Agent
Specialized type of software that allows the restoration of a lost or corrupted key to be performed.
## Blockchain
A shared immutable ledger for recording transactions, tracking assets, and building trust. IBM is seeking to bring blockchain into the commercial environment, using permissioned blockchain.
#### Public Ledger
A record-keeping system that maintains participants' identities in a secure and anonymous format.
#### Smart Contracts
Self-executing contracts where the terms of agreement or conditions are directly written into the code.
Decentralized nature of blockchain ensures that once a smart contract is deployed, it cannot be altered and is tamper-proof/trustworthy.
#### Permissioned Blockchain
Used for business transactions and it promotes new levels of trust and transparency using this immutable public ledgers.

## Encryption Tools
#### TPM (Trusted Platform Module)
Dedicated microcontroller designed to secure hardware through integrated cryptographic keys.
#### HSM (Hardware Security Module)
Physical device that safeguards and manages digital keys, primarily used for mission-critical situations like financial transactions.
#### Key Management System
Integrated approach for generating, distributing, and managing cryptographic keys for devices and applications.
#### Secure Enclave
Co-processor integrated into the main processor of some devices, designed with the sole purpose of ensuring data protection.

## Obfuscation
#### Steganography
#### Tokenization
Transformative technique in data protection that involves substituting sensitive data elements with non-sensitive equivalents, called tokens, which have no value.
#### Data Masking
Used to protect data by ensuring that it remains recognizable but does not actually include sensitive information. Prevalent in industries handling vast amounts of personal data.

## Cryptographic Attacks
#### Downgrade Attack
Aims to force a system into using a weaker or older cryptographic standard or protocol than what its currently utilizing.
#### Collision Attack
Aims to find two different inputs that produce the same hash output.
#### Quantum Computing
A computer that uses quantum mechanics to generate and manipulate quantum bits (qubits) in order to access enormous processing power.
###### Post-quantum Cryptographic Standards
- For General Use
	- CRYSTALS-Kyber Algorithm
- For Digital Signatures
	- CRYSTALS-Dilithium
	- FALCON
	- SPHINCS+