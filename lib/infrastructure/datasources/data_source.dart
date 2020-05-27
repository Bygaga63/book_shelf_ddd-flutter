import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';

abstract class IDatasource {
  addBook(BookModel model);
  Future<List<BookModel>> findAllBooks();
  Future<BookModel> findBook(Identity bookId);
}
