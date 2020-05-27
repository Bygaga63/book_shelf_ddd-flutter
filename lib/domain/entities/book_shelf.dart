import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:flutter/foundation.dart';

import '../domain_exception.dart';

class BookShelf {
  static const MAX_CAPACITY = 10;
  Identity id;
  List<Book> _books;

  List<Book> get books => _books;

  BookShelf({@required this.id}) {
    _books = List();
  }

  addBook(Book book) {
    if (_books.length == MAX_CAPACITY)
      throw DomainException('Book shelf has reached maximum capacity');
    book.shelfId = id;
    _books.add(book);
  }
}
