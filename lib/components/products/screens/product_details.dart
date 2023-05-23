import '../../../constants/consts.dart';

class ProductDetails extends StatefulWidget {
  final String? title;
  final String? image;
  final String? desc;
  final String? basePrice;
  final String? highestBid;

  const ProductDetails({
    Key? key,
    required this.title,
    required this.image,
    required this.desc,
    required this.basePrice,
    required this.highestBid,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isFavourite = false;

  final _bidValueController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _bidValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> reversedBidList = bidderList.reversed.toList();
    List<String> reversedBidImg = bidderImg.reversed.toList();
    List<String> reversedBidBid = bidderBid.reversed.toList();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: widget.title!.text.fontWeight(boldStyle).color(darkFontGrey).make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavourite = !_isFavourite;
                showSnackBar(
                  context: context,
                  message: _isFavourite ? 'Added to Favourites' : 'Removed from Favourites',
                );
              });
            },
            icon: _isFavourite
                ? const Icon(
                    Icons.favorite,
                    color: redColor,
                  )
                : const Icon(
                    Icons.favorite_outline,
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.image!,
                      height: 350,
                      cacheHeight: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Image.asset(
                    //   widget.image!,
                    //   height: 350,
                    //   cacheHeight: 350,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                    10.heightBox,

                    // title and description
                    widget.title!.text.size(22).color(darkFontGrey).fontWeight(boldStyle).make(),
                    5.heightBox,
                    'Base Price: रु ${widget.basePrice}'
                        .text
                        .color(kAppColor)
                        .fontWeight(boldStyle)
                        .size(18)
                        .make(),
                    5.heightBox,
                    'Highest Bid: रु ${widget.highestBid}'
                        .text
                        .color(GlobalVariables.greyTextColor)
                        .fontWeight(boldStyle)
                        .size(15)
                        .make(),

                    5.heightBox,
                    'Category: Others'.text.size(15).caption(context).make(),
                    // rating
                    5.heightBox,
                    Row(
                      children: [
                        VxRating(
                          onRatingUpdate: ((value) {
                            debugPrint(value);
                          }),
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          size: 25,
                          stepInt: true,
                          count: 5,
                        ),
                        5.widthBox,
                        '(4.8)'.text.size(15).caption(context).make(),
                        5.widthBox,
                        '188 reviews'.text.size(15).caption(context).make(),
                      ],
                    ),
                    10.heightBox,
                    widget.desc!.text.caption(context).size(15).justify.make(),
                    10.heightBox,

                    // bidders
                    'Bidders'.text.size(18).fontWeight(boldStyle).make(),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(
                        color: lightGrey,
                        height: 2,
                        thickness: 2,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minVerticalPadding: 1,
                          trailing: '2m ago'.text.size(12).caption(context).make(),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(reversedBidImg[index]),
                          ).box.make(),
                          subtitle: " रु ${reversedBidBid[index]}"
                              .text
                              .size(14)
                              .fontWeight(boldStyle)
                              .make(),
                          title: reversedBidList[index]
                              .text
                              .size(16)
                              .fontWeight(FontWeight.w700)
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
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: whiteColor,
                  padding: const EdgeInsets.only(left: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: _bidValueController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    cursorColor: darkFontGrey,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your bid',
                      contentPadding: EdgeInsets.only(left: 10, top: 10),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAppColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      elevation: 0,
                    ),
                    child: 'Place A Bid'.text.size(18).make(),
                    onPressed: () {
                      if (_bidValueController.text.isEmpty) {
                        showSnackBar(
                          context: context,
                          message: 'Please enter your bid',
                          snackbarColor: redColor,
                        );
                      } else {
                        if (int.parse(_bidValueController.text) < int.parse(widget.highestBid!)) {
                          showSnackBar(
                            context: context,
                            message: 'Your bid should be higher than the highest bid',
                            snackbarColor: redColor,
                          );
                          return;
                        }
                        showSnackBar(
                          context: context,
                          message: 'Bid placed successfully',
                          snackbarColor: Colors.green[400],
                        );
                        _bidValueController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
