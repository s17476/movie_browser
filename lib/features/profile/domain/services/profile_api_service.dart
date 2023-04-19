abstract class ProfileApiService {
  Future<String> createGuestSession();
  Future<void> rateMovie(int movieId, String sessionId, int value);
  Future<void> rateTvShow(int showId, String sessionId, int value);
}
