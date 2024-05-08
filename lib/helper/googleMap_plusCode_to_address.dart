import 'dart:convert';

import 'package:http/http.dart' as http;
class GoogleMapsApi{


  Future<String> convertPlusCodeToAddress(plusCode) async {
    print('gmap function $plusCode');

    const apiKey = 'AIzaSyCU-8LgT4STMSjuU6nzITnbIoC4r3JJIEE'; // Replace with your API key
    final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?plus_code=$plusCode&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Check if the response contains results
        if (data['results'] != null && data['results'].isNotEmpty) {
          print('raw data: $data');
          print('${data['results'][0]['formatted_address']}');
            return data['results'][0]['formatted_address'];

        } else {
          print('not result');
           return '';
        }
      } else {
        print('not 200 status');
        return '';
        print('Error:${response.reasonPhrase}');

      }
    } catch (e) {
      print('Error: $e');
        return 'Error: $e';
    }
  }
}