import 'dart:typed_data';

import 'package:midi_packed_data/midi_packed_data.dart';

void main() {
  final data = Uint8List.fromList([0x01, 0x02, 0x03, 0xF0, 0xF1, 0xF2]);
  final packed = PackedData.encode(data);
  final unpacked = PackedData.decode(packed);
  print(packed);
  print(unpacked);
}
