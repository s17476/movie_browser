import 'package:movie_browser/features/people/domain/entities/person_credits.dart';
import 'package:movie_browser/features/people/domain/entities/person_details.dart';

abstract class PersonDetailsApiService {
  Future<PersonDetails> fetchPersonDetails(int personId);
  Future<PersonCredits> fetchPersonCredits(int personId);
}
