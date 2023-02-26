part of 'pages.dart';

class HalamanKoordinator extends StatelessWidget {
  String gambar;
  String nama;
  String gruprelawan;

  HalamanKoordinator(
      {this.nama = 'Koordinator 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});
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
            height: p1.maxHeight * 0.02,
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
                        itemBuilder: (context, index) =>
                            FutureBuilder<SemuaDaerah>(
                          future: auth.getprovkabupatenkecamatan(
                              provinsi:
                                  state.data![index].Province_id.toString(),
                              kabupaten:
                                  state.data![index].regency_id.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanTemplateData(
                                                haldata:
                                                    HalamanDetailKoordinator(
                                                  koordinator: state
                                                      .data![index].nama_lengkap
                                                      .toString(),
                                                  noktp: state.data![index].nik
                                                      .toString(),
                                                  notelepon: state
                                                      .data![index].no_hp
                                                      .toString(),
                                                  agama: state
                                                      .data![index].agama
                                                      .toString(),
                                                  gruprelawan: state
                                                      .data![index].id
                                                      .toString(),
                                                  provinsi:
                                                      snapshot.data!.provinsi,
                                                  kabupaten:
                                                      snapshot.data!.kabupaten,
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
                                    padding: EdgeInsets.only(
                                        top: p1.maxHeight * 0.02),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${state.data![index].nama_lengkap}\n${state.data![index].id}',
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
                              );
                            }
                            return CircularProgressIndicator(
                              color: colororange,
                            );
                          },
                        ),
                      )
                    : Text(
                        "Cannot Loaded",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
