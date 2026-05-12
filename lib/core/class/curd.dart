import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_delivey_version/core/class/status_request.dart';

import '../function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    print('HTTP POST: $linkurl | Data: $data');
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print('HTTP POST: $linkurl | Status: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            Map responsebody = jsonDecode(response.body);
            print('Response Body: ${response.body}');
            return Right(responsebody);
          } catch (e) {
            print('JSON Decode Error: $e | Body: ${response.body}');
            return const Left(StatusRequest.serverfailure);
          }
        } else {
          print('Server Failure: ${response.statusCode}');
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print('Offline Failure');
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print('Network Exception: $e');
      return const Left(StatusRequest.timeoutfailure);
    }
  }
}
