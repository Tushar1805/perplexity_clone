import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/search_section.dart';
// import 'package:perplexity_clone/l10n/app_localizations.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/sidenav_bar.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullResponse = "";
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: Row(
      children: [
        // sidenav bar
        SideBar(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // search section
              Expanded(child: SearchSection()),

              // footer
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Pro',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Enterprise',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Store',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Blog',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Careers',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'English (English)',
                        style: theme.displaySmall?.copyWith(
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
