import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/presentation/cubits/top5_movies/top5_movies_cubit.dart';

class Top5Switcher extends StatefulWidget {
  const Top5Switcher({super.key});

  @override
  State<Top5Switcher> createState() => _Top5SwitcherState();
}

class _Top5SwitcherState extends State<Top5Switcher> {
  int _pos = 0;
  Timer? _timer;
  List<MovieDetails> _movies = [];

  @override
  void didChangeDependencies() {
    context.watch<Top5MoviesCubit>().state.maybeMap(
          loaded: (state) {
            _movies = state.movies;
            _pos = 0;
            _timer = Timer.periodic(const Duration(seconds: 5), (_) {
              setState(() {
                _pos = (_pos + 1) % _movies.length;
              });
            });
          },
          orElse: () => null,
        );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// class ImageRotater extends StatefulWidget {
//   List<String> photos;

//   ImageRotater(this.photos);

//   @override
//   State<StatefulWidget> createState() => new ImageRotaterState();
// }

// class ImageRotaterState extends State<ImageRotater> {
//   int _pos = 0;
//   Timer _timer;

//   @override
//   void initState() {
//     _timer = Timer.periodic(new Duration(seconds: 5), () {
//       setState(() {
//         _pos = (_pos + 1) % widget.photos.length;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Image.network(
//       widget.photos[_pos],
//       gaplessPlayback: true,
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _timer = null;
//     super.dispose();
//   }
// }