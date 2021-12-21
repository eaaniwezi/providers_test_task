// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/screens/cart_screen.dart';
import 'package:shop_test_task_with_providers/screens/categories_screen.dart';
import 'package:shop_test_task_with_providers/screens/favorities_screen.dart';
import 'package:shop_test_task_with_providers/screens/home_screen.dart';
import 'package:shop_test_task_with_providers/screens/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  Widget? currentPage;

  late HomeScreen homeScreen;
  late CategoriesScreen categoriesScreen;
  late FavoritiesScreen favoritiesScreen;
  late CartScreen cartScreen;
  late ProfileScreen profileScreen;

  @override
  void initState() {
    super.initState();
    homeScreen = HomeScreen();
    categoriesScreen = CategoriesScreen();
    favoritiesScreen = FavoritiesScreen();
    cartScreen = CartScreen();
    profileScreen = ProfileScreen();
    pages = [
      homeScreen,
      categoriesScreen,
      favoritiesScreen,
      cartScreen,
      profileScreen,
    ];
    currentPage = homeScreen;
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProviders>(context);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: pages,
      onItemSelected: (int page) {
        setState(() {
          currentTabIndex = page;
        });
      },
      items: [
        PersistentBottomNavBarItem(
            iconSize: 30,
            icon: SvgPicture.asset(
              "icons/home.svg",
              color: currentTabIndex == 0 ? Colors.black : Colors.black54,
            ),
            title: ("главная"),
            textStyle: TextStyle(fontSize: 10),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.black54),
        PersistentBottomNavBarItem(
            iconSize: 30,
            icon: SvgPicture.asset(
              "icons/catalogue.svg",
              color: currentTabIndex == 1 ? Colors.black : Colors.black54,
            ),
            title: ("Каталог"),
            textStyle: TextStyle(fontSize: 10),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.black54),
        PersistentBottomNavBarItem(
            iconSize: 30,
            icon: SvgPicture.asset(
              "icons/heart.svg",
              color: currentTabIndex == 2 ? Colors.black : Colors.black54,
            ),
            title: ("Избранное"),
            textStyle: TextStyle(fontSize: 10),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.black54),
        PersistentBottomNavBarItem(
            iconSize: 30,
            icon: Stack(
              children: [
                SvgPicture.asset(
                  "icons/cart.svg",
                  color: currentTabIndex == 3 ? Colors.black : Colors.black54,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(),
                      child: Text(
                        productProvider.fetchedBasketProducts.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            title: ("Корзина"),
            textStyle: TextStyle(fontSize: 10),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.black54),
        PersistentBottomNavBarItem(
            iconSize: 30,
            icon: SvgPicture.asset(
              "icons/profile.svg",
              color: currentTabIndex == 4 ? Colors.black : Colors.black54,
            ),
            title: ("Профиль"),
            textStyle: TextStyle(fontSize: 10),
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.black54),
      ],
      confineInSafeArea: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.simple, // Choose
    );
  }
}
