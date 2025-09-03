import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required this.icon,
    required this.isCollapsed,
    required this.title,
  });

  final IconData icon;
  final bool isCollapsed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Row(
        mainAxisSize: MainAxisSize.min, //  Prevents Row from forcing full width
        mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(icon, size: 22),
          if (!isCollapsed)
            Flexible(
              //  Prevents text from overflowing
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis, //  truncate if too long
                ),
              ),
            ),
        ],
      ),
    );
  }
}
