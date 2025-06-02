import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<FailureModel, Type>> call();
}

