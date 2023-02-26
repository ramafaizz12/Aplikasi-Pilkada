part of 'extensions.dart';

Authentication auth = Authentication();

extension Stringkenamadaerah on String {
  String stringkekabupaten() {
    List<DataKabupaten>? kabupaten = [];
    auth.getdatakabupaten().then((value) => value = kabupaten);

    // auth.getdatakabupaten().then((value) => kabupaten = value);
    var item = kabupaten.firstWhereOrNull((e) => e.id.toString() == this)!.name;
    print(item);
    return item.toString();
  }
}
