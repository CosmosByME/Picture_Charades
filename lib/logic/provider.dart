import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  final SharedPreferencesWithCache storage;
  MainProvider({required this.storage});
  int _currentIndex = 0;
  int _money = 0;
  int _level = 0;
  int get currentIndex {
    return _currentIndex;
  }

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  int get money {
    return storage.getInt('money') ?? _money;
  }

  int get level {
    return storage.getInt('level') ?? _level;
  }

  void updateMoney(int newMoney) async {
    _money = newMoney;
    await storage.setInt('money', _money);
    notifyListeners();
  }

  void updateLevel(int newLevel) async {
    _level = newLevel;
    await storage.setInt('level', _level);

    notifyListeners();
  }
}
