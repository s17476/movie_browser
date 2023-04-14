import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/person_credits.dart';
import '../../domain/entities/person_details.dart';
import '../../domain/repositories/person_details_repository.dart';
import '../../domain/services/person_details_api_service.dart';

@LazySingleton(as: PersonDetailsRepository)
class PersonDetailsRepositoryImpl extends PersonDetailsRepository {
  final PersonDetailsApiService apiService;

  PersonDetailsRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, PersonDetails>> fetchPersonDetails(
      int personId) async {
    try {
      final PersonDetails person =
          await apiService.fetchPersonDetails(personId);
      return right(person);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PersonCredits>> fetchPersonCredits(
    int personId,
  ) async {
    try {
      final PersonCredits personCredits =
          await apiService.fetchPersonCredits(personId);
      return right(personCredits);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }
}
