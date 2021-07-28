import 'dart:convert';
import 'dart:io';
import 'app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'https://pokeapi.co/api/v2/';

  Future<dynamic> get(String url) async {
    var responseJson;
      try {
        final response = await http.get(_baseUrl + url);
        responseJson = json.decode(response.body.toString());
      } on SocketException {
        print('Connection error');
      }
      return responseJson;
    }

  Future<dynamic> post(String url, dynamic body ) async {
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
