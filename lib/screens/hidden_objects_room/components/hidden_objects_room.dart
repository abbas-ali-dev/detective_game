import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';
import 'package:detective_game/models/room_model.dart';
import 'package:detective_game/screens/hidden_objects_room/components/hidden_object.dart';
import 'package:detective_game/screens/hidden_objects_room/components/hint_button.dart';

class HiddenObjectsRoom extends StatelessWidget {
  final RoomModel roomDetails;
  const HiddenObjectsRoom(this.roomDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wf = MediaQuery.of(context).size.width / 2208;
    final hf = MediaQuery.of(context).size.height / 1242;

    final List<Positioned> _positionedObjects = [];
    for (int i = 0; i < roomDetails.hiddenObjects.length; i++) {
      final o = roomDetails.hiddenObjects[i];
      _positionedObjects.add(
        Positioned(
          left: o.x * wf,
          top: o.y * hf,
          child: HiddenObject(o, i),
        ),
      );
    }

    return Consumer<HiddenObjectsRoomProvider>(
      builder: (context, provider, child) {
        provider.updateHiddenObjects(roomDetails.hiddenObjects);
        return SizedBox(
          width: 2208 * wf,
          height: 1242 * hf,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/rooms/${roomDetails.person.value}/room.png',
                fit: BoxFit.fill,
              ),
              ..._positionedObjects,
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  height:
                      provider.objectToFind == roomDetails.hiddenObjects.length
                          ? 90
                          : 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/story_box.png'),
                    ),
                  ),
                  child: Center(
                    child: provider.objectToFind ==
                            roomDetails.hiddenObjects.length
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'Congratulations\nYou have found all the objects'
                                  .toText(
                                      textAlign: TextAlign.center,
                                      color: AppTheme.whiteColor),
                              const HorizontalSpacing(of: 10),
                              MyButton(
                                title: 'Next',
                                onTap: (_) {
                                  if (roomDetails.person == Character.colonel) {
                                    // EasyAds.instance
                                    //     .showAd(AdUnitType.interstitial);

                                    const nextRoute =
                                        GuessKillerScreen.routeName;

                                    final prefs = PrefStorage.instance;
                                    prefs.setCurrentScreen(nextRoute);

                                    final now = DateTime.now();
                                    prefs.setLastDay(
                                        DateTime(now.year, now.month, now.day)
                                            .toString());

                                    Navigator.pushReplacementNamed(
                                        context, nextRoute);
                                  } else {
                                    // EasyAds.instance
                                    //     .showAd(AdUnitType.interstitial);

                                    final prefs = PrefStorage.instance;
                                    prefs.setCurrentScreen(
                                        GuessKillerScreen.routeName);
                                    prefs.updateCurrentLevel();

                                    final now = DateTime.now();
                                    prefs.setLastDay(
                                        DateTime(now.year, now.month, now.day)
                                            .toString());

                                    Navigator.pushReplacementNamed(
                                        context, ComingSoonScreen.routeName);
                                  }
                                },
                                height: 30,
                                isRed: true,
                              ),
                            ],
                          )
                        : 'Find ${roomDetails.hiddenObjects[provider.objectToFind].name}'
                            .toText(color: AppTheme.whiteColor),
                  ),
                ),
              ),
              _buildHintButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHintButton(BuildContext context) {
    final provider = context.read<HiddenObjectsRoomProvider>();
    if (provider.objectToFind == provider.totalObjects) return kEmptyWidget;

    return Positioned(
      right: 20,
      bottom: 10,
      child: HintButton(
        roomDetails.hiddenObjects[provider.objectToFind],
      ),
    );
  }
}
