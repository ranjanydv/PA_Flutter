import 'package:flutter/material.dart';

const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color fontGrey = Color.fromRGBO(107, 115, 119, 1);
const Color darkFontGrey = Color.fromRGBO(62, 68, 71, 1);
const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
const Color redColor = Color.fromRGBO(230, 46, 4, 1);
const Color golden = Color.fromRGBO(255, 168, 0, 1);
// const kAppColor = Color(0xFF2DAD9E);
const kAppColor = Color.fromRGBO(45, 173, 158, 1);
// const kAppColorRGB = Color.fromRGBO(45, 173, 158, .51);

class GlobalVariables {
  static const secondaryColor = Color.fromRGBO(50, 195, 108, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const Color greyTextColor = Color.fromARGB(255, 120, 120, 120);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const appBarGradient = LinearGradient(
    colors: [
      kAppColor,
      Color.fromARGB(246, 133, 192, 189),
    ],
    stops: [0.5, 1.0],
  );

  static const List<String> carouselImages = [
    "https://res.cloudinary.com/dg8j5cck1/image/upload/v1681807683/premiere-auctioneers/qzsxgimkrnwq2fytbgqm.jpg",
    'https://res.cloudinary.com/dg8j5cck1/image/upload/v1665508810/file-upload/tmp-1-1665508807423_uhsm2p.jpg',
    'https://res.cloudinary.com/dg8j5cck1/image/upload/v1680611880/file/tmp-2-1680611876871_slkmfy.jpg',
    'https://res.cloudinary.com/dg8j5cck1/image/upload/v1680612199/file/jsgjxzzsmul0qhvrtylk.jpg',
  ];
}
