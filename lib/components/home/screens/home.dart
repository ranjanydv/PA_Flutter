import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import '../../../constants/consts.dart';
import '../../../controller/home_controller.dart';
import '../../bids/screens/my_bids_screen.dart';
import '../../products/screens/product_screen.dart';
import '../../profile/screens/profile_screen.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  static const String routeName = '/actual-home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// initialize home controller
  var controller = Get.put(HomeController());

  List<Widget> navBody = [
    // const Center(child: Text('Home')),
    const HomeScreen(),
    // const Center(child: Text('Auction')),
    const Products(),
    // const Center(child: Text('Favorites')),
    const MyBids(),
    // const Center(child: Text('Me')),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      // body: pages[_page],
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(
                controller.currentNavValueIndex.value,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          iconSize: 22,
          curve: Curves.easeIn,
          itemCornerRadius: 10,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // selectedIndex: _page,
          selectedIndex: controller.currentNavValueIndex.value,
          showElevation: false,
          onItemSelected: (int index) {
            setState(() {
              controller.currentNavValueIndex.value = index;
            });
          },
          // items: navBarItems,
          items: [
            BottomNavyBarItem(
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              title: const Text('Discover'),
              activeColor: kAppColor,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: const FaIcon(FontAwesomeIcons.gavel),
              title: const Text('Auctions'),
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              // icon: const Icon(Icons.favorite),
              icon: const FaIcon(FontAwesomeIcons.repeat),
              title: const Text('My Bids'),
              activeColor: Colors.cyan,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: Colors.deepPurpleAccent,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
