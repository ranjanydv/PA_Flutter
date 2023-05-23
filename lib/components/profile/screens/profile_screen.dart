import 'package:pa_mobile/components/profile/components/details_card.dart';
import 'package:pa_mobile/controller/auth_controller.dart';

import '../../../constants/consts.dart';
import '../../auth/screens/login_screen.dart';
import '../../widgets/common/bg_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              30.heightBox,
              // users details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile3,
                      width: 60,
                      fit: BoxFit.cover,
                    ).box.rounded.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "New User".text.size(20).fontWeight(FontWeight.w600).color(whiteColor).make(),
                          2.heightBox,
                          "newuser@gmail.com"
                              .text
                              .fontWeight(FontWeight.w500)
                              .color(whiteColor)
                              .caption(context)
                              .make(),
                          5.heightBox,
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const FaIcon(
                        FontAwesomeIcons.userPen,
                        color: whiteColor,
                        size: 22,
                      ).onTap(() => debugPrint("Edit Profile")),
                    ),
                    5.widthBox
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "01", title: "Total Auctions", width: context.screenWidth / 3.4),
                  detailsCard(count: "00", title: "Favourites", width: context.screenWidth / 3.4),
                  detailsCard(count: "00", title: "Total Bids", width: context.screenWidth / 3.4),
                ],
              ),
              20.heightBox,
              //buttons
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(color: lightGrey),
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: profileButtonList[index].text.color(darkFontGrey).fontWeight(boldStyle).make(),
                    leading: Image.asset(profileButtonIcons[index], width: 22).box.clip(Clip.antiAlias).make(),
                  );
                },
              )
                  .box
                  .white
                  .roundedSM
                  .margin(const EdgeInsets.all(12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
                  .box
                  .color(kAppColor)
                  .make(),
              30.heightBox,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    maximumSize: const Size(80, 40),
                    side: const BorderSide(
                      color: kAppColor,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await Get.put(AuthController()).signOutMethod(context).then((val) {
                      showSnackBar(
                        context: context,
                        message: "Logout Successful",
                        snackbarColor: Colors.green,
                      );
                      Get.offAll(
                        () => const LoginScreen(),
                        transition: Transition.fadeIn,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 200),
                      );
                    });
                  },
                  child: "Logout".text.uppercase.fontWeight(boldStyle).make(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
