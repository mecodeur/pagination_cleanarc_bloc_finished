import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/features/home/domain/entities/product_entity.dart';
import 'package:pagination_with_bloc/features/home/presentation/manager/home_bloc/home_bloc.dart';

class ListViewProducts extends StatefulWidget {
  const ListViewProducts({
    required this.product,
    super.key,
  });

  final List<ProductEntity> product;

  @override
  State<ListViewProducts> createState() => _ListViewProductsState();
}

class _ListViewProductsState extends State<ListViewProducts> {
  late final ScrollController _scrollController;
  var nextPage = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final homeBloc = BlocProvider.of<HomeBloc>(context);
      if (!isLoading && !homeBloc.reachedLastElement) {
        isLoading = true;
        homeBloc.add(LoadMoreProductsEvent(pageNumber: nextPage + 10));
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      itemCount: isLoading ? widget.product.length : widget.product.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if ((index >= widget.product.length)) {
          if (!BlocProvider.of<HomeBloc>(context).reachedLastElement) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        } else {
          return Card(
            child: ListTile(
              leading: Image.network(
                  width: 100, height: 100, widget.product[index].thumbnail),
              title: Text(widget.product[index].title),
              subtitle: Text(widget.product[index].description),
            ),
          );
        }
      },
    );
  }
}
