import 'package:bookdddflutter/application/usecases/create_shelf_usecase.dart';
import 'package:bookdddflutter/application/usecases/get_all_usecase.dart';
import 'package:bookdddflutter/infrastructure/factories/entity_factory.dart';
import 'package:bookdddflutter/infrastructure/repositories/fakes/fake_book_repository.dart';
import 'package:bookdddflutter/infrastructure/repositories/fakes/fake_shelf_repository.dart';
import 'package:bookdddflutter/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HomeViewModel sut;
  CreateShelfUseCase createShelfUseCase;
  GetAllUseCase getAllBooksUseCase;
  FakeBookRepository fakeBookRepository;
  FakeShelfRepository fakeShelfRepository;
  EntityFactory entityFactory;

  setUp(() {
    entityFactory = EntityFactory();
    fakeBookRepository = FakeBookRepository();
    fakeShelfRepository = FakeShelfRepository();

    getAllBooksUseCase = GetAllUseCase(bookRepository: fakeBookRepository);
    createShelfUseCase = CreateShelfUseCase(
        entityFactory: entityFactory, shelfRepository: fakeShelfRepository);
    sut = HomeViewModel(
      createShelfUseCase: createShelfUseCase,
      getAllUseCase: getAllBooksUseCase,
    );
  });

  group('HomePageViewModel.getBooksOnShelves', () {
    test('should create an empty shelf when no books in storage', () async {
      //arrange
      fakeBookRepository.books = [];
      //act
//      await sut.getBooksOnShelvs();
      //assert
//      expect(sut.shelvs.length, 1);
    });
  });
}
