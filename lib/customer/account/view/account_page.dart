import 'package:flutter/material.dart';
import 'package:towermarket_ui/towermarket_ui.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("welcome!", style: TowerMarketTextStyle.headline4),
                    Text(
                      "login to view your profile!",
                      style: TowerMarketTextStyle.title1.copyWith(
                        color: TowerMarketColors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('login'),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Text('Your Information',
                style: TowerMarketTextStyle.title3
                    .copyWith(color: TowerMarketColors.black38)),
            const SizedBox(height: 8),
            const MyListTile(
              icon: Icons.history,
              title: 'Order History',
            ),
            const MyListTile(
              icon: Icons.location_on_outlined,
              title: 'Address Book',
            ),
            const MyListTile(
              icon: Icons.payments,
              title: 'Manage Payments',
            ),
            const MyListTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
            ),
            const SizedBox(height: 36),
            Text('others',
                style: TowerMarketTextStyle.title3
                    .copyWith(color: TowerMarketColors.black38),
                textAlign: TextAlign.start),
            const SizedBox(height: 8),
            const MyListTile(
              icon: Icons.support_rounded,
              title: 'Customer Support',
              textColor: TowerMarketColors.black87,
              iconColor: TowerMarketColors.black87,
            ),
            const MyListTile(
              icon: Icons.star_border,
              title: 'Rate Us',
              textColor: TowerMarketColors.black87,
              iconColor: TowerMarketColors.black87,
            ),
            const MyListTile(
              icon: Icons.share_outlined,
              title: 'Share The App',
              textColor: TowerMarketColors.black87,
              iconColor: TowerMarketColors.black87,
            ),
            const MyListTile(
              icon: Icons.info_outline_rounded,
              title: 'About Us',
              textColor: TowerMarketColors.black87,
              iconColor: TowerMarketColors.black87,
            ),
            const MyListTile(
              icon: Icons.phone_android_rounded,
              title: 'app version v0.1',
              textColor: TowerMarketColors.black87,
              iconColor: TowerMarketColors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
