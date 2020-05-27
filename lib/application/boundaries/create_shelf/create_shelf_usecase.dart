import 'package:bookdddflutter/application/boundaries/create_shelf/create_shelf_output.dart';

abstract class ICreateShelfUseCase {
  Future<CreateShelfOutput> call();
}
