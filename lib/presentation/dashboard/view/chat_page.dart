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
   final ScrollController _scrollController = ScrollController();

    @override
  void initState() {
    super.initState();
    // Listen to rebuilds and auto-scroll
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // 👉 Web / Desktop layout
          return Scaffold(
            body: Row(
              children: [
                const SideBar(),
                const SizedBox(width: 100),
                Expanded(
                  child: _buildMainContent(theme),
                ),
                const Placeholder(
                  strokeWidth: 0,
                  color: AppColors.background,
                ),
              ],
            ),
          );
        } else {
          // 👉 Mobile / Tablet layout
          return Scaffold(
            appBar: AppBar(
              title: const Text(""),
            ),
            drawer: const SideBar(), // Sidebar as drawer
            body: _buildMainContent(theme),
          );
        }
      },
    );
  }

  Widget _buildMainContent(TextTheme theme) {
    return SingleChildScrollView(
      controller: _scrollController, // control here
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question ?? "",
              style: theme.displayLarge,
            ),
            const SizedBox(height: 24),
            const SourcesSection(),
            const SizedBox(height: 24),
            const AnswerSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
