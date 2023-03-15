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

  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];

  List<String> kota = [];
  List<String> itemtps = [];
  int page = 4 + 1;

  String? selectedprovinsi;
  String? selectedtps;
  String? selectedkecamatan;
  String? selectedkota;
  @override
  void initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    context.read<DatatpsBloc>().add(Datatpsconnect(page: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<String>(
              selectedItem: selectedtps,
              asyncItems: (String? filter) =>
                  auth.getprovinsilist(provinsi: selectedprovinsi.toString()),
              onChanged: (value) {
                setState(() {
                  selectedtps = value;
                  var baru = dataprovinsi
                      .firstWhere((e) => e!.name.toString() == selectedtps)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchProvinsi(provinsi: baru.toString()));
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
                  var baru = datakabupaten
                      .firstWhere((e) => e!.name.toString() == selectedkota)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchKabupaten(kabupaten: baru.toString()));
                });
              },
              asyncItems: (String? filter) =>
                  auth.getkabupatenlist(provinsi: selectedtps.toString()),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Kabupaten / Kota',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(
              height: p1.maxHeight * 0.02,
            ),
            DropdownSearch<String>(
              selectedItem: selectedkecamatan,
              onChanged: (value) {
                setState(() {
                  selectedkecamatan = value;
                  var baru = datakecamatan
                      .firstWhere(
                          (e) => e!.name.toString() == selectedkecamatan)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchKecamatan(kecamatan: baru.toString()));
                });
              },
              asyncItems: (String? filter) =>
                  auth.getkecamatanlist(provinsi: selectedkota.toString()),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Kecamatan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.55,
              child: BlocBuilder<DatatpsBloc, DatatpsState>(
                builder: (context, state) {
                  return state is DatatpsLoaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                  padding:
                                      EdgeInsets.only(top: p1.maxHeight * 0.02),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'TPS',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                            ),
                                            Text(
                                              'Provinsi',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                            ),
                                            Text(
                                              'Kabupaten/Kota',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                            ),
                                            Text(
                                              'Kecamatan',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                            ),
                                            Text(
                                              'Keterangan',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.fade,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                state.data![index].tps
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
                                                '${state.provinsi![index]}',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "${state.kabupaten![index]}",
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                '${state.kecamatan![index]}',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                state.data![index].ket
                                                    .toString()
                                                    .replaceAll(
                                                        RegExp("<p>|</p>|<br>"),
                                                        ""),
                                                textAlign: TextAlign.center,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                "Data Tidak Ditemukan",
                                style: textpoppin.copyWith(
                                    fontSize: p1.maxWidth * 0.04),
                              ),
                            )
                      : SpinKitDualRing(
                          color: colororange,
                        );
                },
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: p1.maxHeight * 0.02),
                width: p1.maxWidth * 0.7,
                height: p1.maxHeight * 0.06,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: hitam.withOpacity(0.2), offset: Offset(3, 3))
                ], color: colorbiru, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '1'));
                        },
                        child:
                            Text("1", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '2'));
                        },
                        child:
                            Text("2", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '3'));
                        },
                        child:
                            Text("3", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '4'));
                        },
                        child:
                            Text("4", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: page.toString()));
                        },
                        child:
                            Text(">", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
