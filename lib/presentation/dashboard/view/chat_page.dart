import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/answer_section.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/sidenav_bar.dart';
import 'package:perplexity_clone/presentation/dashboard/widgets/sources_section.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.question,
  });
  final String? question;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // StreamBuilder(
  //                 stream: ChatWebService().contentStream,
  //                 builder: (context, snapshot) {
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     return const LoadingWithoutText();
  //                   }

  //                   fullResponse += snapshot.data?['data'] ?? '';

  //                   return Text(fullResponse);
  //                 }),
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.question ?? "",
                      style: theme.displayLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // sources
                    SourcesSection(),
                    const SizedBox(
                      height: 24,
                    ),
                    // answers
                    AnswerSection()
                  ],
                ),
              ),
            ),
          ),
          Placeholder(
            strokeWidth: 0,
            color: AppColors.background,
          )
        ],
      ),
    );
  }
}
