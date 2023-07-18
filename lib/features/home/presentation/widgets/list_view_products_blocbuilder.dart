import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/features/home/domain/entities/product_entity.dart';
import 'package:pagination_with_bloc/features/home/presentation/manager/home_bloc/home_bloc.dart';

import '../../../../core/widgets/build_error_snack_bar.dart';
import 'list_view_products.dart';

class ListViewProductsBlocBuilder extends StatelessWidget {
  const ListViewProductsBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> products = [];

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          products.addAll(state.products);
        }
        if (state is ProductsPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
        if (state is ProductsPaginationState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget('No more products'),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccess ||
            state is ProductsPaginationLoading ||
            state is ProductsPaginationFailure ||
            state is ProductsPaginationState) {
          return ListViewProducts(
            product: products,
          );
        } else if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Center(child: Text('Error : ${state.errMessage}'));
        } else {
          return Container();
        }
      },
    );
  }
}
