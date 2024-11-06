import 'package:get/get.dart';
import 'package:getx_api/model/product.dart';

class ProductService extends GetConnect {

  String url = 'https://jsonplaceholder.typicode.com';
  // Méthode pour récupérer les produits
  Future<List<Product>?> fetchProducts() async {
    final response =
        await get('$url/posts'); // Remplace "/products" par le bon endpoint
    print("response: $response");
    if (response.status.hasError) {
      return Future.error("Erreur lors du chargement des produits");
    } else {
      return (response.body as List)
          .map((data) => Product.fromJson(data))
          .toList();
    }
  }

  Future<Product?> createProduct(Product product) async {
    final response = await post('$url/posts', product.toJson());
    if (response.status.hasError) {
      return Future.error("Erreur lors de la création du produit");
    } else {
      return Product.fromJson(response.body);
    }
  }
}
