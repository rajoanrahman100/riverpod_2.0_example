import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_demo/model/user__data_model.dart';

class ApiService{
  String endPoint='https://reqres.in/api/users?page=1';

  Future<List<Data>> getUser()async{
    Response response=await get(Uri.parse(endPoint));
    if(response.statusCode==200){
      var dataMap=jsonDecode(response.body);
      UserDataModel userDataModel=UserDataModel.fromJson(dataMap);
      return userDataModel.data!;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}