import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/main/main_controller.dart';
import '../../../core/functions/alert_exit_app.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 
  @override
  Widget build(BuildContext context) {
    Get.put(MainControllerImp());
    return GetBuilder<MainControllerImp>(builder: (controller){
      return Scaffold(
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.changePage(controller.currentPage),
            children: controller.listPage,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentPage,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.grey[400],
            elevation: 10,
            onTap: (page) {
              setState(() {
                controller.currentPage = page;
                controller.pageController!.animateToPage(page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              });
            },
            items: controller.bottomNavigationBarItem),
      );
    });
        }
      }
