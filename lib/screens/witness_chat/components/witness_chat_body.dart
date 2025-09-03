import 'package:detective_game/all_utils.dart';
import 'package:detective_game/models/statement_model.dart';
import 'package:detective_game/screens/witness_chat/components/suspect_statement.dart';

class WitnessChatBody extends StatelessWidget {
  final StatementModel statementOne;
  final StatementModel? statementTwo;

  const WitnessChatBody(this.statementOne, this.statementTwo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SuspectStatement(statement: statementOne),
          const VerticalSpacing(of: 10),
          statementTwo == null
              ? kEmptyWidget
              : SuspectStatement(
                  statement: statementTwo!,
                  alignedRight: true,
                ),
        ],
      ),
    );
  }
}
