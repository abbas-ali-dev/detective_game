import 'package:detective_game/all_utils.dart';

class SuspectCard extends StatefulWidget {
  final int index;
  final bool isSelected;
  final ValueChanged<int> onChanged;
  final double height;

  const SuspectCard({
    required this.index,
    required this.isSelected,
    required this.onChanged,
    this.height = 200,
    Key? key,
  }) : super(key: key);

  @override
  State<SuspectCard> createState() => _SuspectCardState();
}

class _SuspectCardState extends State<SuspectCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant SuspectCard oldWidget) {
    _isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final decoration = widget.isSelected
        ? BoxDecoration(
            color: AppTheme.primary,
            border: Border.all(width: 5.0, color: AppTheme.primary),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          )
        : null;

    return GestureDetector(
      onTap: () => setState(() {
        widget.onChanged.call(widget.index);
        _isSelected = !_isSelected;
      }),
      child: Container(
        decoration: decoration,
        child: Image.asset(
            'assets/images/characters/${Character.values[widget.index].value}.png'),
      ),
    );
  }
}
