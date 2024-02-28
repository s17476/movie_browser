import 'package:flutter/material.dart';

// API base URL
const kBaseUrl = 'api.themoviedb.org';
// list tile leading image base URL
const kImagesBaseUrl = 'https://image.tmdb.org/t/p/';

const kProvidersBaseUrl = 'https://media.themoviedb.org/t/p/original/';

const kWatchUrlPrefix = 'https://www.themoviedb.org/movie/';
const kWatchUrlSufix = '/watch?translate=false&locale=US';

// shimmer base color
const kShimmerBaseColor = Colors.black;
// shimmer highlight color
const kShimmerHighlightColor = Color(0xff202020);


// https://api.themoviedb.org/3/search/movie?api_key=052afdb6e0ab9af424e3f3c8edbb33fb&language=en-US&page=1&include_adult=false&query=mama