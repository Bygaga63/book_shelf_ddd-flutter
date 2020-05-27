import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_input.dart';
import 'package:bookdddflutter/application/usecases/get_book_by_id_usecase.dart';
import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBookRepository extends Mock implements IBookRepository {}

void main() {
  GetBookByIdUseCase useCase;
  MockBookRepository mockBookRepository;

  setUp(() {
    mockBookRepository = MockBookRepository();
    useCase = GetBookByIdUseCase(bookRepository: mockBookRepository);
  });

  group('GetBookByIdUseCase', () {
    var input = GetBookByIdInput(bookId: Identity.fromString('aaa'));

    test('should recive failure when book not fount', () async {
      //arrange

      when(mockBookRepository.find(bookId: input.bookId))
          .thenAnswer((_) async => null);
      //act
      final result = await useCase(input);
      //assert
      expect(result.isLeft(), true);
    });

    test('should get book by id', () async {
      //arrange
      var book = Book();
      when(mockBookRepository.find(bookId: input.bookId))
          .thenAnswer((_) async => book);
      //act
      final result = await useCase(input);
      //assert
      expect(result.isRight(), true);
    });
  });
}
