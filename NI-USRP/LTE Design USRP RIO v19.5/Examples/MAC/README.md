# Simple L2 application demonstrating use of NIAPI for LTE #


This is a simple application that acts as LTE L2 stub. It works in DL mode and has the following functionality:

- Receive timing trigger from L1
- Send DL TX configuration
- Send DL TX payload
- Receive DL RX payload



## Installation / Dependencies ##

Log into the USRP 2974 target as root
run
opkg update
opkg install g++
opkg install libstdc++-staticdev

### Build `L2_simple_DL` ###

copy MAC folder to USRP 2974 target
run make install in the MAC folder

## Usage ##

Open `LTE Host DL RT.gvi` from `LTE v2.2`.

In the diagram, make sure the constant `MAC Stub enabled` is set to `false`.
The command edit should read "L2_simple_DL  60000 14 FFFF"

The three command line parameters are

- `NPACKETS` -- indicates how many packets should be processed
- `MCS` -- MCS for the transmission (largest supported value is `28`)
- `PRBMASK_AS_HEX` -- Hexadecimal number indicating which PRB are active (25 bits, 1 bit = 4 PRB, largest supported value is `0x1FFFFFF`) 

In `LTE Host DL RT.gvi`, now turn on the *UE Receiver* and the *eNB Transmitter*.

- The constellation is according to the `MCS`. (Figure shows example for `28`, i.e., 64 QAM)
- The spectrum is occupied according to the pattern specified through `PRBMASK_AS_HEX`. (Figure shows an example for `0x1AFFAA1`)
- The `SFN` and `TTI` counters are running.
- The `RX CRC ok` flag is `true`.

