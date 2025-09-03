import 'package:detective_game/all_utils.dart';
import 'package:detective_game/widgets/ad_dialog.dart';
import 'package:detective_game/widgets/my_dialog.dart';

class HintButton extends StatelessWidget {
  final HiddenObjectDetailsModel details;

  const HintButton(this.details, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => PrefStorage.instance.gems > 1
              ? MyDialog(
                  imagePath: details.path,
                  text:
                      'Here\'s an image. Find the ${details.name} in the room.',
                  onTap: (context) {
                    context.read<GemsProvider>().minusTwoGems();
                    Navigator.pop(context);
                  },
                  buttonTitle: 'OKAY',
                )
              : const AdDialog(),
        );
      },
      child: Image.asset('assets/images/buttons/hint_button.png', height: 40),
    );
  }
}
