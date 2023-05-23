import '../../../constants/consts.dart';

class MyBids extends StatelessWidget {
  const MyBids({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          elevation: 5,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: "My Bids".text.fontWeight(FontWeight.bold).size(22).color(Colors.black).make(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 1),
        color: lightGrey,
        height: context.screenHeight,
        width: context.screenWidth,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "product"
                          .text
                          .size(18)
                          .fontWeight(FontWeight.w700)
                          .uppercase
                          .color(darkFontGrey)
                          .make(),
                      "Bid Amount"
                          .text
                          .size(18)
                          .fontWeight(FontWeight.w700)
                          .uppercase
                          .color(darkFontGrey)
                          .make(),
                    ],
                  ),
                ),
                const Divider(
                  color: kAppColor,
                  height: 1,
                  thickness: 1,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
                    height: 2,
                    thickness: 1,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minVerticalPadding: 1,
                      trailing: 'रु ${myBidListPrice[index]}'.text.size(14).caption(context).make(),
                      title: myBidListProduct[index]
                          .text
                          .size(16)
                          .fontWeight(FontWeight.w600)
                          .color(darkFontGrey)
                          .capitalize
                          .make(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
