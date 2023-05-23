import 'package:pa_mobile/components/shared/featured_button.dart';
import 'package:pa_mobile/components/products/widgets/featured_products.dart';

import '../../../constants/consts.dart';
import '../../products/widgets/products_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 2),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                height: 60,
                alignment: Alignment.center,
                color: lightGrey,
                child: TextFormField(
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnything,
                    hintStyle: TextStyle(color: textfieldGrey),
                    suffixIcon: Icon(
                      Icons.search,
                      color: textfieldGrey,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                )),
            // Swiper
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VxSwiper.builder(
                        height: MediaQuery.of(context).size.height * 0.3,
                        viewportFraction: 0.83,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 1600),
                        autoPlayCurve: Curves.easeInOut,
                        itemCount: sliderImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            sliderImages[index],
                            fit: BoxFit.fitHeight,
                          )
                              .box
                              .roundedSM
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    // 10.heightBox,
                    // // Deal buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(
                    //     2,
                    //     (index) => homeButtons(
                    //       height: context.screenHeight * 0.14,
                    //       width: context.screenWidth / 2.5,
                    //       icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    //       title: index == 0 ? todaysDeal : flashSale,
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),

                    // Deal buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(
                    //     3,
                    //     (index) => InkWell(
                    //       splashColor: Colors.red,
                    //       child: homeButtons(
                    //         height: context.screenHeight * 0.11,
                    //         width: context.screenWidth / 3.5,
                    //         icon: index == 0
                    //             ? icTopCategories
                    //             : index == 1
                    //                 ? icBrands
                    //                 : icTopSeller,
                    //         title: index == 0
                    //             ? topCategories
                    //             : index == 1
                    //                 ? brand
                    //                 : topSellers,
                    //       ),
                    //       onTap: () {
                    //         debugPrint("statement");
                    //       },
                    //     ),
                    //   ),
                    // ),

                    // 10.heightBox,
                    // VxSwiper.builder(
                    //     height: MediaQuery.of(context).size.height * 0.15,
                    //     viewportFraction: 0.7,
                    //     aspectRatio: 16 / 9,
                    //     autoPlay: true,
                    //     pauseAutoPlayOnTouch: const Duration(milliseconds: 1000),
                    //     autoPlayAnimationDuration: const Duration(milliseconds: 900),
                    //     autoPlayCurve: Curves.easeInOut,
                    //     itemCount: sliderImages2.length,
                    //     itemBuilder: (context, index) {
                    //       return Image.asset(
                    //         sliderImages2[index],
                    //         fit: BoxFit.fitHeight,
                    //       )
                    //           .box
                    //           .roundedSM
                    //           .clip(Clip.antiAlias)
                    //           .margin(const EdgeInsets.symmetric(horizontal: 8))
                    //           .make();
                    //     }),

                    // ? featured categories
                    // featured categories text
                    20.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text
                            .color(darkFontGrey)
                            .size(20)
                            .fontWeight(FontWeight.bold)
                            .make(),
                      ),
                    ),
                    10.heightBox,

                    // featured categories container
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: List.generate(
                          3,
                          (index) =>
                              //  Column(
                              //   children: [
                              featuredButton(
                            icon: featuredImg[index],
                            title: featuredList[index],
                          ),
                          //   10.heightBox,
                          // ],
                        ),
                        // ).toList(),
                      ),
                    ),

                    // featured
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kAppColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text
                              .color(whiteColor)
                              .size(20)
                              .fontWeight(FontWeight.bold)
                              .make(),

                          // * view All Button
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                viewAll.text.color(whiteColor).size(16).make(),
                                5.widthBox,
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                4,
                                (index) => featuredProductsTile(
                                  title: featuredProductsTitle[index],
                                  icon: featuredProductsImg[index],
                                  price: featuredProductsPrice[index],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Swiper
                    20.heightBox,
                    VxSwiper.builder(
                        height: MediaQuery.of(context).size.height * 0.167,
                        viewportFraction: 0.99,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        pauseAutoPlayOnTouch: const Duration(milliseconds: 1000),
                        autoPlayAnimationDuration: const Duration(milliseconds: 900),
                        autoPlayCurve: Curves.easeInOut,
                        itemCount: sliderImages2.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            sliderImages2[index],
                            fit: BoxFit.fitHeight,
                          ).box.clip(Clip.antiAlias).make();
                        }),

                    // ? products
                    20.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: productCard.text
                            .color(darkFontGrey)
                            .size(20)
                            .fontWeight(FontWeight.bold)
                            .make(),
                      ),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 6,
                          mainAxisExtent: 315,
                        ),
                        itemBuilder: ((context, index) {
                          return productsListTile(
                            title: productsListTileTitle[index],
                            icon: productsListTileImg[index],
                            price: productsListTilePrice[index],
                            bid: productsListTileBid[index],
                            description: productsListTileDescription[index],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
