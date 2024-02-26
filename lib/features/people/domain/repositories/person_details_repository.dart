import 'package:dartz/dartz.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/people/domain/entities/person_credits.dart';
import 'package:movie_browser/features/people/domain/entities/person_details.dart';

abstract class PersonDetailsRepository {
  Future<Either<Failure, PersonDetails>> fetchPersonDetails(int personId);
  Future<Either<Failure, PersonCredits>> fetchPersonCredits(int personId);
}
