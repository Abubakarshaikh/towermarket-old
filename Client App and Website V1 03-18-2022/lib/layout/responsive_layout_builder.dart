import 'package:flutter/material.dart';

import 'layout.dart';

enum ResponsiveLayoutSize { small, medium, large }

typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

class ResponsiveLayoutBuilder extends StatelessWidget {
  final ResponsiveLayoutWidgetBuilder small;
  final ResponsiveLayoutWidgetBuilder medium;
  final ResponsiveLayoutWidgetBuilder large;

  final Widget Function(ResponsiveLayoutSize currentSize)? child;
  const ResponsiveLayoutBuilder(
      {Key? key,
      required this.small,
      required this.medium,
      required this.large,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        if (screenWidth <= TowermarketBreakpoints.small) {
          return small(context, child?.call(ResponsiveLayoutSize.small));
        }
        if (screenWidth <= TowermarketBreakpoints.medium) {
          return medium(context, child?.call(ResponsiveLayoutSize.medium));
        }
        if (screenWidth <= TowermarketBreakpoints.large) {
          return large(context, child?.call(ResponsiveLayoutSize.large));
        }

        return large(context, child?.call(ResponsiveLayoutSize.large));
      },
    );
  }
}
