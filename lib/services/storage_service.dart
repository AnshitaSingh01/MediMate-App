import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/medicine.dart';

class StorageService {
  static const String _key = 'medicines';

  static Future<void> saveMedicine(Medicine medicine) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> medicines = prefs.getStringList(_key) ?? [];
    medicines.add(jsonEncode(medicine.toJson()));
    await prefs.setStringList(_key, medicines);
  }

  static Future<List<Medicine>> getMedicines() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> medicines = prefs.getStringList(_key) ?? [];
    return medicines.map((m) => Medicine.fromJson(jsonDecode(m))).toList();
  }

  static Future<void> removeMedicineById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> medicines = prefs.getStringList(_key) ?? [];
    medicines.removeWhere((m) {
      final med = Medicine.fromJson(jsonDecode(m));
      return med.id == id;
    });
    await prefs.setStringList(_key, medicines);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
