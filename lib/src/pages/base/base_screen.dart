import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';

import '../cart/cart_tab.dart';
import '../profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeTab(),
          const CartTab(),
          Container(
            color: Colors.teal,
          ),
          const ProfileTab()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Carrinho'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Perfil'),
        ],
      ),
    );
  }
}
