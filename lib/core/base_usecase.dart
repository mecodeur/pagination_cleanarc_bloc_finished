import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors/failure.dart';

abstract class BaseUseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParameter extends Equatable {
  @override
  List<Object> get props => [];
}
