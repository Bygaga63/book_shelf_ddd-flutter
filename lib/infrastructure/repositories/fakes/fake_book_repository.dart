import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';

class FakeBookRepository implements IBookRepository {
  var map = {
    "Book_Id": "aaa",
    "Shelf_Id": "bbb",
    "Title": "Red Rose",
    "Author": "Jan Jensen",
    "ISBN": "ISBN-10: 0-596-52068-9",
    "Publish_Date": "2020-01-20"
  };

  var map2 = {
    "Book_Id": "aab",
    "Shelf_Id": "bbb",
    "Title": "Whisper",
    "Author": "Jan Jensen",
    "ISBN": "ISBN-10: 0-596-52069-9",
    "Publish_Date": "2015-01-20"
  };

  List<Book> books;

  FakeBookRepository() {
    books = [
      BookModel.fromMap(map),
      BookModel.fromMap(map2),
      BookModel.fromMap(map),
      BookModel.fromMap(map2),
      BookModel.fromMap(map)
    ];
  }

  @override
  add(Book book) {
    return books.add(book);
  }

  @override
  delete({Identity bookId}) {
    return null;
  }

  @override
  Future<Book> find({Identity bookId}) {
    return null;
  }

  @override
  Future<List<Book>> findAll() async {
    return books;
  }

  @override
  update(Book book) {
    return null;
  }
}
