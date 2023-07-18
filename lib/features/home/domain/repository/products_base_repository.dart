import 'package:dartz/dartz.dart';
import 'package:pagination_with_bloc/core/errors/failure.dart';
import 'package:pagination_with_bloc/features/home/domain/entities/product_entity.dart';

abstract class ProductsBaseRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({int pageNumber = 0});
}
