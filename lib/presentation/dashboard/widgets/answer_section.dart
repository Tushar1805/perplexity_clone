import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/core/theme/app_theme.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = """
  Elon Musk is a South African-born American entrepreneur, engineer, and business magnate who leads several major technology companies including Tesla, SpaceX, and X (formerly Twitter), and is recognized as one of the wealthiest people in the world, with a net worth estimated at over \$393 billion as of 2025.

  Early Life and Education
  Born June 28, 1971, in Pretoria, South Africa.

  Musk moved to Canada in 1989 and later to the U.S., attending Queen's University and then the University of Pennsylvania, where he earned degrees in physics and economics in 1997.

  Major Businesses
  Tesla: CEO since 2008, pioneering electric vehicles and battery technology.

  SpaceX: Founded in 2002, pushing advancements in reusable rockets and commercial spaceflight.

  X (formerly Twitter): Acquired in 2022, renamed in 2023, and implemented notable changes in social media engagement.

  PayPal (originally X.com): Cofounder of the online payments company, later sold to eBay.

  Other ventures include Neuralink (neurotechnology), the Boring Company (tunneling), OpenAI (artificial intelligence), and xAI.

  Cultural Impact and Notable Achievements
  Musk is also known for public commentary and political involvement, serving briefly in governmental advisory roles.

  He holds the title of the world’s wealthiest individual, with much of his wealth derived from Tesla and SpaceX stock.

  Musk has had significant influence in technology, transportation, space exploration, and artificial intelligence fields.


  """;

  @override
  void initState() {
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
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
        Text(
          "Perplexity",
          style: theme.bodyMedium?.copyWith(
            fontSize: 18,
          ),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(darkTheme).copyWith(
                codeblockDecoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                code: const TextStyle(fontSize: 16)),
          ),
        )
      ],
    );
  }
}
