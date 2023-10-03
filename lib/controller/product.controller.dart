import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_for_begginer_2023/helper.dart';
import 'package:getx_for_begginer_2023/model/product_res_model.dart';

class ProductController extends GetxController{
  final Helper _api = Helper();
  bool isloding = false;
  List<ProductResModel> productResModel = [];
  List<ProductResModel> get product => productResModel;
  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
Future refreshProduct() async{
    getProduct();
    return true;
}
  void getProduct() async{
    try{
      isloding = true;
      update();
      final product = await _api.getProduct();
      if(product.isNotEmpty) {
        productResModel = product;
      }

        isloding = false;
        update();
        print(product);
      }catch (e){
      isloding = false;
      update();
      print(e);

    }
  }
}