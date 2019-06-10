import 'package:techone/models/SearchHistoryModel.dart';
import 'package:techone/models/SearchPreviewModel.dart';

class SearchProvider {
  List<SearchHistoryModel> loadHistory() {
    List<SearchHistoryModel> history = List<SearchHistoryModel>();

    history.add(SearchHistoryModel("Xiaomi Miband 3"));
    history.add(SearchHistoryModel("Bitit Hunter X"));
    history.add(SearchHistoryModel("Samsung Galaxy S10"));
    history.add(SearchHistoryModel("SKMEI 1155B"));
    history.add(SearchHistoryModel("SSD 240GB WD"));

    history.add(SearchHistoryModel("Xiaomi Miband 3"));
    history.add(SearchHistoryModel("Bitit Hunter X"));
    history.add(SearchHistoryModel("Samsung Galaxy S10"));
    history.add(SearchHistoryModel("SKMEI 1155B"));
    history.add(SearchHistoryModel("SSD 240GB WD"));

    history.add(SearchHistoryModel("Xiaomi Miband 3"));
    history.add(SearchHistoryModel("Bitit Hunter X"));
    history.add(SearchHistoryModel("Samsung Galaxy S10"));
    history.add(SearchHistoryModel("SKMEI 1155B"));
    history.add(SearchHistoryModel("SSD 240GB WD"));

    return history;
  }

  loadPreview(String keyword) {
    String _keyword = keyword.trim().toLowerCase();
    print('Keyword: ' + _keyword);
    List<SearchPreviewModel> data = List<SearchPreviewModel>();
    List<SearchPreviewModel> result = List<SearchPreviewModel>();

    data.add(
        SearchPreviewModel("Xiaomi Miband 3", "", ["xiaomi", "miband"], ""));
    data.add(
        SearchPreviewModel("Bitits Hunter X", "", ["bitits", "hunter x"], ""));
    data.add(SearchPreviewModel(
        "Samsung Galaxy S10", "", ["samsung", "s10", "galaxy"], ""));
    data.add(SearchPreviewModel("SKMEI 1155B", "", ["skmei", "watch"], ""));
    data.add(
        SearchPreviewModel("SSD 240GB WD", "", ["ssd", "wd", "120gb"], ""));

    data.add(
        SearchPreviewModel("Xiaomi Miband 2", "", ["xiaomi", "miband"], ""));
    data.add(
        SearchPreviewModel("Bitits Hunter", "", ["bitits", "hunter x"], ""));
    data.add(SearchPreviewModel(
        "Samsung Galaxy S8", "", ["samsung", "s8", "galaxy"], ""));
    data.add(SearchPreviewModel("Apple Watch S4", "", ["skmei", "watch"], ""));
    data.add(
        SearchPreviewModel("SSD 120GB WD", "", ["ssd", "wd", "120gb"], ""));

    data.add(
        SearchPreviewModel("LG G6", "", ["lg", "g6"], ""));
    data.add(
        SearchPreviewModel("Genius DX-120", "", ["genius", "DX120"], ""));
    data.add(SearchPreviewModel(
        "EOS Canon 700d + Kit 18-55mm f3.5-5.6 IS STM like new 97%", "", ["eos", "canon", "700d", "kit"], ""));
    data.add(SearchPreviewModel("Apple Watch S4", "", ["skmei", "watch"], ""));
    data.add(
        SearchPreviewModel("Balo Level 3 PUBG LAZA BL384", "", ["balo", "pupg"], ""));

    if (_keyword.contains(" ")) {
      for(int i=0; i<data.length; i++) {
        if(data[i].keyword.trim().toLowerCase().contains(_keyword)) {
          result.add(data[i]);
          print(data[i].keyword);
        } else {
          print('Not match');
        }
      }
    } else {
      for (int i = 0; i < data.length; i++) {
        for (int j = 0; j < data[i].tag.length; j++) {
          if (data[i].tag[j].trim().toLowerCase().contains(_keyword)) {
            result.add(data[i]);
            print(data[i].keyword);
            break;
          } else {
            print('Not match');
          }
        }
      }
    }

    return result;
  }
}
