import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{

  bool _isAPILoading = false;
  bool get isAPILoading => _isAPILoading;

  List<dynamic> _dummyList = [];
  List<dynamic> get dummyList => _dummyList;

  final dio = Dio();

  Future<void> getFakeStoreData()async{
    try{
      _isAPILoading = true;
      notifyListeners();
      
      var response = await dio.get('https://fakestoreapi.com/products',options: Options(contentType: 'application/json'));

      print(response.data);
      if(response.statusCode == 200 && response.data != null){
        _dummyList = response.data;
        _isAPILoading = false;
        notifyListeners();
      }
      _isAPILoading = false;
      notifyListeners();
    }catch(error){
      print('This is error:::: $error');
    }
  }

}