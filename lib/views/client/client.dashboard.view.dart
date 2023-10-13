import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/controllers/client/client.dashboard.controller.dart';
import 'package:wfs/helpers/components.dart';
import 'package:wfs/views/client/pages/client.booking.view.dart';
import 'package:wfs/views/client/pages/client.chat.view.dart';
import 'package:wfs/views/client/pages/client.history.view.dart';
import 'package:wfs/views/client/pages/client.home.view.dart';
import 'package:wfs/views/client/pages/client.profile.view.dart';

class ClientDashboardView extends GetView<ClientDashboardController> {
  const ClientDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );

    TextStyle selectedLabelStyle(context) => TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        );

    BottomNavigationBarItem botNavBarItem(context, icon, label) =>
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          label: label,
          backgroundColor: Colors.white,
        );

    buildBottomNavigationMenu(context, dashboardController) {
      return Obx(
        () => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SizedBox(
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              currentIndex: dashboardController.tabIndex.value,
              onTap: dashboardController.changeTabIndex,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black.withOpacity(0.5),
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle(context),
              items: [
                botNavBarItem(context, Icons.home, 'Home'),
                botNavBarItem(context, Icons.calendar_month, 'Bookings'),
                botNavBarItem(context, Icons.forum, 'Chat'),
                botNavBarItem(context, Icons.update, 'History'),
                botNavBarItem(context, Icons.account_circle, 'Profile'),
              ],
            ),
          ),
        ),
      );
    }

    final controller = Get.put(ClientDashboardController());
    return defaultLayoutScaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            ClientHomeView(),
            ClientBookingView(),
            ClientChatView(),
            ClientHistoryView(),
            ClientProfileView()
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
    );
  }
}
