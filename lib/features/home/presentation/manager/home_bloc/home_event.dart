part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetProductsEvent extends HomeEvent {

  @override
  List<Object> get props => [];
}

class LoadMoreProductsEvent extends HomeEvent {
  final int pageNumber;

  const LoadMoreProductsEvent({required this.pageNumber});

  @override
  List<Object> get props => [];
}