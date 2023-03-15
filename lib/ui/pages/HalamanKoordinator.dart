part of 'pages.dart';

class HalamanKoordinator extends StatefulWidget {
  String gambar;
  String nama;
  String gruprelawan;

  HalamanKoordinator(
      {this.nama = 'Koordinator 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanKoordinator> createState() => _HalamanKoordinatorState();
}

class _HalamanKoordinatorState extends State<HalamanKoordinator> {
  int page = 4 + 1;
  @override
  Widget build(BuildContext context) {
    context.read<DatakoordinatorBloc>().add(DataKoordinatorConnect());
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Koordinator",
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
                                    haldata: HalamanTambahDataKoordinator(),
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
            width: p1.maxWidth,
            height: p1.maxHeight * 0.85,
            child: BlocBuilder<DatakoordinatorBloc, DatakoordinatorState>(
              builder: (context, state) {
                return state is DataKoordinatorLoaded
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / .4),
                            crossAxisCount: 1,
                            mainAxisSpacing: p1.maxHeight * 0.02,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HalamanTemplateData(
                                          haldata: HalamanDetailKoordinator(
                                            koordinator: state
                                                .data![index].nama_lengkap
                                                .toString(),
                                            noktp: state.data![index].nik
                                                .toString(),
                                            notelepon: state.data![index].no_hp
                                                .toString(),
                                            agama: state.data![index].agama
                                                .toString(),
                                            provinsi: state.provinsi![index],
                                            kabupaten: state.kabupaten![index],
                                            foto: state.data![index].foto
                                                .toString(),
                                          ),
                                        )));
                          },
                          child: Container(
                            width: p1.maxWidth,
                            height: p1.maxHeight * 0.2,
                            decoration: BoxDecoration(
                                color: abuabu,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: p1.maxHeight * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 48,
                                    backgroundImage: NetworkImage(
                                        'https://web-pilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}'),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nama\nGrup Relawan',
                                        textAlign: TextAlign.center,
                                        style: textpoppin.copyWith(
                                          fontSize: p1.maxHeight * 0.02,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${state.data![index].nama_lengkap}',
                                        textAlign: TextAlign.start,
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnect(page: '1'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnect(page: '2'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnect(page: '3'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnect(page: '4'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnect(page: page.toString()));
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
    );
  }
}
