import 'dart:convert';

import 'package:exam/screen/home/model/home_model.dart';
import 'package:http/http.dart'as http;
class ApiHelper
{
 static ApiHelper helper =ApiHelper._();
  ApiHelper._();

  Future<List<ProductModel>?> getProduct()
  async {
    String link="https://fakestoreapi.com/products";
    var res=await http.get(Uri.parse(link));
    if(res.statusCode==200)
      {
        List json=jsonDecode(res.body);
        List<ProductModel> list=json.map((e) => ProductModel.mapToModel(e)).toList();
        return list;
      }
    return null;
  }

}