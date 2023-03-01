part of 'pages.dart';

class HalamanDataTps extends StatefulWidget {
  String tps;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String keterangan;

  HalamanDataTps(
      {this.tps = '001',
      this.provinsi = 'Sulawesi Selatan',
      this.kabupaten = 'Makassar',
      this.kecamatan = 'Tamalanrea',
      this.keterangan = '-'});

  @override
  State<HalamanDataTps> createState() => _HalamanDataTpsState();
}

class _HalamanDataTpsState extends State<HalamanDataTps> {
  Authentication auth = Authentication();
  List<Datatps> _allUsers = [];
  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<Datatps> _foundUsers = [];
  List<String> kota = [];
  List<String> itemtps = [];
  List<String> itemprovinsi = [
    'SULAWESI SELATAN',
    'ACEH',
    'SUMATERA UTARA',
    'SUMATERA BARAT',
    'RIAU'
  ];
  List<String> itemkabupaten = [
    'KOTA MAKASSAR',
    'KABUPATEN BULUKUMBA',
    'KABUPATEN SOPPENG',
    'KABUPATEN NIAS',
    'KABUPATEN LANGKAT'
  ];
  String? selectedprovinsi;
  String? selectedtps;
  String? selectedkota;
  @override
  void initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    // var dataprov = dataprovinsi.map((e) => e!.name.toString()).toList();
    // itemprovinsi = dataprov;
    var data = context.read<DatatpsBloc>().state;
    if (data is DatatpsLoaded) {
      _allUsers = data.data!;
      _foundUsers = _allUsers;
    }
    super.initState();
  }

  void _runFilterprovinsi(String enteredKeyword) {
    List<Datatps> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user.Province_id!.contains(enteredKeyword))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  void _runFilterkabupaten(String enteredKeyword) {
    List<Datatps> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user.regency_id!.contains(enteredKeyword))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatatpsBloc>().add(Datatpsconnect());
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Data TPS',
            //       textAlign: TextAlign.start,
            //       style: textpoppin.copyWith(fontWeight: FontWeight.w600),
            //     ),
            //     // Container(
            //     //   width: p1.maxWidth * 0.25,
            //     //   height: p1.maxHeight * 0.05,
            //     //   decoration: BoxDecoration(
            //     //       color: colorbiru, borderRadius: BorderRadius.circular(12)),
            //     //   child: TextButton(
            //     //       onPressed: () {
            //     //         Navigator.push(
            //     //             context,
            //     //             MaterialPageRoute(
            //     //                 builder: (context) => HalamanTemplateData(
            //     //                       haldata: HalamanTambahDataTps(),
            //     //                     )));
            //     //       },
            //     //       child: Text(
            //     //         "Tambah",
            //     //         style: textpoppin.copyWith(
            //     //             fontSize: p1.maxHeight * 0.02,
            //     //             color: putih,
            //     //             fontWeight: FontWeight.w600),
            //     //       )),
            //     // )
            //   ],
            // ),

            DropdownSearch<String>(
              selectedItem: selectedtps,
              items: itemprovinsi,
              onChanged: (value) {
                setState(() {
                  selectedtps = value;
                  var baru = dataprovinsi
                      .firstWhere((e) => e!.name.toString() == selectedtps)!
                      .id
                      .toString();
                  _runFilterprovinsi(baru.toString());
                });
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Provinsi',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(
              height: p1.maxHeight * 0.02,
            ),
            DropdownSearch<String>(
              selectedItem: selectedkota,
              onChanged: (value) {
                setState(() {
                  selectedkota = value;
                  _runFilterkabupaten(selectedkota.toString());
                });
              },
              items: itemkabupaten,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Kabupaten / Kota',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),

            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.85,
                child: _foundUsers.isNotEmpty
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _foundUsers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / .5),
                            crossAxisCount: 1,
                            mainAxisSpacing: p1.maxHeight * 0.02,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) => Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.2,
                          decoration: BoxDecoration(
                              color: abuabu,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.only(top: p1.maxHeight * 0.02),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'TPS',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                      Text(
                                        'Provinsi',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                      Text(
                                        'Kabupaten/Kota',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                      Text(
                                        'Kecamatan',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                      Text(
                                        'Keterangan',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<SemuaDaerah>(
                                    future: auth.getprovkabupatenkecamatan(
                                        provinsi: _foundUsers[index]
                                            .Province_id
                                            .toString(),
                                        kecamatan: _foundUsers[index]
                                            .district_id
                                            .toString(),
                                        kabupaten: _foundUsers[index]
                                            .regency_id
                                            .toString()),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                _foundUsers[index]
                                                    .tps
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                '${snapshot.data!.provinsi}',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "${snapshot.data!.kabupaten}",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                '${_foundUsers[index].district_id.toString()}',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                _foundUsers[index]
                                                    .ket
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return CircularProgressIndicator(
                                        color: colororange,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "No Result Found",
                          style: textpoppin,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
