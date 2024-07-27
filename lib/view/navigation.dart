import 'package:crypto/controller/navigation_controller.dart';
import 'package:crypto/view/add_catergory.dart';
import 'package:crypto/view/expenses_screen.dart';
import 'package:crypto/view/home_page.dart';
import 'package:crypto/view/profile_screen.dart';
import 'package:crypto/view/trasnsaction_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNavigation extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  FirstNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (!navigationController.shouldCloseApp.value) {
          navigationController.setShouldCloseApp(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text('Back again to close this app'),
              duration: Duration(seconds: 2),
            ),
          );
          return false; 
        } else {
          return true; 
        }
      },
      child: Scaffold(
        body: Obx(() {
          switch (navigationController.selectedIndex.value) {
            case 0:
              return HomePage(); 
            case 1:
              return ExpensesScreen(); 
            case 2:
              return AddCategory();
               case 3:
              return const TransactionPage();
               case 4:
              return ProfilePage();
            default:
              return Container();
          }
        }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: navigationController.selectedIndex.value,
          onTap: navigationController.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.black,),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black,),
              label: 'Profile',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.copy, color: Colors.black,),
              label: 'Profile',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: Colors.black,),
              label: 'Profile',
            ),
          ],
        )),
      ),
    );
  }
}
