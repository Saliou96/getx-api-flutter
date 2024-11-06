import 'package:get/get.dart';
import 'package:getx_api/model/product.dart';
import 'package:getx_api/service/product_service.dart';

class ProductController extends GetxController with StateMixin<List<Product>> {
  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Méthode pour récupérer les produits
  void fetchProducts() async {
    change(null, status: RxStatus.loading()); // Passer en état "loading"

    try {
      final products = await productService.fetchProducts();
      change(products,
          status:
              RxStatus.success()); // Passer en état "success" avec les données
    } catch (error) {
      change(null,
          status: RxStatus.error("Erreur lors du chargement des produits"));
    }
  }

   Future<void> addProduct(Product product) async {
    try {
      change(null, status: RxStatus.loading());
      print(state);
      final newProduct = await productService.createProduct(product);
      if (newProduct != null) {
        // Mise à jour de la liste des produits
        // final updatedProducts = [...?state, newProduct];
        // change(updatedProducts, status: RxStatus.success());
        fetchProducts();
      }
    } catch (error) {
      change(null, status: RxStatus.error("Erreur lors de la création du produit"));
    }
  }
}
