import 'package:pa_mobile/constants/consts.dart';

Widget appLogoWidget() {
  // using velocity x
  return Image.asset(icAppLogo).box.height(77).padding(const EdgeInsets.all(8)).rounded.make();
  // .size(77, 77)
}
