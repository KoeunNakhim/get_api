import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getx_for_begginer_2023/controller/product.controller.dart';
import 'package:get/get.dart';
class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Saerch',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  ),
                  IconButton(onPressed: () {},
                    icon: Icon(Icons.notifications),)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<ProductController>(
              builder: (_) {
                if (controller.isloding) {
                  return Center(child: CircularProgressIndicator(),);
                }
                if(controller.product.isEmpty){
                  return Center(child: Text('No Data'));
                }
                return Expanded(
                    child: RefreshIndicator(
                      onRefresh: (){
                        return controller.refreshProduct();
                      },
                      child: MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemBuilder: (context, index){
                          if(controller.product.length <= index){
                            return Container();
                          }
                          return Container(

                            height: 100,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(child:
                                Image.network(
                                  controller.product[index].image!,
                                  fit: BoxFit.cover,
                                )
                                ),
                                Text(
                                  controller.product[index].title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '\$${controller.product[index].price}',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                )
                              ],
                            ),
                          );
                        }
                      ),
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

