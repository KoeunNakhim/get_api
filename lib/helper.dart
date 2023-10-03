import 'package:dio/dio.dart';
import 'model/product_res_model.dart';

class Helper{
  final dio = Dio();

  Future<List<ProductResModel>> getProduct()async{
    try{
      final respone = await dio.get('https://fakestoreapi.com/products');
      return (respone.data as List)
          .map((e) => ProductResModel.fromJson(e))
          .toList();
    }catch (e){
      throw e;
    }
  }
}