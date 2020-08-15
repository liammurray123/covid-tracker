import 'package:http/http.dart' as http;
import 'dart:convert';

const apiURL = 'https://api.covid19api.com';

class APIDataClass {
  Future<dynamic> getGlobalData() async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/summary');

    var globalData = await networkHelper.callAPI();

    return globalData;
  }

  int getCountryNumber(String country) {
    if (country == 'Australia') {
      return 8;
    } else if (country == 'Belgium') {
      return 16;
    } else if (country == 'Brazil') {
      return 23;
    } else if (country == 'Canada') {
      return 30;
    } else if (country == 'China') {
      return 35;
    } else if (country == 'Denmark') {
      return 46;
    } else if (country == 'Finland') {
      return 58;
    } else if (country == 'France') {
      return 59;
    } else if (country == 'Germany') {
      return 63;
    } else if (country == 'Greece') {
      return 65;
    } else if (country == 'India') {
      return 76;
    } else if (country == 'Ireland') {
      return 80;
    } else if (country == 'Italy') {
      return 82;
    } else if (country == 'Japan') {
      return 84;
    } else if (country == 'Korea (South)') {
      return 88;
    } else if (country == 'Mexico') {
      return 109;
    } else if (country == 'Netherlands') {
      return 119;
    } else if (country == 'New Zealand') {
      return 120;
    } else if (country == 'Norway') {
      return 124;
    } else if (country == 'Portugal') {
      return 134;
    } else if (country == 'Russia') {
      return 138;
    } else if (country == 'Slovakia') {
      return 151;
    } else if (country == 'Slovenia') {
      return 152;
    } else if (country == 'Spain') {
      return 156;
    } else if (country == 'Sweden') {
      return 161;
    } else if (country == 'Switzerland') {
      return 162;
    } else if (country == 'Turkey') {
      return 172;
    } else if (country == 'Ukraine') {
      return 174;
    } else if (country == 'UK') {
      return 176;
    } else if (country == 'USA') {
      return 177;
    } else {
      return null;
    }
  }

  int getCountryHealthNumber(String country) {
    if (country == 'Australia') {
      return 119;
    } else if (country == 'Belgium') {
      return 101;
    } else if (country == 'Brazil') {
      return 190;
    } else if (country == 'Canada') {
      return 311;
    } else if (country == 'China') {
      return 112;
    } else if (country == 'Denmark') {
      return 114;
    } else if (country == 'Finland') {
      return 112;
    } else if (country == 'France') {
      return 17;
    } else if (country == 'Germany') {
      return 110;
    } else if (country == 'Greece') {
      return 100;
    } else if (country == 'India') {
      return 100;
    } else if (country == 'Ireland') {
      return 112;
    } else if (country == 'Italy') {
      return 112;
    } else if (country == 'Japan') {
      return 119;
    } else if (country == 'Korea (South)') {
      return 112;
    } else if (country == 'Mexico') {
      return 66;
    } else if (country == 'Netherlands') {
      return 112;
    } else if (country == 'New Zealand') {
      return 111;
    } else if (country == 'Norway') {
      return 02800;
    } else if (country == 'Portugal') {
      return 112;
    } else if (country == 'Russia') {
      return 112;
    } else if (country == 'Slovakia') {
      return 112;
    } else if (country == 'Slovenia') {
      return 112;
    } else if (country == 'Spain') {
      return 112;
    } else if (country == 'Sweden') {
      return 1177;
    } else if (country == 'Switzerland') {
      return 112;
    } else if (country == 'Turkey') {
      return 112;
    } else if (country == 'Ukraine') {
      return 112;
    } else if (country == 'UK') {
      return 101;
    } else if (country == 'USA') {
      return 311;
    } else {
      return 112;
    }
  }
}

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future callAPI() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

const List<String> countryList = [
  'Australia',
  'Belgium',
  'Brazil',
  'Canada',
  'China',
  'Denmark',
  'Finland',
  'France',
  'Germany',
  'Greece',
  'Ireland',
  'India',
  'Italy',
  'Japan',
  'Korea (South)',
  'Mexico',
  'Netherlands',
  'New Zealand',
  'Norway',
  'Portugal',
  'Russia',
  'Slovakia',
  'Slovenia',
  'Spain',
  'Sweden',
  'Switzerland',
  'Turkey',
  'Ukraine',
  'UK',
  'USA'
];
