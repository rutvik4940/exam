import 'package:exam/screen/model/db_model.dart';
import 'package:exam/utils/helper/api_helper.dart';
import 'package:exam/utils/helper/db_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController
{
  RxList<ProductModel>l1=<ProductModel>[].obs;
  RxList<DbModel>l3=<DbModel>[].obs;

  Future<void> getData()
  async {
    List<ProductModel>? l2=await ApiHelper.helper.getProduct();
    if(l2!=null)
      {
        l1.value=l2;
      }
  }
  Future<void> getProductData()
  async {
    List<DbModel>? l4= await DbHelper.helper.readProduct();
    if(l4!=null)
      {
        l3.value=l4!;
      }
  }

}