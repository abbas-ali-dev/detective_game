import 'package:detective_game/all_utils.dart';

class LockedSuspectCard extends StatelessWidget {
  final int index;
  final double height;
  final bool isCompleted;

  const LockedSuspectCard({
    required this.index,
    this.height = 200,
    this.isCompleted = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height / 1.33,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/characters/${Character.values[index].value}.png'),
        ),
      ),
      child: Center(
        child: Icon(
          isCompleted ? Icons.done_outline : Icons.lock,
          color: isCompleted ? Colors.green : Colors.white70,
          size: 100,
        ),
      ),
    );
  }
}
