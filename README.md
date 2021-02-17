# Kyber-ARM

This repository contains the reference implementation of the [Kyber](https://www.pq-crystals.org/kyber/) key encapsulation mechanism, Post Quantum Cryptography algorithms for the ARM64 architecture.

## Build

To build the project you should use a bash script `build.sh` for which you should use cmake:
```sh
./build.sh
```
The build result will be available in the `/build/ref` directory.

## Usage

To use the Kyber functions in your project, you must use the static libs that are located in the `/build/ref` directory.
For example:

```c
#include "<path_to_kyber_kef_directory>/kem.h"

int main(void)
{
    int rc = 0;
    unsigned char pk[32] = { 0 };
    unsigned char sk[32] = { 0 };

    rc = crypto_kem_keypair(pk, sk);

    return rc;
}

```


```sh
export CC=/<absolute_path_to_toolchain>/bin/aarch64-linux-gnu-gcc
$CC -DKYBER_K=2 -c your_app.c
$CC -o binary your_app.o -L. -lkyber512_ref.a
```

Cross-compile is located in toolchain directory of this repository.

## Testing

For tests you can use `./runtests.sh` script. Don't forget that the tests must be run either in the emulator or on the target platform.


