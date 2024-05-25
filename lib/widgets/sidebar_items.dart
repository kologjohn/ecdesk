import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isExpanded;
  final VoidCallback onTap;

  SidebarItem({
    required this.icon,
    required this.text,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isExpanded
          ? Text(text, style: const TextStyle(color: Colors.white54))
          : null,
      onTap: onTap,
    );
  }
}
