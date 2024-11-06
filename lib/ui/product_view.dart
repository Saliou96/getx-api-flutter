import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/product_controller.dart';
import 'package:getx_api/model/product.dart';
import 'package:getx_api/service/product_service.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController(productService: ProductService()));

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (products) => ListView.builder(
                itemCount: products?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = products![index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.body),
                  );
                },
              ),
              onLoading: Center(child: CircularProgressIndicator()),
              onError: (error) => Center(child: Text(error ?? "Erreur inconnue")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(labelText: 'Body'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final newProduct = Product(
                      userId: 1, // userId et id seront configurés comme tu le souhaites
                      id: 0,
                      title: titleController.text,
                      body: bodyController.text,
                    );
                    controller.addProduct(newProduct);
                  },
                  child: Text("Add Product"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
