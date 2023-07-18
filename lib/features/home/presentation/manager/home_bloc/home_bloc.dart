import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_with_bloc/features/home/domain/use_cases/get_products_usecase.dart';

import '../../../domain/entities/product_entity.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int pageNumber = 0;
  bool reachedLastElement = false;
  final GetProductsUseCase getProductsUseCase;

  HomeBloc(this.getProductsUseCase) : super(HomeInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      var result = await getProductsUseCase(pageNumber);
      result.fold((failure) {
        return emit(ProductsFailure(failure.message));
      }, (products) {
        return emit(ProductsSuccess(products: products));
      });
    });

    on<LoadMoreProductsEvent>((event, emit) async {
      emit(const ProductsPaginationLoading(true));
      pageNumber += event.pageNumber;
      print('Page Number >>>>>>>>>>>:   $pageNumber');
      var result = await getProductsUseCase(pageNumber);
      result.fold((failure) {
        return emit(ProductsPaginationFailure(failure.message));
      }, (products) {
        if (products.isEmpty) {
          reachedLastElement = true;
          return emit(ProductsPaginationState(
            products: products,
            reachedLastElement: true,
          ));
        } else {
          return emit(ProductsSuccess(products: products));
        }
      });
    });
  }
}
