import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';

final Map<String, WidgetBuilder> routes = {
  ComingSoonScreen.routeName: (context) => const ComingSoonScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DeadPersonScreen.routeName: (context) => const DeadPersonScreen(),
  GuessKillerScreen.routeName: (context) => const GuessKillerScreen(),
  WitnessChatScreen.routeName: (context) => const WitnessChatScreen(),
  HiddenObjectsRoomScreen.routeName: (context) =>
      const HiddenObjectsRoomScreen(),
};
