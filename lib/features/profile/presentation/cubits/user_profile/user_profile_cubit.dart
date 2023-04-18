import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../domain/repositories/profile_repository.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

@singleton
class UserProfileCubit extends Cubit<UserProfileState> {
  final ProfileRepository _repository;
  final AuthBloc _authBloc;
  late StreamSubscription _streamSubscription;
  UserProfileCubit(
    this._repository,
    this._authBloc,
  ) : super(const UserProfileState.initial()) {
    _streamSubscription = _authBloc.stream.listen((state) {
      state.maybeMap(
        authenticated: (state) => fetchUserProfile(state.userId),
        orElse: () => _reset(),
      );
    });
  }

  Future<void> fetchUserProfile(String userId) async {
    emit(const UserProfileState.loading());

    final failureOrUserProfile = await _repository.fetchUserProfile(userId);
    await failureOrUserProfile.fold(
      (failure) async => await failure.maybeMap(
        // first log in
        userNotFound: (_) async => await _createNewUser(userId),
        // database or connection error
        orElse: () async => emit(const UserProfileState.error()),
      ),
      (userProfile) async =>
          emit(UserProfileState.loaded(userProfile: userProfile)),
    );
  }

  Future<void> _createNewUser(String userId) async {
    // create The Movie DB guest session
    final failureOrSessionId = await _repository.createGuestSession();
    await failureOrSessionId.fold(
      (_) async => emit(const UserProfileState.error()),
      (sessionId) async {
        // create new user in the DB
        final userProfile =
            UserProfile.newUser(userId).copyWith(sessionId: sessionId);
        final failureOrUnit = await _repository.createUserProfile(userProfile);
        await failureOrUnit.fold(
          (_) async => emit(const UserProfileState.error()),
          (_) async => emit(UserProfileState.loaded(userProfile: userProfile)),
        );
      },
    );
  }

  Future<void> _reset() async {
    emit(const UserProfileState.initial());
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
