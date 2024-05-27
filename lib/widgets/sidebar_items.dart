import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  //final String svgPath;
  final String text;
  final bool isExpanded;
  final VoidCallback onTap;

  SidebarItem({
    required this.icon,
    required this.text,
    required this.isExpanded,
    required this.onTap,
    //required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      //SvgPicture.asset(
      //         svgPath,
      //         color: Colors.white,
      //         width: 25,
      //         height: 25,
      //       ),
      title: isExpanded
          ? Text(text, style: const TextStyle(color: Colors.white54))
          : null,
      onTap: onTap,
    );
  }
}
