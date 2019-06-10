import 'package:rxdart/rxdart.dart';
import 'package:techone/business/repository/Repository.dart';
import 'package:techone/models/NotificationModel.dart';

class NotificationBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<NotificationModel>>();

  Observable<List<NotificationModel>> stream() {
    return _streamController.stream;
  }

  load() async {
    List<NotificationModel> notification = await _repository.loadNotification();
    _streamController.sink.add(notification);
  }

  dispose() {
    _streamController.close();
  }
}

final notificationBloc = NotificationBloc();
