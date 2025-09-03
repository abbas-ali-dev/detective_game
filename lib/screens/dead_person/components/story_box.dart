import 'package:collection/collection.dart';
import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';

class StoryBox extends StatefulWidget {
  final List<String> story;

  const StoryBox(this.story, {Key? key}) : super(key: key);

  @override
  State<StoryBox> createState() => _StoryBoxState();
}

class _StoryBoxState extends State<StoryBox> {
  late String storyLine;
  int storyIndex = 0;
  String buttonTitle = 'NEXT';

  @override
  void initState() {
    super.initState();
    storyLine = widget.story[storyIndex++];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120 * 3.77,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/story_box.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: storyLine.toText(color: AppTheme.whiteColor)),
            const HorizontalSpacing(),
            MyButton(
                title: buttonTitle, onTap: onTapNext, isRed: true, height: 30),
          ],
        ),
      ),
    );
  }

  void onTapNext(BuildContext context) {
    if (storyIndex < widget.story.length) {
      setState(() {
        storyLine = widget.story[storyIndex++];

        if (storyIndex == widget.story.length) buttonTitle = 'INVESTIGATE';
      });
    } else {
      // EasyAds.instance.showAd(AdUnitType.interstitial);

      final room = MyMockupData.instance.rooms
          .firstWhereOrNull((e) => e.person == Character.colonel);

      if (room == null) {
        const nextRoute = GuessKillerScreen.routeName;
        PrefStorage.instance.setCurrentScreen(nextRoute);
        Navigator.pushReplacementNamed(context, nextRoute);
      } else {
        context.read<GemsProvider>().minusTwoGems();
        const nextRoute = HiddenObjectsRoomScreen.routeName;
        PrefStorage.instance.setCurrentScreen(nextRoute);
        PrefStorage.instance.setArguments(jsonEncode(room.toJson()));
        Navigator.pushReplacementNamed(context, nextRoute);
      }
    }
  }
}
