import 'package:detective_game/all_utils.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: of,
      );
}

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of,
    );
  }
}

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final bool withCurtains;
  final double curtainWidth;

  const BaseScaffold({
    required this.child,
    this.withCurtains = false,
    this.curtainWidth = 120,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GemsProvider>(
      builder: (context, provider, ch) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/backgrounds/home.png'),
              ),
            ),
            child: Stack(
              children: [
                withCurtains
                    ? Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/backgrounds/curtain.png',
                              width: curtainWidth,
                              fit: BoxFit.fill,
                            ),
                            Expanded(child: child),
                            Image.asset(
                              'assets/images/backgrounds/curtain.png',
                              width: curtainWidth,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      )
                    : Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: child,
                      ),
                Positioned(bottom: 10, left: 10, child: _buildGems(context)),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildGems(BuildContext context) {
    final count = context.read<GemsProvider>().gems;
    final List<Widget> gems = [];

    for (int i = 0; i < count; i++) {
      gems.add(Image.asset('assets/images/gem.png', height: 30));
    }

    return Wrap(children: gems);
  }
}
