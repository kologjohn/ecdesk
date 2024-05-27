import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/databases.dart';

class Responsiveness extends StatelessWidget {
  final Widget isMobile;
  final Widget isTablet;
  final Widget isDesktop;
  const Responsiveness({super.key, required this.isMobile, required this.isTablet, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseAccounts>(
      builder: (BuildContext context, FirebaseAccounts value, Widget? child) {
        return LayoutBuilder(builder: (context, constraints){
          if (constraints.maxWidth < 500){
            return isMobile;
          } else if (constraints.maxWidth < 1100){
            return isTablet;
          } else {return isDesktop;}
        },
        );
      },
    );
  }
}
