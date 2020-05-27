import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter/foundation.dart';

class BookModel extends Book {
  Identity id;
  Identity shelfId;
  Title title;
  Author author;
  ISBN isbn;
  PublishDate publishDate;

  BookModel({
    @required this.id,
    @required this.shelfId,
    @required this.title,
    @required this.author,
    @required this.isbn,
    @required this.publishDate,
  });

  factory BookModel.fromDomain(Book book) {
    return BookModel(
        title: book.title,
        id: book.id,
        publishDate: book.publishDate,
        shelfId: book.shelfId,
        isbn: book.isbn,
        author: book.author);
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: Identity.fromString(map["Book_Id"]),
      shelfId: Identity.fromString(map["Shelf_Id"]),
      title: Title.create(map["Title"]).getOrElse(null),
      author: Author.create(map["Author"]).getOrElse(null),
      isbn: ISBN.create(map["ISBN"]).getOrElse(null),
      publishDate: PublishDate.create(map["Publish_Date"]).getOrElse(null),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "Book_Id": id.id,
      "Shelf_Id": shelfId.id,
      "Title": title.value,
      "Author": author.value,
      "ISBN": isbn.value,
      "publishDate": publishDate.toString()
    };
  }
}
