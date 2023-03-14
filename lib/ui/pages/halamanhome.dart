part of 'pages.dart';

class HalamanHome extends StatelessWidget {
  dynamic haldata;
  dynamic dashboard;

  //int date = DateTime.fromMillisecondsSinceEpoch(value * 1000);

  HalamanHome({this.haldata, this.dashboard});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        children: [
          Container(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: hitam.withOpacity(0.2), offset: const Offset(3, 3))
                ],
                gradient: colorcontainer,
                borderRadius: BorderRadius.circular(15)),
            child: BlocBuilder<DataprofileBloc, DataprofileState>(
              builder: (context, state) {
                return state is DataprofileLoaded
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: p1.maxWidth * 0.3,
                            height: p1.maxHeight * 0.3,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://web-pilkada.taekwondosulsel.info/public/storage/${state.data!.foto}'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data!.name.toString(),
                                style: textpoppin.copyWith(
                                    fontSize: p1.maxHeight * 0.02,
                                    color: putih,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                state.data!.role.toString(),
                                style: textpoppin.copyWith(
                                    fontSize: p1.maxHeight * 0.02,
                                    color: putih,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: p1.maxWidth * 0.1,
                              height: p1.maxHeight * 0.1,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  heroTag: 1,
                                  backgroundColor: colororange,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanTemplateData(
                                            haldata: HalamanProfile(
                                              nama: state.data!.name.toString(),
                                              namadaerah:
                                                  state.data!.asal.toString(),
                                              nik: state.data!.nik.toString(),
                                              alamat:
                                                  state.data!.alamat.toString(),
                                              namapartai:
                                                  state.data!.role.toString(),
                                            ),
                                          ),
                                        ));
                                  },
                                  child: const Icon(Icons.settings),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : const Text("Cannot Loaded");
              },
            ),
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.3,
            //kasih kondisi sini
            child: haldata,
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.45,
              child: dashboard),
        ],
      ),
    );
  }
}
