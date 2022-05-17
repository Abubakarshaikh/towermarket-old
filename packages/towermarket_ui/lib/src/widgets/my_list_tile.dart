import 'package:flutter/material.dart';
import '../typography/text_styles.dart';
import '../colors.dart';

class MyListTile extends StatelessWidget {
  final Function()? onTap;
  final Color? textColor;
  final IconData icon;
  final Color? iconColor;
  final String title;
  const MyListTile({
    Key? key,
    this.onTap,
    this.textColor = TowerMarketColors.black38,
    required this.icon,
    this.iconColor = TowerMarketColors.black38,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: TowerMarketColors.lightgrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: TowerMarketTextStyle.title1.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
