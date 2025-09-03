import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/core/theme/app_theme.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullResponse = "";

  @override
  void initState() {
    ChatWebService().contentStream.listen((data) {
      setState(() {
        fullResponse += data['data'];
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
        Text(
          "Perplexity",
          style: theme.bodyMedium?.copyWith(
            fontSize: 18,
          ),
        ),
        Markdown(
          data: fullResponse,
          shrinkWrap: true,
          styleSheet: MarkdownStyleSheet.fromTheme(darkTheme).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16)),
        )
      ],
    );
  }
}
