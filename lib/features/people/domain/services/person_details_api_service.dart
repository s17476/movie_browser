import '../entities/person_credits.dart';
import '../entities/person_details.dart';

abstract class PersonDetailsApiService {
  Future<PersonDetails> fetchPersonDetails(int personId);
  Future<PersonCredits> fetchPersonCredits(int personId);
}
