import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:pyco_test_flutter/model/infomation.dart';

class TinderBloc {
  final StreamController _tinderStreamController = StreamController<List<User>>();

  Stream<List<User>> get tinderStream => _tinderStreamController.stream;

  Future<void> getTinderInfo(int num) async {
    List<User> userList = [];
    try {
      for (int i = 0; i < num; i++) {
        final response = await get('https://randomuser.me/api/0.4/?randomapi');
        if (response.statusCode == 200) {
          final jsonReponse = json.decode(response.body);
          User user = Information.fromJson(jsonReponse).results[0].user;
          print('==========CALL API SUCCESS===============');
          print(jsonReponse);
          userList.add(user);
        } else {
          print('==========CALL API FAILED===============');
          _tinderStreamController.sink.addError('FAILED');
        }
      }
      _tinderStreamController.sink.add(userList);
    } catch (e) {
      print(e);
      _tinderStreamController.sink.addError('FAILED');
    }
  }

  void dispose() {
    _tinderStreamController.close();
  }
}
