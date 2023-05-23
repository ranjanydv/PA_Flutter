import 'package:firebase_core/firebase_core.dart';

import 'components/splash_screen/splash_screen.dart';
import 'constants/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Premiere Auctioneers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: primaryFont,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: kAppColor,
        ),
        appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.transparent,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
