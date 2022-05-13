import 'package:case_shoes_ecommerce/widgets/bottom_navigation_bar.dart';
import 'package:case_shoes_ecommerce/widgets/large_card.dart';
import 'package:case_shoes_ecommerce/widgets/search_bar.dart';
import 'package:case_shoes_ecommerce/widgets/settings_buton.dart';
import 'package:case_shoes_ecommerce/widgets/small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;

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
        extendBody: true,
        backgroundColor: const Color(0xFFF6FBFC),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFF6FBFC),
          title: const Text(
            "Deals of the day",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'CoreSans',
              fontSize: 18,
              wordSpacing: -1,
            ),
          ),
          leading: TextButton(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
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
                padding: EdgeInsets.only(bottom: 120.0),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBar());
  }
}
