import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required this.icon,
    required this.isCollapased,
    required this.title,
  });

  final IconData icon;
  final bool isCollapased;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Row(
        mainAxisAlignment: isCollapased ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 22,
          ),
          isCollapased
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(title),
                ),
        ],
      ),
    );
  }
}
