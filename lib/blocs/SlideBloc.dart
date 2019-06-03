import 'package:techone/business/repository/Repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:techone/models/SlideModel.dart';

class SlideBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<SlideModel>>();

  Observable<List<SlideModel>> stream() {
    return _streamController.stream;
  }

  load() async {
    List<SlideModel> slides = await _repository.loadSlide();
    _streamController.sink.add(slides);
  }

  dispose(){
    _streamController.close();
  }
}

final slideBloc = SlideBloc();