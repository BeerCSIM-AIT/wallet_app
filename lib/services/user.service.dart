import 'dart:convert';

import 'package:wallet_app/constants/http.constant.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/models/user.model.dart';

class UserService {
  Future<User> getUser(String id) async {
    print(baseUrl + "user/" + id);
    Uri _uri = Uri.parse(baseUrl + "user/" + id);
    var response = await http.get(_uri, headers: setHeaders());
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedData = json.decode(response.body);
      parsedData = parsedData['data'];
      User user = User(
        userType: parsedData['user_type'].toString(),
        id: parsedData['_id'].toString(),
        name: parsedData['name'].toString(),
        email: parsedData['email'].toString(),
        password: parsedData['password'].toString(),
        phoneNumber: parsedData['phone_number'].toString(),
        balance: parsedData['balance'],
      );
      return user;
    } else {
      throw Exception("No user data");
    }
  }
}
