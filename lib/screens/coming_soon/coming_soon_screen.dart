import 'package:detective_game/all_utils.dart';

class ComingSoonScreen extends StatelessWidget {
  static const String routeName = '/ComingSoonScreen';
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Container(
        margin: const EdgeInsets.all(80),
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/story_box.png')),
        ),
        child: Center(
            child: 'Come back tomorrow to investigate next suspect!'
                .toText(fontSize: 20, color: AppTheme.whiteColor)),
      ),
    );
  }
}
