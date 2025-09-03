import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';
import 'package:detective_game/screens/guess_killer/components/suspect_list_view.dart';

class GuessKillerScreen extends StatelessWidget {
  static const String routeName = '/GuessKillerScreen';

  const GuessKillerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => GuessKillerProvider(),
      builder: (context, child) => Consumer<GuessKillerProvider>(
        builder: (context, provider, child) {
          return BaseScaffold(
            withCurtains: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BorderedText(
                  text: 'GUESS WHO IS KILLER',
                  fontSize: 50,
                  textColor: AppTheme.primary,
                  borderColor: AppTheme.accent,
                ),
                const VerticalSpacing(),
                const SuspectListView(),
                const VerticalSpacing(),
                _buildButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton() {
    final lastDay = DateTime.parse(PrefStorage.instance.lastDay);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return lastDay.isBefore(today)
        ? const MyButton(
            title: 'INVESTIGATE',
            isRed: true,
            titleColor: AppTheme.whiteColor,
            onTap: _onTapInvestigate,
            height: 40,
          )
        : const Text(
            'Only one person can be investigated in a day.\nCome back tomorrow to investigate further!',
            textAlign: TextAlign.center,
          );
  }

  static void _onTapInvestigate(BuildContext context) {
    final selectedSuspect = context.read<GuessKillerProvider>().selectedSuspect;
    if (selectedSuspect == null) {
      EasyLoading.showError('Select a suspect to continue');
    } else {
      // EasyAds.instance.showAd(AdUnitType.interstitial);

      context.read<GemsProvider>().minusTwoGems();
      const nextRoute = WitnessChatScreen.routeName;
      PrefStorage.instance.setCurrentScreen(nextRoute);
      PrefStorage.instance
          .setArguments(Character.values[selectedSuspect].value);
      Navigator.pushReplacementNamed(context, nextRoute);
    }
  }
}
