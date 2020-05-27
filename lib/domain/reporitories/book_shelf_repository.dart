import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';

abstract class IBookShelfRepository {
  create(BookShelf bookShelf);
  update(BookShelf bookShelf);
  Future<BookShelf> find(Identity id);
}
