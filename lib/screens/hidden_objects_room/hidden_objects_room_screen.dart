import 'package:detective_game/all_utils.dart';
import 'package:detective_game/models/room_model.dart';
import 'package:detective_game/screens/hidden_objects_room/components/hidden_objects_room.dart';

class HiddenObjectsRoomScreen extends StatelessWidget {
  static const String routeName = '/HiddenObjectsRoomScreen';
  const HiddenObjectsRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = PrefStorage.instance.arguments;
    if (arg == null) {
      return Center(child: 'NO ROOM SELECTED'.toText(color: AppTheme.primary));
    }

    final room = RoomModel.fromJson(jsonDecode(arg));

    return ChangeNotifierProvider(
      create: (BuildContext context) => HiddenObjectsRoomProvider(),
      child: Consumer<HiddenObjectsRoomProvider>(
        builder: (context, provider, child) {
          return BaseScaffold(child: HiddenObjectsRoom(room));
        },
      ),
    );
  }
}
