import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/core/services/api_service.dart';
import 'package:pagination_with_bloc/core/services/service_locator.dart';
import 'package:pagination_with_bloc/features/home/data/data_sources/products_remote_data_source.dart';
import 'package:pagination_with_bloc/features/home/data/repository/products_repository.dart';
import 'package:pagination_with_bloc/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:pagination_with_bloc/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:pagination_with_bloc/features/home/presentation/widgets/list_view_products_blocbuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.titlePage, Key? key}) : super(key: key);

  final String titlePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
      ),
      body: BlocProvider(
        create: (context) =>
            HomeBloc(getIt.get<GetProductsUseCase>())..add(GetProductsEvent()),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const ListViewProductsBlocBuilder(),
        ),
      ),
    );
  }
}
