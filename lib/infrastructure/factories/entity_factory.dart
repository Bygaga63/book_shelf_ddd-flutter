import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/factories/entity_factory.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class EntityFactory implements IEntityFactory {
  @override
  Book newBook({
    @required Title title,
    @required Author author,
    @required ISBN isbn,
    @required PublishDate publishDate,
  }) {
    return Book(
        id: Identity.fromString(Uuid().v4()),
        title: title,
        author: author,
        isbn: isbn,
        publishDate: publishDate);
  }

  @override
  BookShelf newBookShelf() {
    return BookShelf(id: Identity.fromString(Uuid().v4()));
  }
}
