import 'package:rxdart/rxdart.dart';
import 'package:techone/business/repository/Repository.dart';
import 'package:techone/models/SuggestionsProductModel.dart';

class SuggestionsProductBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<SuggestionsProductModel>>();

  Observable<List<SuggestionsProductModel>> stream() {
    return _streamController.stream;
  }

  getAllSuggestionsProduct() async {
    List<SuggestionsProductModel> suggestionsProduct = await _repository.getAllSuggestionsProduct();
    _streamController.sink.add(suggestionsProduct);
  }

  dispose() {
    _streamController.close();
  }
}

final suggestionsProductBloc = SuggestionsProductBloc();