import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/search_bar_button.dart';
import 'package:perplexity_clone/routes/app_routes.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Where Knowledge Begins",
          style: theme.displayLarge,
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  style: theme.bodyMedium,
                  decoration: InputDecoration(
                      hintText: "Search anything...",
                      hintStyle: theme.bodyMedium?.copyWith(color: AppColors.textGrey),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SearchBarButton(
                      icon: Icons.add_circle_outline_outlined,
                      text: 'Attach',
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        context.pushNamed(
                          chatPage,
                          extra: {
                            "question": queryController.text.trim(),
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: AppColors.submitButton, borderRadius: BorderRadius.circular(40)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
