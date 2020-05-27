import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:flutter/foundation.dart';

abstract class IBookRepository {
  add(Book book);
  update(Book book);
  delete({@required Identity bookId});
  find({@required Identity bookId});
  Future<List<Book>> findAll();
}
