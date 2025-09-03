import 'package:detective_game/all_utils.dart';

class GemsProvider extends ChangeNotifier {
  int gems = PrefStorage.instance.gems;

  void renewGems() {
    gems = 4;
    PrefStorage.instance.renewGems();
    notifyListeners();
  }

  void addTwoGems() {
    gems += 2;
    PrefStorage.instance.addTwoGems();
    notifyListeners();
  }

  void minusTwoGems() {
    gems -= 2;
    PrefStorage.instance.minusTwoGems();
    notifyListeners();
  }
}
