import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter/foundation.dart';

class AddBookInput {
  final Identity shelfId;
  final Title title;
  final Author author;
  final ISBN isbn;
  final PublishDate publishDate;

  const AddBookInput({
    @required this.shelfId,
    @required this.title,
    @required this.author,
    @required this.isbn,
    @required this.publishDate,
  })  : assert(shelfId != null),
        assert(title != null),
        assert(author != null),
        assert(isbn != null),
        assert(publishDate != null);
}
