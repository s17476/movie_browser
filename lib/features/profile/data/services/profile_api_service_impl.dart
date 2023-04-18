import 'package:injectable/injectable.dart';
import 'package:movie_browser/features/profile/domain/entities/user_profile.dart';

import '../../domain/services/profile_api_service.dart';

@LazySingleton(as: ProfileApiService)
class ProfileApiServiceImpl extends ProfileApiService {}
