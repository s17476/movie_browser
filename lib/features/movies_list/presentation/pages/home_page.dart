import 'package:flutter/material.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/top5_switcher.dart';

import '../widgets/top20_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Movie Browser'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [Top5Switcher(), Flexible(child: Top20List())],
      ),
    );
  }
}
