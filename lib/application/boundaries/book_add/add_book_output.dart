import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter/foundation.dart';

class AddBookOutput {
  final Identity bookId;
  final Identity shelfId;
  final Title title;
  final Author author;
  final ISBN isbn;
  final PublishDate publishDate;

  const AddBookOutput({
    @required this.bookId,
    @required this.shelfId,
    @required this.title,
    @required this.author,
    @required this.isbn,
    @required this.publishDate,
  });
}
