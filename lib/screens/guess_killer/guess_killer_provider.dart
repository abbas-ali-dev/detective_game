import 'package:detective_game/all_utils.dart';

class GuessKillerProvider extends ChangeNotifier {
  int? selectedSuspect;

  void updateSelectedSuspect(int? index) {
    selectedSuspect = index;
    notifyListeners();
  }
}
