import 'package:detective_game/all_utils.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final BuildContextCallback onTap;
  final bool isRed;
  final double height;

  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleColor = AppTheme.whiteColor,
    this.isRed = false,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String button = isRed ? 'button_red' : 'button_black';
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        height: height,
        width: height * 3.14,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/buttons/$button.png')),
        ),
        child: Center(
            child: title.toText(color: titleColor, fontSize: height / 2.5)),
      ),
    );
  }
}
