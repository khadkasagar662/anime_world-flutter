import 'package:flutter/material.dart';

// String uri = 'http://localhost:3306';
// String animeUri ='https://api.jikan.moe/v4/';
//for emulater
String uri = 'http://10.0.2.2:3306';
 

 //for real device
//  String uri = 'http://192.168.1.66:3306';


class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 194, 89, 242),
      Color.fromARGB(255, 230, 112, 204),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 192, 104, 184);
  static const unselectedNavBarColor = Colors.black87;

   static const List<String> carouselImages = [
    'assets/images/offer.jpg',
    'assets/images/discount.jpg',
    // 'assets/images/image4.jpg',
    
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
    
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Accessories',
      'image': 'assets/images/bag.png',
    },
    
    {
      'title': 'Appliances',
      'image': 'assets/images/cup.png',
    },
    {
      'title': 'Apparel',
      'image': 'assets/images/fashoin.png',
    },
    {
      'title': 'Wallet',
      'image': 'assets/images/wallet.jpg',
    },
  ];

}