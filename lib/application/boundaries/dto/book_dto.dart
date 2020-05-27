import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';

class BookDto {
  Identity id;
  Identity shelfId;
  Title title;
  Author author;
  ISBN isbn;
  PublishDate publishDate;

  BookDto({
    this.id,
    this.shelfId,
    this.title,
    this.author,
    this.isbn,
    this.publishDate,
  });

  BookDto.fromEntity(Book book)
      : id = book.id,
        shelfId = book.shelfId,
        title = book.title,
        author = book.author,
        isbn = book.isbn,
        publishDate = book.publishDate;
}
