import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/infrastructure/datasources/data_source.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';
import 'package:flutter/foundation.dart';

class BookRepository implements IBookRepository {
  final IDatasource datasource;

  BookRepository({this.datasource});

  @override
  add(Book book) async {
    var model = BookModel.fromDomain(book);
    return await datasource.addBook(model);
  }

  @override
  Future<List<Book>> findAll() async {
    return await datasource.findAllBooks();
  }

  @override
  find({@required bookId}) async {
    return await datasource.findBook(bookId);
  }

  @override
  delete({@required bookId}) {}

  @override
  update(Book book) {}
}
