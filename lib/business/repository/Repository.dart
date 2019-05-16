import 'package:techone/business/provider/SlideProvider.dart';
import 'package:techone/models/SlideModel.dart';

class Repository {
  SlideProvider _slideProvider = SlideProvider();

  List<SlideModel> getAllSlide() {
    return _slideProvider.getList();
  }
}