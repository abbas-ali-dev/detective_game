import 'package:detective_game/all_utils.dart';

class MyDialog extends StatelessWidget {
  final String text;
  final String buttonTitle;
  final String imagePath;
  final BuildContextCallback onTap;

  const MyDialog({
    required this.text,
    required this.onTap,
    required this.imagePath,
    this.buttonTitle = 'NEXT',
    Key? key,
  }) : super(key: key);

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
                Image.asset(
                  'assets/images/rooms/$imagePath',
                  height: 80,
                ),
                const VerticalSpacing(of: 10),
                text.toText(
                    textAlign: TextAlign.center, color: AppTheme.whiteColor),
                const VerticalSpacing(of: 10),
                MyButton(
                    title: buttonTitle, onTap: onTap, isRed: true, height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
