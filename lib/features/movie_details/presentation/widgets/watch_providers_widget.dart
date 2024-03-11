import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/watch_providers/watch_providers_cubit.dart';

class WatchProvidersWidget extends StatelessWidget {
  const WatchProvidersWidget({super.key, required this.detailsId});

  final int detailsId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchProvidersCubit, WatchProvidersState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            if (state.id == detailsId) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProvidersList(
                      id: state.id,
                      title: 'Stream',
                      providers: state.streamProviders,
                    ),
                    const SizedBox(height: 4),
                    _ProvidersList(
                      id: state.id,
                      title: 'Rent',
                      providers: state.rentProviders,
                    ),
                    const SizedBox(height: 4),
                    _ProvidersList(
                      id: state.id,
                      title: 'Buy',
                      providers: state.buyProviders,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class _ProvidersList extends StatelessWidget {
  const _ProvidersList({
    Key? key,
    required this.id,
    required this.title,
    required this.providers,
  }) : super(key: key);

  final int id;
  final String title;
  final List<WatchProvider> providers;

  @override
  Widget build(BuildContext context) {
    if (providers.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          children: providers
              .map((provider) => ProviderIcon(provider: provider, id: id))
              .toList(),
        )
      ],
    );
  }
}

class ProviderIcon extends StatelessWidget {
  const ProviderIcon({
    Key? key,
    required this.id,
    required this.provider,
  }) : super(key: key);

  final int id;
  final WatchProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
            FadeInImage(
              imageErrorBuilder: (context, error, stackTrace) => const Center(
                child: Text(
                  'No image found',
                  textAlign: TextAlign.center,
                ),
              ),
              placeholder: const AssetImage('assets/images/loading.gif'),
              placeholderFit: BoxFit.scaleDown,
              image: CachedNetworkImageProvider(
                '$kProvidersBaseUrl${provider.logoPath}',
                cacheManager: DefaultCacheManager(),
              ),
              fit: BoxFit.fitHeight,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  final url = Uri.parse('$kWatchUrlPrefix$id$kWatchUrlSufix');
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
