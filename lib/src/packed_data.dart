class PackedData {
  static List<int> encode(List<int> data) {
    final packedData = <int>[];
    for (var i = 0; i < data.length; i += 7) {
      var topBits = 0;
      for (var j = 0; j < 7; j++) {
        if (i + j < data.length) {
          topBits |= (data[i + j] & 0x80) >> (7 - j);
        }
      }
      packedData.add(topBits);
      for (var j = 0; j < 7; j++) {
        if (i + j < data.length) {
          packedData.add(data[i + j] & 0x7F);
        }
      }
    }
    return packedData;
  }

  static List<int> decode(List<int> packedData) {
    final data = <int>[];
    int index = 0;
    int topBits = 0;
    for (final byte in packedData) {
      if (index % 8 == 0) {
        topBits = byte;
      } else {
        final byteIndex = (index % 8) - 1;
        data.add(((topBits >> (byteIndex) & 0x1) << 7) | byte);
      }
      index++;
    }
    return data;
  }
}
