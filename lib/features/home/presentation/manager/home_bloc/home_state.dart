part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  get products => null;
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class ProductsPaginationLoading extends HomeState {
  final bool isLoading;

  const ProductsPaginationLoading(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class ProductsSuccess extends HomeState {
  final List<ProductEntity> products;

  const ProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsFailure extends HomeState {
  final String errMessage;

  const ProductsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class ProductsPaginationFailure extends HomeState {
  final String errMessage;

  const ProductsPaginationFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class ProductsPaginationState extends HomeState {
  final List<ProductEntity> products;
  final bool reachedLastElement;

  const ProductsPaginationState(
      {required this.products, required this.reachedLastElement});

  @override
  List<Object> get props => [products, reachedLastElement];
}
