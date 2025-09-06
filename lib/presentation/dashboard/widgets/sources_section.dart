import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResults = [
    {
      "title": "Ind vs Aus Live Score 4th Test",
      "url": "https://www.mone...",
    },
    {
      "title": "Ind vs Aus Live Boxing Day Test",
      "url": "https://timesofind...",
    },
    {
      "title": "Ind vs Aus - 4 Australian",
      "url": "https://economic...",
    }
  ];

  @override
  void initState() {
    ChatWebService().searchResulStream.listen((data) {
      setState(() {
        searchResults = data['data'];
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined),
            const SizedBox(
              width: 12,
            ),
            Text(
              "Sources",
              style: theme.bodyMedium?.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResults.map((res) {
              return Container(
                width: 140,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res['title'],
                      style: theme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      res['url'],
                      style: theme.bodySmall?.copyWith(
                        color: AppColors.textGrey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
