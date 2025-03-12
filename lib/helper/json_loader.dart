import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio_web/model/data_model.dart';

class JsonLoader {
  Future<User> loadData() async {
    final jsonString = await rootBundle.loadString('assets/data/my_data.json');
    final jsonData = jsonDecode(jsonString);
    return User.fromJson(jsonData);
  }
}
