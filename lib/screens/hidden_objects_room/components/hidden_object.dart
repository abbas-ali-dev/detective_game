import 'package:detective_game/all_utils.dart';
import 'package:detective_game/widgets/my_dialog.dart';

class HiddenObject extends StatelessWidget {
  final HiddenObjectDetailsModel details;
  final int index;
  const HiddenObject(this.details, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wf = MediaQuery.of(context).size.width / 2208;
    final hf = MediaQuery.of(context).size.height / 1242;

    return GestureDetector(
      onTap: () {
        final provider = context.read<HiddenObjectsRoomProvider>();

        if (provider.objectToFind < provider.totalObjects) {
          final currentObject =
              provider.hiddenObjects?[provider.objectToFind].name;

          if (currentObject == details.name && details.isFound == false) {
            details.makeVisible();

            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => MyDialog(
                text:
                    'You have found the ${details.name}\nPress NEXT to continue',
                onTap: (context) {
                  Navigator.pop(context);
                  provider.nextObjectToFind();

                  if (index != 0 && index % 3 == 0) {
                    // EasyAds.instance.showAd(AdUnitType.interstitial);
                  }
                },
                imagePath: details.path,
              ),
            );
          }
        }
      },
      child: Opacity(
        opacity: 0,
        child: Image.asset(
          'assets/images/rooms/${details.path}',
          width: details.width * wf,
          height: details.height * hf,
        ),
      ),
    );
  }
}
