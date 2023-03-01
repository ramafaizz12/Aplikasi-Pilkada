import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pilkada/models/Desa.dart';
import 'package:pilkada/models/Kabupaten.dart';
import 'package:pilkada/models/Kecamatan.dart';
import 'package:pilkada/models/Tps.dart';
import 'package:pilkada/models/dashboard.dart';
import 'package:pilkada/models/dataKordinator.dart';
import 'package:pilkada/models/datadaerah.dart';
import 'package:pilkada/models/datagruprelawan.dart';
import 'package:pilkada/models/datakandidat.dart';
import 'package:pilkada/models/dataprofile.dart';
import 'package:pilkada/models/datarelawan.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pilkada/models/saksitps.dart';
import '../models/Datadpt.dart';
import '../models/Provinsi.dart';
import '../models/dataaksesoris.dart';

class Authentication {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> gettoken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<List<DataKabupaten>?> getdatakabupaten() async {
    var user = await http.get(
      Uri.parse(
          'https://web-sisfopilkada.taekwondosulsel.info/api/index/kabupaten'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    //print(map1.update(1101, (value) => 'Kabuoaten konkon'));
    //print(map1);
    //var item = data.firstWhere((e) => e['id'] == 1101);

    List<DataKabupaten> alluser =
        data.map((e) => DataKabupaten.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataProvinsi>?> getdataprovinsi() async {
    var user = await http.get(
      Uri.parse(
          'https://web-sisfopilkada.taekwondosulsel.info/api/index/provinsi'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    //print(map1.update(1101, (value) => 'Kabuoaten konkon'));
    //print(map1);
    //var item = data.firstWhere((e) => e['id'] == 1101);

    List<DataProvinsi> alluser =
        data.map((e) => DataProvinsi.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKecamatan>?> getdatakecamatan() async {
    var user = await http.get(
      Uri.parse(
          'https://web-sisfopilkada.taekwondosulsel.info/api/index/kecamatan'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    List<DataKecamatan> alluser =
        data.map((e) => DataKecamatan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataDesa>?> getdatadesa() async {
    var user = await http.get(
      Uri.parse('https://web-sisfopilkada.taekwondosulsel.info/api/index/desa'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    List<DataDesa> alluser = data.map((e) => DataDesa.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawan>?> getdatarelawan() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/relawan'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    //var map1 = Map.fromIterable(data,
    //key: (e) => e['regency_id'], value: (e) => e['rw']);
    // map1.update('7371', (value) => 'Kabuoaten konkon');
    // var list = map1 as Iterable;
    // print(list);
    List<DataRelawan> alluser =
        data.map((e) => DataRelawan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datatps>?> getdatatps() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/tps'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Datatps> alluser = data.map((e) => Datatps.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataGruprelawan>?> getdatagruprelawan() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/gruprelawan'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataGruprelawan> alluser =
        data.map((e) => DataGruprelawan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataSaksi>?> getdatasaksi() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/saksi'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataSaksi> alluser = data.map((e) => DataSaksi.fromJson(e)).toList();

    return alluser;
  }

  Future<bool> createkoordinator({
    String? nama_lengkap,
    String? nik,
    String? tempat_lahir,
    String? tanggal_lahir,
    String? jkl,
    String? agama,
    String? no_hp,
    File? foto,
    File? scan_ktp,
    String? Province_id,
    String? regency_id,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://web-sisfopilkada.taekwondosulsel.info/api/store/kordinator';

    var formdata = FormData.fromMap({
      'nama_lengkap': nama_lengkap,
      'nik': nik,
      'tempat_lahir': tempat_lahir,
      'tanggal_lahir': tanggal_lahir,
      'jkl': jkl,
      'agama': agama,
      'no_hp': no_hp,
      'scan_ktp': scan_ktp,
      'foto': foto,
      'Province_id': Province_id,
      'regency_id': regency_id,
    });
    var filefoto = await MultipartFile.fromFile(foto!.path.toString(),
        filename: (foto.path),
        contentType: MediaType('image', (foto.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));
    formdata.files.add(MapEntry('foto', filefoto));
    formdata.files.add(MapEntry('foto', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createsaksi({
    String? nama_saksi,
    String? nik,
    String? alamat,
    String? no_hp,
    String? email,
    File? saksi,
    String? Province_id,
    String? regency_id,
    String? district_id,
    String? tps_id,
    String? role,
    String? password,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://web-sisfopilkada.taekwondosulsel.info/api/store/saksi';

    var formdata = FormData.fromMap({
      'nama_saksi': nama_saksi,
      'nik': nik,
      'alamat': alamat,
      'no_hp': no_hp,
      'email': email,
      'saksi': saksi,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'tps_id': tps_id,
      'role': role,
      'password': password
    });
    var filefoto = await MultipartFile.fromFile(saksi!.path.toString(),
        filename: (saksi.path),
        contentType: MediaType('image', (saksi.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createkandidat({
    String? no_kandidat,
    String? nama_kandidat,
    String? nama_wakil,
    String? visi_misi,
    String? program,
    File? foto,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://web-sisfopilkada.taekwondosulsel.info/api/store/kandidat';

    var formdata = FormData.fromMap({
      'no_kandidat': no_kandidat,
      'nama_kandidat': nama_kandidat,
      'nama_wakil': nama_wakil,
      'visi_misi': visi_misi,
      'program': program,
      'foto': foto
    });
    var filefoto = await MultipartFile.fromFile(foto!.path.toString(),
        filename: (foto.path),
        contentType: MediaType('image', (foto.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> createrelawan(
      {String? nama,
      String? nik,
      String? tempat_lahir,
      String? tanggal_lahir,
      String? jkl,
      String? agama,
      String? no_hp,
      File? scan_ktp,
      File? foto,
      String? Province_id,
      String? regency_id,
      String? gruprelawan_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://web-sisfopilkada.taekwondosulsel.info/api/store/relawan';

    var formdata = FormData.fromMap({
      'nama': nama,
      'nik': nik,
      'tempat_lahir': tempat_lahir,
      'tanggal_lahir': tanggal_lahir,
      'jkl': jkl,
      'scan_ktp': scan_ktp,
      'agama': agama,
      'no_hp': no_hp,
      'foto': foto,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'gruprelawan_id': gruprelawan_id
    });
    var filefoto = await MultipartFile.fromFile(foto!.path.toString(),
        filename: (foto.path),
        contentType: MediaType('image', (foto.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));
    formdata.files.add(MapEntry('scan_ktp', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    dio.options.validateStatus = (status) {
      print(status);
      return true;
    };

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> posttps(
      {String? province_id,
      String? regency_id,
      String? district_id,
      String? tps,
      String? ket}) async {
    var token = await gettoken();
    var postdata = await http.post(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/store/tps'),
        headers: {
          'Authorization': token.toString()
        },
        body: {
          'Province_id': province_id,
          'regency_id': regency_id,
          'district_id': district_id,
          'tps': tps,
          'ket': ket
        });
    if (postdata.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DataKordinator>?> getdatakordinator() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/kordinator'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataKordinator> alluser =
        data.map((e) => DataKordinator.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datadpt>?> getdatadpt() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/dpt'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Datadpt> alluser = data.map((e) => Datadpt.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKandidat>?> getdatakandidat() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/kandidat'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataKandidat> alluser =
        data.map((e) => DataKandidat.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Dataaksesoris>?> getdataaksesoris() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/index/aksesoris'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Dataaksesoris> alluser =
        data.map((e) => Dataaksesoris.fromJson(e)).toList();

    return alluser;
  }

  Future<SemuaDaerah> getprovkabupatenkecamatan(
      {String provinsi = '11',
      String gruprelawan = '1',
      String kabupaten = '1101',
      String kecamatan = '1101010'}) async {
    var dataprovinsi = await getdataprovinsi();
    var datagruprelawan = await getdatagruprelawan();
    var datakabupaten = await getdatakabupaten();
    var datakecamatan = await getdatakecamatan();
    var kabupatenbaru = datakabupaten!
        .firstWhere((e) => e.id.toString() == kabupaten)
        .name
        .toString();

    var provinsibaru = dataprovinsi!
        .firstWhere((e) => e.id.toString() == provinsi)
        .name
        .toString();
    var gruprelawang = datagruprelawan!
        .firstWhere((e) => e.id.toString() == gruprelawan)
        .nama_grup
        .toString();
    var kecamatanbaru = datakecamatan!
        .firstWhere((e) => e.id.toString() == kecamatan)
        .name
        .toString();

    return SemuaDaerah(
        gruprelawan: gruprelawang,
        provinsi: provinsibaru,
        kecamatan: kecamatanbaru,
        kabupaten: kabupatenbaru);
  }

  Future loginapi(String? email, String? password) async {
    var loginurl = await http.post(
        Uri.parse('https://web-sisfopilkada.taekwondosulsel.info/api/login'),
        body: {'email': email, 'password': password});

    var data = jsonDecode(loginurl.body)['data']['token'];

    return data;
  }

  Future<DataProfile> getdataprofile() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/auth/user'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = DataProfile.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardadmin() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/dashboard/utama'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardcalek() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/dashboard/calek'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardkordinator() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/dashboard/kordinator'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardrelawan() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/dashboard/relawan'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardsaksi() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://web-sisfopilkada.taekwondosulsel.info/api/dashboard/saksi'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<List<String>> getnamagruprelawan() async {
    var data = await getdatagruprelawan();
    var databaru = data!.map((e) => e.nama_grup.toString()).toList();
    print(databaru[0]);
    return databaru;
  }
}
