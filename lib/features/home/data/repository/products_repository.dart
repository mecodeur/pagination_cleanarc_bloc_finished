import 'package:dartz/dartz.dart';
import 'package:pagination_with_bloc/core/errors/failure.dart';
import 'package:pagination_with_bloc/features/home/data/data_sources/products_remote_data_source.dart';
import 'package:pagination_with_bloc/features/home/domain/entities/product_entity.dart';
import 'package:pagination_with_bloc/features/home/domain/repository/products_base_repository.dart';

class ProductsRepository extends ProductsBaseRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepository(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      {int pageNumber = 0}) async {
    try {
      final result =
          await productsRemoteDataSource.getProducts(pageNumber: pageNumber);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
