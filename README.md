# VPN PI - Secure VPN solution for Raspberry PI 4

VPN PI is an IKEv2 VPN solution for the raspberry PI 4 that tries to be secure, dynamic and usable.

Features
------------------------------------------------------
+ (Complete) Compatible with MacOS native VPN client
+ (Complete) Compatible with iOS native VPN client
+ (Pending) Compatible with Windows native VPN client
+ (Complete) EAP-MSCHAPV2 support
+ (Pending) EAP-TLS support
+ (Complete) DDNS TXT Challenge Certificate Enrollment
+ (Pending) Automatic Certificate Enrollment
+ (Pending) Automatic DDNS Updates
+ (Complete) NTP Setup
+ (Pending) NTP Configurability
+ (Pending) Pruned Cipher Suites
+ (Pending) Multi Factor support
+ (Complete) Buildroot LTS package revisions for minimal CVE exposure
+ (Complete) PIC/PIE libraries for hardened user binaries
+ (Complete) Fortify Full Source for hardened user binaries
+ (Complete) RELRO Full for hardened user binaries
+ (Pending) AppArmor Policy

Build
------------------------------------------------------
```
cd ~/
git clone http://git.buildroot.net/git/buildroot.git
git clone git@github.com:driechers/vpn_pi.git
cd ~/buildroot
make BR2_EXTERNAL=../vpn_pi/ O=../build/raspberrypi4_vpn_pi_defconfig raspberrypi4_vpn_pi_defconfig
cd ../build/raspberrypi4_vpn_pi_defconfig
make
```

Certificate Enrollment
------------------------------------------------------
```
export Dynu_ClientId="Your DYNU Client ID"
export Dynu_Secret="Your DYNU Secret"
acme.sh --issue --dns dns_dynu -d Your.URL.From.ddns
```
