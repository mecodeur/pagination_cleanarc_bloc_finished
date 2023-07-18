import 'package:pagination_with_bloc/core/services/api_service.dart';
import 'package:pagination_with_bloc/features/home/data/models/product_model.dart';

abstract class BaseProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({int pageNumber = 0});
}

class ProductsRemoteDataSource extends BaseProductsRemoteDataSource {
  final ApiService apiService;

  ProductsRemoteDataSource(this.apiService);

  @override
  Future<List<ProductModel>> getProducts({int pageNumber = 0}) async {
    Map<String, dynamic> result =
        await apiService.get(endPoint: 'products?limit=10&skip=${pageNumber}');

    List<ProductModel> products = [];
    products =
        List.from((result['products']).map((e) => ProductModel.fromJson(e)));

    return products;
  }
}
