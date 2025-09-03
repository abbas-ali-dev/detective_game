import 'package:detective_game/all_utils.dart';
import 'package:detective_game/screens/guess_killer/components/locked_suspect_card.dart';
import 'package:detective_game/screens/guess_killer/components/suspect_card.dart';

class SuspectListView extends StatelessWidget {
  const SuspectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: Character.values.length,
        itemBuilder: (BuildContext context, index) =>
            buildSuspectSelector(index),
        separatorBuilder: (BuildContext context, index) =>
            const HorizontalSpacing(of: 10),
      ),
    );
  }

  Widget buildSuspectSelector(int index) {
    return Selector<GuessKillerProvider, int?>(
      shouldRebuild: (previous, next) => previous != next,
      selector: (context, provider) => provider.selectedSuspect,
      builder: (context, id, child) => buildSuspectCard(context, index),
    );
  }

  Widget buildSuspectCard(BuildContext context, int index) {
    final provider = context.read<GuessKillerProvider>();
    void onChanged(int? index) => provider.updateSelectedSuspect(index);
    final selected = provider.selectedSuspect == index;

    if (Character.values[index] == Character.colonel) return kEmptyWidget;

    final level = PrefStorage.instance.currentLevel;
    final lastDay = DateTime.parse(PrefStorage.instance.lastDay);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (level + 1 == index && lastDay.isBefore(today)) {
      return SuspectCard(
          index: index, isSelected: selected, onChanged: onChanged);
    } else if (level + 1 > index) {
      return LockedSuspectCard(index: index, isCompleted: true);
    } else {
      return LockedSuspectCard(index: index);
    }
  }
}
