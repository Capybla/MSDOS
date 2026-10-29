# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0-beta.7rc1] - 2026-10-14
### :sparkles: New Features
- [`a42c158`](https://github.com/crazii/SBEMU/commit/a42c1586ee156d26b0d50e959c7732cb4128c8fd) - re-purpose intelligent 05 command for PAL *(commit by [@palxex](https://github.com/palxex))*
- [`3ed4fe0`](https://github.com/crazii/SBEMU/commit/3ed4fe019e912ce60ee8189a855aef3c49ada3e5) - **tsf**: allow SF2 override VibLFO->Pitch modulator amounts *(commit by [@palxex](https://github.com/palxex))*
- [`f7c13fa`](https://github.com/crazii/SBEMU/commit/f7c13fa34b4847bf9922467d564f2b3247849f16) - add AMD CS5535/CS5536 audio driver *(commit by [@hjnijlunsing](https://github.com/hjnijlunsing))*
- [`7c26748`](https://github.com/crazii/SBEMU/commit/7c26748d159bf3f5ffa2e7a57a7bc9340287fd49) - integrate PC Speaker emulation (andersrodrig) *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`6f0c8ea`](https://github.com/crazii/SBEMU/commit/6f0c8ea69407bef09abfa2891adf5977b3840709) - **pcspeaker**: add PC Speaker emulation via QEMM/HDPMI *(commit by [@andersrodrig](https://github.com/andersrodrig))*

### :bug: Bug Fixes
- [`e224659`](https://github.com/crazii/SBEMU/commit/e2246597f1847ad8e973d684067a7270d7ede5ef) - VMPU fix for PAL. (merge from fd5091b0ac9f36a9dbfc8a46e29428126a48510e) *(commit by [@crazii](https://github.com/crazii))*
- [`efaf1c7`](https://github.com/crazii/SBEMU/commit/efaf1c77055c706b0f211d662f25eefac7cb747d) - **pcspeaker**: reset PIT phase on divisor reload *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`a57bf2c`](https://github.com/crazii/SBEMU/commit/a57bf2c03998012f1b78cd08c42e7b103417b723) - **mixer**: use MAIN_OPLPCM in both terms of linear mix *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`042dbca`](https://github.com/crazii/SBEMU/commit/042dbca67d2d1900ac3d856f4deb05f5e7c061a7) - link *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`0fc6223`](https://github.com/crazii/SBEMU/commit/0fc6223441e07d12d2ee0050136574dee83a7911) - lower default volume in vpcspeaker.c to prevent clipping *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`327d91b`](https://github.com/crazii/SBEMU/commit/327d91bbd0d9d29e4a7b4d63bfed8265f933f55b) - **audio**: clamp linear mix output, rebalance SFX/OPL gain and lower PC Speaker volume *(commit by [@andersrodrig](https://github.com/andersrodrig))*
- [`cbdbb7c`](https://github.com/crazii/SBEMU/commit/cbdbb7c30c4c6eaf0f823ca29962341d1d49f9a2) - remove ctxfi log spam. *(commit by [@crazii](https://github.com/crazii))*

### :flying_saucer: Other Changes
- [`68cc28e`](https://github.com/crazii/SBEMU/commit/68cc28ee70dfc7a6ef2c9ab565fdd8322c0c5e7e) - Merge pull request [#192](https://github.com/crazii/SBEMU/pull/192) from palxex/pr_pal_fix_121

Re-purpose intelligent 05 command for PAL *(commit by [@crazii](https://github.com/crazii))*
- [`823fa75`](https://github.com/crazii/SBEMU/commit/823fa75e06f5bcf4de16879dcc4fbfd59c9a0b6b) - Merge pull request [#193](https://github.com/crazii/SBEMU/pull/193) from palxex/pr_allow_sf2_override_viblfotopitch

TSF: allow SF2 override VibLFO->Pitch modulator amounts *(commit by [@crazii](https://github.com/crazii))*
- [`a9e5fae`](https://github.com/crazii/SBEMU/commit/a9e5fae54177a9f35636112e7d7cf8abe6afcc0d) - Merge pull request [#197](https://github.com/crazii/SBEMU/pull/197) from andersrodrig/main

Add PC Speaker (Internal Beeper) emulation *(commit by [@crazii](https://github.com/crazii))*
- [`a20c9b4`](https://github.com/crazii/SBEMU/commit/a20c9b455c245d96bdb7322de37a673217f53266) - Merge pull request [#196](https://github.com/crazii/SBEMU/pull/196) from hjnijlunsing/feat/cs5535-audio-driver

feat: add AMD CS5535/CS5536 audio driver *(commit by [@crazii](https://github.com/crazii))*
- [`614fc10`](https://github.com/crazii/SBEMU/commit/614fc10e63001c22eaf53d46e4b2d72d62599803) - Merge pull request [#199](https://github.com/crazii/SBEMU/pull/199) from andersrodrig/main

feat(pcspeaker): add PC Speaker emulation via QEMM/HDPMI *(commit by [@crazii](https://github.com/crazii))*
- [`6113a42`](https://github.com/crazii/SBEMU/commit/6113a4242fcb2130834a1ce73db35946f5e798da) - Adding ES1370 support *(commit by [@vicokoby](https://github.com/vicokoby))*
- [`bba4ede`](https://github.com/crazii/SBEMU/commit/bba4ede577b5103e6b0351a86524fa65f0efcc21) - Merge pull request [#204](https://github.com/crazii/SBEMU/pull/204) from vicokoby/es1370-support

Adding ES1370 support *(commit by [@crazii](https://github.com/crazii))*
- [`7e21a46`](https://github.com/crazii/SBEMU/commit/7e21a4635d19b94d93036c3f7dc5276a66f09be4) - Merge pull request [#205](https://github.com/crazii/SBEMU/pull/205) from andersrodrig/main

fix: lower default volume in vpcspeaker.c to prevent clipping *(commit by [@crazii](https://github.com/crazii))*
- [`72d22e2`](https://github.com/crazii/SBEMU/commit/72d22e2b746c9c2842a8b8f80e7d459b3fd506d7) - Adding CS4281 support *(commit by [@vicokoby](https://github.com/vicokoby))*
- [`ccd6642`](https://github.com/crazii/SBEMU/commit/ccd6642d179fe39a907b641364974b3182c4bd87) - Merge pull request [#207](https://github.com/crazii/SBEMU/pull/207) from vicokoby/cs4281-support

feat: Adding CS4281 support *(commit by [@crazii](https://github.com/crazii))*
- [`ae66dd9`](https://github.com/crazii/SBEMU/commit/ae66dd9ec9b51ea512f654338f446139e0154711) - Merge pull request [#206](https://github.com/crazii/SBEMU/pull/206) from andersrodrig/main

audio: fix clipping and SFX/OPL imbalance in linear mix path *(commit by [@crazii](https://github.com/crazii))*
- [`fef3169`](https://github.com/crazii/SBEMU/commit/fef3169847b480c36b72903d14cda6ef1f484bd2) - Fix zero card_samples_per_int divisor and adjust buffer size *(commit by [@vicokoby](https://github.com/vicokoby))*
- [`9a9e9d8`](https://github.com/crazii/SBEMU/commit/9a9e9d82ebadcd400d34ccdcc02d920b8c6a13b3) - Merge pull request [#208](https://github.com/crazii/SBEMU/pull/208) from vicokoby/cs4281-fix

fix: Fix zero card_samples_per_int divisor and adjust buffer size *(commit by [@crazii](https://github.com/crazii))*
- [`412ab64`](https://github.com/crazii/SBEMU/commit/412ab64ae354c7748e904e30f172f1e6ab204df5) - Adding drivelling-spinel fix *(commit by [@vicokoby](https://github.com/vicokoby))*
- [`6103c49`](https://github.com/crazii/SBEMU/commit/6103c49b9cf3d8e93085577930c6991064654630) - Merge pull request [#210](https://github.com/crazii/SBEMU/pull/210) from vicokoby/cm8338-fix

fix: Cm8338 fix *(commit by [@crazii](https://github.com/crazii))*
- [`e8994d6`](https://github.com/crazii/SBEMU/commit/e8994d6099e71004658df3bfcca34dbe134b1b19) - Unmuting CD_IN output for CS4281 & ES1370 *(commit by [@vicokoby](https://github.com/vicokoby))*
- [`1f88a77`](https://github.com/crazii/SBEMU/commit/1f88a775507f8282760fa7ad597091beb9712182) - Merge pull request [#214](https://github.com/crazii/SBEMU/pull/214) from vicokoby/cd_in_fix

feat: Unmuting CD_IN for CS4281 & ES1370 *(commit by [@crazii](https://github.com/crazii))*

[1.0.0-beta.7rc1]: https://github.com/crazii/SBEMU/compare/1.0.0-beta.6...1.0.0-beta.7rc1

# User instructions

## Available files

If you wish to use SBEMU and its dependencies in an existing DOS installation, you'll find the necessary
files in `SBEMU.zip`.

Alternatively, `SBEMU-FD13-USB.img.xz` provides SBEMU and is dependencies preconfigured inside a compressed
bootable FreeDOS image that you can write to a USB flash drive or an SD card.

<details>
<summary>Preparing a bootable USB drive</summary>

## Preparing a bootable USB drive

The USB image can be written to a USB drive or SD card using a tool like [balenaEtcher](https://etcher.balena.io/).

The advantage of using Etcher is that you don't have to decompress the `.xz` archive first.
It will decompress such files automatically, before writing the image to the target drive.
</details>
<details>
<summary>Booting the USB image in a virtual machine</summary>

## Booting the USB image in a virtual machine

You can run the image in a VM with QEMU as follows:

```shell
unxz SBEMU-FD13-USB.img.xz
qemu-system-i386 -drive file=SBEMU-FD13-USB.img,format=raw -device AC97
```

If you wish to test Intel HDA compatibility instead of ICHx AC'97 compatibility, replace `AC97` with `intel-hda` in the last command above.
On Linux, you can include the parameter `--enable-kvm` to run the VM with hardware-assisted virtualization.

If you prefer to use another hypervisor, such as VirtualBox or VMware, you may have to convert the raw image to a supported VM image format first:

```shell
unxz SBEMU-FD13-USB.img.xz
qemu-img convert -f raw -O vmdk SBEMU-FD13-USB.img SBEMU-FD13-USB.vmdk
```

**NOTE**: Although VMs can sometimes be useful during development, testing and debugging, you should not rely on those for actual hardware compatibility testing, since the sound cards that the hypervisors emulate are themselves merely approximations of actual hardware, and will not behave like the real thing in every single corner case.
Basically, you shouldn't test emulators on other emulators.
</details>
<details>
<summary>Where can I get some DOS games to test with?</summary>

## Where can I get some DOS games to test with?

There are multiple convenient distributions out there that contain DOS games that can be distributed freely and legally.
Specifically freeware, shareware, open source and free demo versions.

Here are a few links to such distributions:

- [The PC/DOS Mini](http://vieju.net/pcdosmini/), a compilation of 100+ DOS games ready to play for free
- [GAFFA DOS Shareware/Freeware Pack](https://archive.org/details/gaffa-dos-shareware-pack) (please [donate to the Internet Archive](https://archive.org/donate/), by the way!️ ❤️)
</details>
