import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/search_section.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/sidenav_bar.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: const SideBar(), // will be used on mobile
      body: LayoutBuilder(
        builder: (final context, final constraints) {
          if (constraints.maxWidth > 800) {
            // 👉 Web/Desktop Layout
            return Row(
              children: [
                const SideBar(),
                Expanded(
                  child: _buildMainContent(theme),
                ),
              ],
            );
          } else {
            // 👉 Mobile Layout
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(child: _buildMainContent(theme)),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildMainContent(TextTheme theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // search section
        const Expanded(child: SearchSection()),

        // footer
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              _footerItem('Pro', theme),
              _footerItem('Enterprise', theme),
              _footerItem('Store', theme),
              _footerItem('Blog', theme),
              _footerItem('Careers', theme),
              _footerItem('English (English)', theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _footerItem(String text, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: theme.displaySmall?.copyWith(
          color: AppColors.footerGrey,
          fontSize: 14,
        ),
      ),
    );
  }
}
