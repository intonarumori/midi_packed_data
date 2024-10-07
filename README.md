# MIDI Packed Data

This package implements the data packing algorithm used in many MIDI devices, specifically by Dave Smith Instruments / Sequential.
Data in MIDI SysEx messages can only use the lower 7 bits of each byte, since byte values larger than 0x7F are reserved for sytem messages.
Thus the algorithm's goal is to encode and decode byte arrays to conform to the MIDI standard while transferred in MIDI SysEx messages.

From the DSI TETRA Manual Page 67:
```
Packed Data Format
Data is packed in 8 byte “packets”, with the MS bit stripped from 7 parameter bytes, and packed into an eighth byte, which is sent at the start of the 8 byte packet.

Example:
Input Data
1 A7 A6 A5 A4 A3 A2 A1 A0
2 B7 B6 B5 B4 B3 B2 B1 B0
3 C7 C6 C5 C4 C3 C2 C1 C0
4 D7 D6 D5 D4 D3 D2 D1 D0
5 E7 E6 E5 E4 E3 E2 E1 E0
6 F7 F6 F5 F4 F3 F2 F1 F0
7 G7 G6 G5 G4 G3 G2 G1 G0

Packed MIDI data
1 00 G7 F7 E7 D7 C7 B7 A7
2 00 A6 A5 A4 A3 A2 A1 A0
3 00 B6 B5 B4 B3 B2 B1 B0
4 00 C6 C5 C4 C3 C2 C1 C0
5 00 D6 D5 D4 D3 D2 D1 D0
6 00 E6 E5 E4 E3 E2 E1 E0
7 00 F6 F5 F4 F3 F2 F1 F0
8 00 G6 G5 G4 G3 G2 G1 G0
```

# Usage
```dart
final data = Uint8List.fromList([0x01, 0x02, 0x03, 0xF0, 0xF1, 0xF2]);
final packed = PackedData.encode(data);
final unpacked = PackedData.decode(packed);
print(packed); // [56, 1, 2, 3, 112, 113, 114]
print(unpacked); // [1, 2, 3, 240, 241, 242]
```
