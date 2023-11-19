import 'package:addis_ride_portal/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../controllers/main_screen_controller.dart';
import '../dashboard/components/header.dart';
import '../dashboard/components/recent_files.dart';

class ItemsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: Get.find<MainScreenController>().controlMenu,
                  ),
                if (!Responsive.isMobile(context))
                  Text(
                    "Items",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                if (!Responsive.isMobile(context))
                  Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                ProfileCard()
              ],
            ),
            SizedBox(height: defaultPadding),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            RecentFiles(),
          ],
        ),
      ),
    );
  }
}
