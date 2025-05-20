import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends ChangeNotifier {
  static const String _useCelsiusKey = 'use_celsius';
  
  bool _useCelsius = true;
  bool get useCelsius => _useCelsius;
  
  // Initialize preferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _useCelsius = prefs.getBool(_useCelsiusKey) ?? true; // Default to Celsius
    notifyListeners();
  }
  
  // Set temperature unit
  Future<void> setUseCelsius(bool value) async {
    if (_useCelsius == value) return;
    
    _useCelsius = value;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_useCelsiusKey, value);
  }
}
