import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/reporitories/book_shelf_repository.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/infrastructure/datasources/data_source.dart';
import 'package:flutter/foundation.dart';

class ShelfRepository implements IBookShelfRepository {
  IDatasource _ds;

  ShelfRepository({@required datasource}) : _ds = datasource;

  @override
  create(BookShelf bookShelf) {}

  @override
  Future<BookShelf> find(Identity id) {}

  @override
  update(BookShelf bookShelf) {}
}
