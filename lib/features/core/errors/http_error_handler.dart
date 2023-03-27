import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) =>
    'Request failed\nReason: ${response.reasonPhrase}';
