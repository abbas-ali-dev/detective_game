import 'package:detective_game/all_utils.dart';

class WitnessDescription extends StatelessWidget {
  final Character witness;
  final String description;

  const WitnessDescription({
    required this.witness,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset('assets/images/characters/${witness.value}.png'),
          ),
          const VerticalSpacing(),
          description.toText(
              color: AppTheme.whiteColor, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
