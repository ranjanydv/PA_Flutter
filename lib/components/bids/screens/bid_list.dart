import '../../../constants/consts.dart';

Widget biddersList({String? title, icon}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(icon!),
      ),
      10.widthBox,
      title!.text.fontWeight(FontWeight.w700).color(darkFontGrey).capitalize.make()
    ],
  )
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
