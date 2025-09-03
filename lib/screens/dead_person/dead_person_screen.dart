import 'package:detective_game/all_utils.dart';
import 'package:detective_game/screens/dead_person/components/story_box.dart';

class DeadPersonScreen extends StatelessWidget {
  static const String routeName = '/DeadPersonScreen';
  const DeadPersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withCurtains: true,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 3,
              child: Image.asset('assets/images/scenes/dead_person.png'),
            ),
            const Flexible(
              flex: 2,
              child: StoryBox(mainStory),
            ),
          ],
        ),
      ),
    );
  }

  static const mainStory = [
    'Found dead colonel was a brave warrior with a grey moustache.\nWomen were definitely one of his weaknesses.\nLoud voice harsh manners and an unkind look.',
    'He arranged a party in his castle and invited 7 of his friends to stay in different rooms.',
    'The colonel rooms and 7 other rooms have clues, which you can find during investigation.\nYou can also question different suspects.',
  ];
}
