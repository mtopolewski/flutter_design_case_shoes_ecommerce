import 'package:case_shoes_ecommerce/widgets/large_card.dart';
import 'package:case_shoes_ecommerce/widgets/search_bar.dart';
import 'package:case_shoes_ecommerce/widgets/settings_buton.dart';
import 'package:case_shoes_ecommerce/widgets/small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FBFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF6FBFC),
        title: const Text(
          "Deals of the day",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Searchbar(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SettingsButton(),
                      ],
                    ),
                  ),
                  const LargeCard(),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 6,
                crossAxisCount: 2,
                childAspectRatio: 0.77,
                children: const [
                  SmallCard(),
                  SmallCard(),
                  SmallCard(),
                  SmallCard(),
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0),
            )
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: ScrollConfiguration(
      //     behavior: ScrollConfiguration.of(context).copyWith(
      //       dragDevices: {
      //         PointerDeviceKind.touch,
      //         PointerDeviceKind.mouse,
      //       },
      //     ),
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(16),
      //           child: Row(
      //             children: [
      //               const Expanded(
      //                 child: TextField(
      //                   style: TextStyle(fontSize: 12),
      //                   decoration: InputDecoration(
      //                     labelText: "Search Stores",
      //                     labelStyle:
      //                         TextStyle(fontSize: 12, color: Colors.grey),
      //                     prefixIcon: Padding(
      //                       padding: EdgeInsets.only(
      //                           left: 14, top: 0, bottom: 0, right: 10),
      //                       child: Icon(
      //                         CupertinoIcons.search,
      //                         size: 22,
      //                         color: Color(0x6E9E9E9E),
      //                       ),
      //                     ),
      //                     enabledBorder: OutlineInputBorder(
      //                       borderSide: BorderSide(
      //                           color: Color(0x6E9E9E9E), width: 1.6),
      //                       borderRadius: BorderRadius.all(Radius.circular(6)),
      //                     ),
      //                     focusedBorder: OutlineInputBorder(
      //                       borderSide: BorderSide(
      //                           color: Color(0x6E9E9E9E), width: 1.6),
      //                       borderRadius: BorderRadius.all(Radius.circular(6)),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 width: 8,
      //               ),
      //               InkWell(
      //                 customBorder: const RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(8)),
      //                 ),
      //                 child: Ink(
      //                   width: 46,
      //                   height: 46,
      //                   decoration: const BoxDecoration(
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(8),
      //                     ),
      //                     gradient: LinearGradient(
      //                         colors: [Color(0xFF4868F1), Color(0xFF8F7BF8)]),
      //                   ),
      //                   child: const Icon(
      //                     Icons.tune,
      //                     color: Colors.white,
      //                     size: 20,
      //                   ),
      //                 ),
      //                 onTap: () {},
      //               )
      //             ],
      //           ),
      //         ),
      //         const LargeCard(),
      //         SizedBox(
      //           height: 1000,
      //           width: 100,
      //           child: SliverGrid.count(
      //             crossAxisCount: 1,
      //             children: [
      //               Container(
      //                 height: 100,
      //                 color: Colors.amber,
      //               )
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
