import 'package:dartz/dartz.dart';
import 'package:pagination_with_bloc/core/base_usecase.dart';
import 'package:pagination_with_bloc/core/errors/failure.dart';
import 'package:pagination_with_bloc/features/home/domain/repository/products_base_repository.dart';

import '../entities/product_entity.dart';

class GetProductsUseCase extends BaseUseCase<List<ProductEntity>, int> {
  final ProductsBaseRepository productsBaseRepository;

  GetProductsUseCase(this.productsBaseRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([int param = 0]) async {
    return await productsBaseRepository.getProducts(pageNumber: param);
  }
}
