import 'dart:convert';

import 'package:covid_tracer_app/model/WorldStatesModel.dart';
import 'package:covid_tracer_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {

  Future<WorldStatesModel> fetchWorldStateRecords () async {

    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if(response.statusCode == 200){

      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("error");
    }
}
  Future<List<dynamic>> countriesListApi () async {
   var data;
    final response = await http.get(Uri.parse(AppUrl.countiresList));
    if(response.statusCode == 200){

      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("error");
    }
  }
}