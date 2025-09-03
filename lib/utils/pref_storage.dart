import 'package:detective_game/all_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefStorage {
  static final PrefStorage _instance = PrefStorage._internal();
  static PrefStorage get instance => _instance;

  factory PrefStorage() {
    return _instance;
  }
  PrefStorage._internal();

  static late SharedPreferences _prefs;

  static const _currentScreen = 'currentScreen';
  static const _arguments = 'arguments';
  static const _currentLevel = 'currentLevel';
  static const _gems = 'gems';
  static const _lastDay = 'lastDay';

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setCurrentScreen(String screen) =>
      _prefs.setString(_currentScreen, screen);

  String? get currentScreen => _prefs.getString(_currentScreen);

  Future<bool> setArguments(String arguments) =>
      _prefs.setString(_arguments, arguments);

  String? get arguments => _prefs.getString(_arguments);

  Future<bool> setCurrentLevel(int level) =>
      _prefs.setInt(_currentLevel, level);

  Future<bool> updateCurrentLevel() =>
      _prefs.setInt(_currentLevel, currentLevel + 1);

  int get currentLevel => _prefs.getInt(_currentLevel) ?? 0;

  Future<bool> renewGems() => _prefs.setInt(_gems, 4);

  Future<bool> addTwoGems() => _prefs.setInt(_gems, gems + 2);
  Future<bool> minusTwoGems() => _prefs.setInt(_gems, gems - 2);

  int get gems => _prefs.getInt(_gems) ?? 4;

  Future<bool> setLastDay(String date) => _prefs.setString(_lastDay, date);

  String get lastDay => _prefs.getString(_lastDay) ?? DateTime.now().toString();
}
