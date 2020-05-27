import 'package:bookdddflutter/application/usecases/get_all_usecase.dart';
import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBookRepository extends Mock implements IBookRepository {}

void main() {
  GetAllUseCase usecase;
  MockBookRepository mockBookRepository;
  setUp(() {
    mockBookRepository = MockBookRepository();
    usecase = GetAllUseCase(bookRepository: mockBookRepository);
  });

  group('GetAllUsecase', () {
    test('should return an empty list', () async {
      //arrange
      when(mockBookRepository.findAll()).thenAnswer((_) async => []);
      //act
      final result = await usecase();
      //assert
      expect(result.books, isEmpty);
    });

    test('should return list of books', () async {
      //arrange
      var books = [Book()];
      when(mockBookRepository.findAll()).thenAnswer((_) async => books);
      //act
      final result = await usecase();
      //assert
      expect(result.books, isNotEmpty);
      verify(mockBookRepository.findAll());
    });
  });
}
