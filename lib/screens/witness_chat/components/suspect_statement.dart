import 'package:detective_game/all_utils.dart';
import 'package:detective_game/models/statement_model.dart';

class SuspectStatement extends StatelessWidget {
  final StatementModel statement;
  final bool alignedRight;
  final double height;

  const SuspectStatement({
    required this.statement,
    this.height = 100,
    this.alignedRight = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: alignedRight
            ? [
                const HorizontalSpacing(of: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        statement.suspect.value.toUpperCase().toText(
                              color: AppTheme.primary,
                              fontSize: 20,
                            ),
                        Expanded(
                          child: statement.statement.toText(
                            color: AppTheme.whiteColor,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const HorizontalSpacing(of: 10),
                Image.asset(
                    'assets/images/characters/${statement.suspect.value}.png'),
              ]
            : [
                Image.asset(
                    'assets/images/characters/${statement.suspect.value}.png'),
                const HorizontalSpacing(of: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        statement.suspect.value.toUpperCase().toText(
                              color: AppTheme.primary,
                              fontSize: 20,
                            ),
                        Expanded(
                          child: statement.statement
                              .toText(color: AppTheme.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const HorizontalSpacing(of: 10),
              ],
      ),
    );
  }
}
