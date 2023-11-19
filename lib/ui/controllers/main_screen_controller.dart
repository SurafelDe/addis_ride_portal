import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/enums.dart';

class MainScreenController extends GetxController{
  SelectedMenu selectedMenu = SelectedMenu.dashboard;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  menuClicked(SelectedMenu newMenu) {
    selectedMenu = newMenu;
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    }
    update();
  }
}