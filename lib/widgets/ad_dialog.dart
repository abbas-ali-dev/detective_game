import 'package:detective_game/all_utils.dart';

class AdDialog extends StatelessWidget {
  const AdDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 80,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dialog.png'),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'You don\'t have enough gems.\nWatch an ad to get 2 gems now!'
                    .toText(
                  textAlign: TextAlign.center,
                  color: AppTheme.whiteColor,
                ),
                const VerticalSpacing(),
                Wrap(
                  spacing: 20,
                  children: [
                    MyButton(
                      title: 'Watch Ad',
                      onTap: (_) {
                        // final isAdShown =
                        //     EasyAds.instance.showAd(AdUnitType.rewarded);
                        context.read<GemsProvider>().addTwoGems();
                        Navigator.pop(context);
                        // if (isAdShown) {
                        // } else {
                        //   EasyLoading.showError(
                        //       'Ad could not be loaded.\nCheck your internet connection!');
                        // }
                      },
                      isRed: true,
                      height: 30,
                    ),
                    MyButton(
                      title: 'Cancel',
                      onTap: (_) => Navigator.pop(context),
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
