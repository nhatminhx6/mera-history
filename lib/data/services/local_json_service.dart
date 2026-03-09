import 'dart:convert';

import 'package:flutter/services.dart';

class LocalJsonService {
  const LocalJsonService();

  Future<List<Map<String, dynamic>>> readList(String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }
}
