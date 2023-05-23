import 'package:pa_mobile/constants/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPressed}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icTodaysDeal,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(bold).color(darkFontGrey).make(),
    ],
  ).box.rounded.white.size(width, height).make();
}
