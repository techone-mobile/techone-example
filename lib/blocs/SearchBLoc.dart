import 'package:rxdart/rxdart.dart';
import 'package:techone/business/repository/Repository.dart';
import 'package:techone/models/SearchHistoryModel.dart';
import 'package:techone/models/SearchPreviewModel.dart';

class SearchBloc {
  Repository _repository = Repository();
  final _searchHistoryStreamController = PublishSubject<List<SearchHistoryModel>>();
  final _searchPreviewStreamController = PublishSubject<List<SearchPreviewModel>>();


  Observable<List<SearchHistoryModel>> searchHistoryStream() {
    return _searchHistoryStreamController.stream;
  }
  Observable<List<SearchPreviewModel>> searchPreviewStream() {
    return _searchPreviewStreamController.stream;
  }


  loadHistory() async {
    List<SearchHistoryModel> history = await _repository.loadSearchHistory();
    _searchHistoryStreamController.sink.add(history);
  }

  loadPreview(String keyword) async {
    List<SearchPreviewModel> preview = await _repository.loadSearchPreview(keyword);
    _searchPreviewStreamController.sink.add(preview);
  }

  dispose() {
    _searchHistoryStreamController.close();
  }
}

final searchBloc = SearchBloc();