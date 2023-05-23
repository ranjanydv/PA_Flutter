import '../../../constants/consts.dart';
import '../../shared/featured_button.dart';
import '../widgets/products_list.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool _isSearching = false;
  final TextEditingController _searchQuery = TextEditingController();
  late FocusNode _searchFocusNode;

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
    _searchFocusNode.requestFocus();
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      _searchQuery.clear();
    });
  }

  void _handleSearch(String query) {
    debugPrint('Search query: $query');
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            elevation: 5,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: _isSearching
                ? TextField(
                    onSubmitted: _handleSearch,
                    focusNode: _searchFocusNode,
                    controller: _searchQuery,
                    cursorColor: Colors.black54,
                    cursorHeight: 20,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: searchAnything,
                      hintStyle: const TextStyle(color: textfieldGrey),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _stopSearching();
                        },
                      ),
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  )
                : productCard.text.fontFamily(big).fontWeight(FontWeight.bold).size(22).color(Colors.black).make(),
            actions: _buildActions(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 6, bottom: 1),
          color: lightGrey,
          height: context.screenHeight,
          width: context.screenWidth,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ? featured categories
                        // featured categories text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: "Categories".text.color(darkFontGrey).size(20).fontWeight(FontWeight.bold).make(),
                          ),
                        ),
                        // featured categories container
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            children: List.generate(
                              3,
                              (index) => featuredButton(
                                icon: featuredImg[index],
                                title: featuredList[index],
                              ),
                            ),
                          ),
                        ),

                        // ? products
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: liveAuctionCard.text.color(darkFontGrey).size(20).fontWeight(FontWeight.bold).make(),
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
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: upcomingAuctionCard.text
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
                              crossAxisSpacing: 10,
                              mainAxisExtent: 315,
                            ),
                            itemBuilder: ((context, index) {
                              return productsListTile(
                                title: productsListTileTitle[index],
                                icon: productsListTileImg[index],
                                price: productsListTilePrice[index],
                                bid: productsListTileBid[index],
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
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [];
    } else {
      return [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () {
            _startSearch();
          },
        ),
      ];
    }
  }
}
