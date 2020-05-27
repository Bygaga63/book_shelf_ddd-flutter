import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter/foundation.dart';

abstract class IEntityFactory {
  Book newBook({
    @required Title title,
    @required Author author,
    @required ISBN isbn,
    @required PublishDate publishDate,
  });

  BookShelf newBookShelf();
}
