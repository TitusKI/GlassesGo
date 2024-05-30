import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassesgo/views/common/values/colors.dart';
import 'package:glassesgo/views/common/widgets/common_widgets.dart';
import 'package:glassesgo/views/home_screen/widgets/catagories_button.dart';
import 'package:glassesgo/views/home_screen/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "GlassesGo",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryText),
          ),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                weight: 50.0,
              ),
              color: Colors.black,
            );
          }),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                weight: 50.0,
              ),
              color: Colors.black,
            );
          })
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: buildTextField(
              "Search glasses",
              "normal",
              'search',
              (value) {},
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            color: AppColors.primary_bg,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "view all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          catgButton("Sunglasses"),
                          catgButton("Prescription"),
                          catgButton("Blue Light"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          catgButton("Designer Frames"),
                          catgButton('Sports Glasses'),
                          catgButton("More...")
                        ],
                      )
                    ],
                  ),
                  // Container(
                  //   height: 400,
                  //   child: GridView.count(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 4,
                  //     mainAxisSpacing: 2,
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     children: [
                  //       catgButton("Sunglasses"),
                  //       catgButton("Prescription"),
                  //       catgButton("Blue Light"),
                  //       catgButton("Designer Frames"),
                  //       catgButton('Sports Glasses'),
                  //       catgButton("More...")
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
