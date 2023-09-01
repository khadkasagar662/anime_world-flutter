import 'package:assignmentfinal/features/home/widgets/carousel_image.dart';
import 'package:assignmentfinal/features/home/widgets/catogories.dart';
import 'package:assignmentfinal/features/home/widgets/dealof_day.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../../search/View/search_screen.dart';
import '../widgets/address.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 35,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:  const EdgeInsets.only(top: 10),
                        border:  const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          )
                        ),
                        hintText: 'search Anime',
                        hintStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                
              )
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child:  Column(
          children: [
              AddressBox(),
              SizedBox(height: 10),
              TopCategories(),
              SizedBox(height: 10),
              CarouselImage(),
              DealOfDay(),
            
          ],
        ),
      ),
    );
  }
}
