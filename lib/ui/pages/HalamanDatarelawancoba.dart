part of 'pages.dart';

class HalamanDatarelawancoba extends StatefulWidget {
  String gambar;
  String namarelawan;
  String gruprelawan;

  HalamanDatarelawancoba(
      {this.namarelawan = 'Relawan 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanDatarelawancoba> createState() => _HalamanDatarelawancobaState();
}

class _HalamanDatarelawancobaState extends State<HalamanDatarelawancoba> {
  int page = 4 + 1;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatarelawanBloc>().add(DataRelawanConnect(page: '1'));
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Relawan",
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
                                    haldata: HalamanTambahDataRelawan(),
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
                  onChanged: (value) => context
                      .read<DatarelawanBloc>()
                      .add(DatarelawanSearch(value: value)),
                  style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  decoration: const InputDecoration(
                      hintText: 'Masukkan Nama Relawan',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 5, left: 5)),
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
              height: p1.maxHeight * 0.75,
              child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
                builder: (context, state) {
                  return state is DataRelawanLoaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (1 / .4),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: p1.maxHeight * 0.02,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HalamanTemplateData(
                                                    haldata: HalamanDetailRelawan(
                                                        gambar: state
                                                            .data![index].foto,
                                                        relawan: state
                                                            .data![index].nama
                                                            .toString(),
                                                        noktp: state.data![index].nik
                                                            .toString(),
                                                        notelepon: state
                                                            .data![index].no_hp
                                                            .toString(),
                                                        tempatlahir: state
                                                            .data![index]
                                                            .tempat_lahir
                                                            .toString(),
                                                        tanggallahir: state
                                                            .data![index]
                                                            .tanggal_lahir
                                                            .toString(),
                                                        agama: state
                                                            .data![index].agama
                                                            .toString(),
                                                        jeniskelamin:
                                                            state.data![index].jkl.toString(),
                                                        gruprelawan: state.gruprelawan![index].toString(),
                                                        kabupaten: state.datakabupaten![index].toString()),
                                                  )));
                                    },
                                    child: Container(
                                      width: p1.maxWidth,
                                      height: p1.maxHeight * 0.2,
                                      decoration: BoxDecoration(
                                          color: abuabu,
                                          borderRadius:
                                              BorderRadius.circular(12)),
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
                                                  'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}'),
                                            ),
                                            Text(
                                              'Nama Relawan\nGrup Relawan',
                                              textAlign: TextAlign.center,
                                              style: textpoppin.copyWith(
                                                  fontSize:
                                                      p1.maxHeight * 0.02),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Text(
                                                '${state.data![index].nama}\n${state.gruprelawan![index]}',
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                style: textpoppin.copyWith(
                                                    fontSize:
                                                        p1.maxHeight * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                          : Text("Data Tidak Ditemukan",
                              style: textpoppin.copyWith(
                                  fontSize: p1.maxHeight * 0.02))
                      : SpinKitDualRing(
                          color: colororange,
                        );
                },
              )),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: p1.maxHeight * 0.02),
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.06,
              decoration: BoxDecoration(
                  color: putihh, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '1'));
                      },
                      child: Text("1"),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '2'));
                      },
                      child: Text("2"),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '3'));
                      },
                      child: Text("3"),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '4'));
                      },
                      child: Text("4"),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: page.toString()));
                      },
                      child: Text(">"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
