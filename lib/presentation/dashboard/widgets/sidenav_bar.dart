import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/navbar_widget.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      duration: const Duration(milliseconds: 100),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: isCollapsed ? 0 : 14),
              child: Icon(
                Icons.auto_awesome_mosaic,
                size: isCollapsed ? 30 : 60,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  NavBarWidget(
                    icon: Icons.add,
                    isCollapsed: isCollapsed,
                    title: "Home",
                  ),
                  NavBarWidget(
                    icon: Icons.search,
                    isCollapsed: isCollapsed,
                    title: "Search",
                  ),
                  NavBarWidget(
                    icon: Icons.language,
                    isCollapsed: isCollapsed,
                    title: "Spaces",
                  ),
                  NavBarWidget(
                    icon: Icons.auto_awesome,
                    isCollapsed: isCollapsed,
                    title: "Discover",
                  ),
                  NavBarWidget(
                    icon: Icons.cloud_outlined,
                    isCollapsed: isCollapsed,
                    title: "Library",
                  ),
                  const Spacer(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: Icon(
                  isCollapsed
                      ? Icons.arrow_forward_ios_outlined
                      : Icons.arrow_back_ios_new_outlined,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
