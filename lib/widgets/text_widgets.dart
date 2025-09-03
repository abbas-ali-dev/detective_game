import 'package:detective_game/all_utils.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final bool upperCase;
  final double letterSpacing;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const MyText(
    this.text, {
    this.upperCase = false,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.color,
    this.style,
    this.fontWeight,
    this.letterSpacing = 0,
    this.decoration,
    this.overflow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? Theme.of(context).textTheme.bodySmall;

    return Text(
      upperCase ? text.toUpperCase() : text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style?.copyWith(
        letterSpacing: letterSpacing,
        fontSize: fontSize ?? style.fontSize,
        color: color ?? style.color,
        decoration: decoration,
        fontWeight: fontWeight ?? style.fontWeight,
      ),
    );
  }
}

class BorderedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color borderColor;

  const BorderedText({
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        text.toText(
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = borderColor,
          ),
        ),
        // Solid text as fill.
        text.toText(fontSize: fontSize, color: textColor),
      ],
    );
  }
}
