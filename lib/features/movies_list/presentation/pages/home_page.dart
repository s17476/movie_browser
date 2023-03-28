import 'package:flutter/material.dart';

import '../widgets/genres_list.dart';
import '../widgets/top20_list.dart';
import '../widgets/top20_switcher.dart';
import '../widgets/top20_tv_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Movie Browser'),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16,
        ),
        // shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Top20Switcher(),
          SizedBox(
            height: 8,
          ),
          Top20List(),
          Top20TvList(),
          Genreslist(),
        ],
      ),
    );
  }
}
