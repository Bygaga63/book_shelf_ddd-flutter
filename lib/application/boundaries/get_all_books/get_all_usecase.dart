import 'package:bookdddflutter/application/boundaries/get_all_books/get_all_output.dart';

abstract class IGetAllUseCase {
  Future<GetAllBooksOutput> call();
}
