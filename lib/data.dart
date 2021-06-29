import 'dart:convert';

import 'package:flutter/services.dart';

class Data{
  List continents =[];
  Map data= {};
  Future<void> readJson() async{
    var jsonText = await rootBundle.loadString('JsonData/data.json');
      data = await json.decode(jsonText);
  }
  Future<void> getContinents() async{
    await readJson();
    var continentsJson = data['continents'];
    await continentsJson.forEach((key,value){
      continents.add(value);
    });
  }

}