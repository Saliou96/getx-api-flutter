import 'package:get/get.dart';
import 'package:getx_api/ui/product_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => ProductView(),
    ),
  ];
}
