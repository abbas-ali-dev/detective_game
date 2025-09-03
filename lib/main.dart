import 'package:detective_game/all_utils.dart';
import 'package:detective_game/screens/home/home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await MyMockupData.instance.init();
  await PrefStorage.instance.init();
  // await Firebase.initializeApp();
  // MyAdManager.instance.initialize();

  runApp(const DetectiveGame());
}

class DetectiveGame extends StatelessWidget {
  const DetectiveGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GemsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Criminal Mystery',
        themeMode: ThemeMode.dark,
        theme: AppTheme.buildTheme(),
        initialRoute: HomeScreen.routeName,
        routes: routes,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: FlutterEasyLoading(child: widget),
          );
        },
      ),
    );
  }
}
