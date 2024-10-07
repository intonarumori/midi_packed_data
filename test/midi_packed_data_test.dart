import 'dart:typed_data';

import 'package:midi_packed_data/midi_packed_data.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {});

    test('Test packing and unpacking matches', () {
      final data = Uint8List.fromList([0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00]);

      final packed = PackedData.encode(data);
      final unpacked = PackedData.decode(packed);
      expect(data, equals(unpacked));
    });

    test('Test packing and unpacking matches with custom data length', () {
      final data = Uint8List.fromList([0x00, 0x255, 0x00, 0x255, 0x00, 0x255, 0x00, 0x255, 0x00]);
      final packed = PackedData.encode(data);
      final unpacked = PackedData.decode(packed);
      expect(data, equals(unpacked));
    });
  });
}
