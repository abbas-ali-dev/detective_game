import 'package:collection/collection.dart';
import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';
import 'package:detective_game/models/witness_chat_model.dart';
import 'package:detective_game/screens/witness_chat/components/witness_chat_body.dart';
import 'package:detective_game/screens/witness_chat/components/witness_description.dart';

class WitnessChatScreen extends StatefulWidget {
  static const String routeName = '/WitnessChatScreen';
  const WitnessChatScreen({Key? key}) : super(key: key);

  @override
  State<WitnessChatScreen> createState() => _WitnessChatScreenState();
}

class _WitnessChatScreenState extends State<WitnessChatScreen> {
  int chatIndex = -1;
  String buttonTitle = 'CHAT';

  @override
  Widget build(BuildContext context) {
    final arg = PrefStorage.instance.arguments;
    final character = Character.values.firstWhere((e) => e.value == arg);

    final chat = MyMockupData.instance.witnessChats
        .firstWhere((e) => e.witness == character);

    return BaseScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
        child: Container(
          height: 285,
          width: 285 * 1.55,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/dialog.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: chatIndex == -1
                      ? WitnessDescription(
                          witness: chat.witness, description: chat.description)
                      : WitnessChatBody(
                          chat.chats[chatIndex],
                          chat.chats.asMap().containsKey(chatIndex + 1)
                              ? chat.chats[chatIndex + 1]
                              : null),
                ),
              ),
              MyButton(
                title: buttonTitle,
                onTap: (_) => onTapNext(context, chat, character),
                height: 40,
                isRed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapNext(
      BuildContext context, WitnessChatModel chat, Character character) {
    if (chatIndex == -1) {
      setState(() {
        chatIndex = 0;
        buttonTitle = 'NEXT';
      });
    } else if (chatIndex + 2 < chat.chats.length) {
      setState(() {
        chatIndex += 2;
      });
    } else {
      // EasyAds.instance.showAd(AdUnitType.interstitial);

      final room = MyMockupData.instance.rooms
          .firstWhereOrNull((e) => e.person == character);

      if (room == null) {
        PrefStorage.instance.setCurrentScreen(GuessKillerScreen.routeName);
        Navigator.pushReplacementNamed(context, ComingSoonScreen.routeName);
      } else {
        const nextRoute = HiddenObjectsRoomScreen.routeName;
        PrefStorage.instance.setCurrentScreen(nextRoute);
        PrefStorage.instance.setArguments(jsonEncode(room.toJson()));
        Navigator.pushReplacementNamed(context, nextRoute);
      }
    }
  }
}
