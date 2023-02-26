part of 'pages.dart';

class HalamanDataSaksitps extends StatefulWidget {
  String gambar;
  String namasaksi;
  String tps;

  HalamanDataSaksitps(
      {this.namasaksi = 'Saksi 1', this.tps = 'TPS 1', this.gambar = ''});

  @override
  State<HalamanDataSaksitps> createState() => _HalamanDataSaksitpsState();
}

class _HalamanDataSaksitpsState extends State<HalamanDataSaksitps> {
  List<String> founduser = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatasaksiBloc>().add(DatasaksiConnect());
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Saksi",
                textAlign: TextAlign.start,
                style: textpoppin.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                width: p1.maxWidth * 0.25,
                height: p1.maxHeight * 0.05,
                decoration: BoxDecoration(
                    color: colorbiru, borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanTemplateData(
                                    haldata: HalamanTambahSaksiNew(),
                                  )));
                    },
                    child: Text(
                      "Tambah",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.02,
                          color: putih,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: p1.maxWidth * 0.7,
                height: p1.maxHeight * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorbiru),
                    borderRadius: BorderRadius.circular(15),
                    color: putih),
                child: TextField(
                  style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              Container(
                width: p1.maxWidth * 0.25,
                height: p1.maxHeight * 0.05,
                decoration: BoxDecoration(
                    color: colorbiru, borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cari",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.02,
                          color: putih,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.85,
            child: BlocBuilder<DatasaksiBloc, DatasaksiState>(
              builder: (context, state) {
                return state is DataSaksiLoaded
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / .4),
                            crossAxisCount: 1,
                            mainAxisSpacing: p1.maxHeight * 0.02,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) =>
                            FutureBuilder<SemuaDaerah>(
                          future: auth.getprovkabupatenkecamatan(
                              kabupaten:
                                  state.data![index].regency_id.toString(),
                              kecamatan:
                                  state.data![index].district_id.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanTemplateData(
                                                  haldata: HalamanDetailSaksi(
                                                namasaksi: state
                                                    .data![index].nama_saksi
                                                    .toString(),
                                                alamat: state
                                                    .data![index].alamat
                                                    .toString(),
                                                email: state.data![index].email
                                                    .toString(),
                                                notelepon: state
                                                    .data![index].no_hp
                                                    .toString(),
                                                kabupaten:
                                                    snapshot.data!.kabupaten,
                                                kecamatan:
                                                    snapshot.data!.kecamatan,
                                                gambar: state.data![index].saksi
                                                    .toString(),
                                                tps: state.data![index].tps_id
                                                    .toString(),
                                              ))));
                                },
                                child: Container(
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.2,
                                  decoration: BoxDecoration(
                                      color: abuabu,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: p1.maxHeight * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 48,
                                          backgroundImage: NetworkImage(
                                              'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].saksi}'),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Nama\nTPS',
                                              textAlign: TextAlign.center,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${state.data![index].nama_saksi}\n${state.data![index].tps_id}',
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: textpoppin.copyWith(
                                                  fontSize: p1.maxHeight * 0.02,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return CircularProgressIndicator(
                              color: colororange,
                            );
                          },
                        ),
                      )
                    : Text(
                        "Data Not Connected",
                        style: textpoppin,
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
