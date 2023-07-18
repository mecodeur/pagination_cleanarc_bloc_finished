import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pagination_with_bloc/core/services/api_service.dart';
import 'package:pagination_with_bloc/features/home/data/data_sources/products_remote_data_source.dart';
import 'package:pagination_with_bloc/features/home/data/repository/products_repository.dart';

import '../../features/home/domain/use_cases/get_products_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<GetProductsUseCase>(GetProductsUseCase(ProductsRepository(ProductsRemoteDataSource(ApiService(Dio())))));
}