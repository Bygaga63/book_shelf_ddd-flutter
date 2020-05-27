import 'package:bookdddflutter/domain/entities/book_entity.dart';

class BookShelf {
  final String id;
  List<Book> books = [];

  BookShelf(this.id);
}
