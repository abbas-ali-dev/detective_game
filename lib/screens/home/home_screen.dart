import 'package:detective_game/all_screens.dart';
import 'package:detective_game/all_utils.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastDay = DateTime.parse(PrefStorage.instance.lastDay);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (lastDay.isBefore(today)) {
      context.read<GemsProvider>().renewGems();
    }

    return BaseScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const BorderedText(
            text: 'WHO IS KILLER?',
            fontSize: 80,
            textColor: AppTheme.primary,
            borderColor: AppTheme.accent,
          ),
          'A way towards adventure!'
              .toText(fontSize: 25, color: AppTheme.accent, upperCase: true),
          _buildButton(context),
        ],
      ),
    );
  }

  static Widget _buildButton(BuildContext context) {
    final routeName = PrefStorage.instance.currentScreen;

    if (routeName == null) {
      return const MyButton(
        title: 'START',
        onTap: _onTapStart,
        titleColor: AppTheme.primary,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        MyButton(
          title: 'RESTART',
          onTap: _onTapStart,
          titleColor: AppTheme.primary,
        ),
        HorizontalSpacing(),
        MyButton(
          title: 'RESUME',
          onTap: _onTapResume,
          titleColor: AppTheme.whiteColor,
        ),
      ],
    );
  }

  static void _onTapStart(BuildContext context) {
    // EasyAds.instance.showAd(AdUnitType.interstitial);

    context.read<GemsProvider>().renewGems();

    const nextRoute = DeadPersonScreen.routeName;
    PrefStorage.instance.setCurrentScreen(nextRoute);
    Navigator.pushNamed(context, nextRoute);
  }

  static void _onTapResume(BuildContext context) {
    // EasyAds.instance.showAd(AdUnitType.interstitial);

    Navigator.pushNamed(context, PrefStorage.instance.currentScreen!);
  }
}
