import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/person_credits.dart';
import '../entities/person_details.dart';

abstract class PersonDetailsRepository {
  Future<Either<Failure, PersonDetails>> fetchPersonDetails(int personId);
  Future<Either<Failure, PersonCredits>> fetchPersonCredits(int personId);
}
