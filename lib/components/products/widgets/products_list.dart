import '../../../constants/consts.dart';
import '../screens/product_details.dart';

Widget productsListTile({String? title, String? price, String? bid, icon, String? description}) {
  icon ??= imgP1;
  if (bid == '') {
    bid = 'No bids yet';
  }
  if (description == '' || description == null) {
    description = 'No description available';
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        icon,
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
      // Image.asset(
      //   icon,
      //   height: 200,
      //   width: 200,
      //   fit: BoxFit.cover,
      // ),
      // const Spacer(),
      5.heightBox,
      title!.text.fontWeight(FontWeight.w700).size(16).color(darkFontGrey).make(),
      5.heightBox,
      'Base Price: रु ${price!}'.text.color(kAppColor).fontWeight(FontWeight.bold).size(14).make(),
      5.heightBox,
      'Highest Bid: रु $bid'
          .text
          .color(GlobalVariables.greyTextColor)
          .fontWeight(FontWeight.bold)
          .size(14)
          .make(),
    ],
  ).box.white.roundedSM.padding(const EdgeInsets.all(8)).make().onTap(() {
    debugPrint('Product Details: $title');
    Get.to(
      () => ProductDetails(
        title: title,
        image: icon,
        desc: description!,
        basePrice: price,
        highestBid: bid,
      ),
      transition: Transition.fadeIn,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
  });
}
