import 'package:addis_ride_portal/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import '../../../utils/enums.dart';
import '../../controllers/main_screen_controller.dart';
import '../dashboard/dashboard_screen.dart';
import '../item/items_page.dart';
import 'components/side_menu.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        key: controller.scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(Object(fileName: 'assets/cube/cube.obj'));
                },
              ),
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: getHomePage(controller.selectedMenu),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget getHomePage(SelectedMenu selectedMenu) {
    switch (selectedMenu) {
      case SelectedMenu.dashboard:
        return DashboardScreen();
      case SelectedMenu.orders:
        return DashboardScreen();
      case SelectedMenu.items:
        return ItemsPage();
      case SelectedMenu.store:
        return DashboardScreen();
      case SelectedMenu.notification:
        return DashboardScreen();
      case SelectedMenu.profile:
        return DashboardScreen();
      case SelectedMenu.settings:
        return DashboardScreen();
      default:
        return DashboardScreen();
    }
  }
}
