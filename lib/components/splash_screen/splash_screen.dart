import 'package:pa_mobile/components/widgets/common/applogo_widget.dart';

import '../../constants/consts.dart';
import '../auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    // Future.delayed(const Duration(seconds: 3), () {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAll(
        () => const LoginScreen(),
        transition: Transition.fadeIn,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 900),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppColor,
      body: SafeArea(
        child: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.heightBox,
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300),
            ),
            40.heightBox,
            appLogoWidget(),
            20.heightBox,
            appName.text.fontFamily(big).size(26).white.make(),
            5.heightBox,
            appVersion.text.fontFamily(primaryFont).white.make(),
            30.heightBox,
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const Spacer(),
            credits.text.fontFamily(bold).white.make(),
            20.heightBox,
          ],
        )),
      ),
    );
  }
}
