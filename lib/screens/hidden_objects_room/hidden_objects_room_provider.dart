import 'package:detective_game/all_utils.dart';

class HiddenObjectsRoomProvider extends ChangeNotifier {
  int totalObjects = 0;
  int objectToFind = 0;
  List<HiddenObjectDetailsModel>? hiddenObjects;

  void nextObjectToFind() {
    objectToFind++;
    notifyListeners();
  }

  void updateHiddenObjects(List<HiddenObjectDetailsModel> list) {
    hiddenObjects = list;
    totalObjects = list.length;
  }
}
