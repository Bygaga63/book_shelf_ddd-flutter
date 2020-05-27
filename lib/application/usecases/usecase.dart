import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}
