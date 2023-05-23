import '../../../constants/consts.dart';

Widget featuredProductsTile({String? title, String? price, icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        icon,
        width: 150,
        height: 150,
        fit: BoxFit.fitHeight,
      ),
      title!.text.fontWeight(FontWeight.w700).color(darkFontGrey).make(),
      5.heightBox,
      'रु ${price!}'.text.color(kAppColor).fontWeight(FontWeight.bold).size(16).make()
    ],
  ).box.white.roundedSM.padding(const EdgeInsets.all(8)).margin(const EdgeInsets.all(8)).make();
}
