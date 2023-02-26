part of 'pages.dart';

class HalamanAksesoris extends StatelessWidget {
  String nama;
  String alamat;
  String ket;

  HalamanAksesoris(
      {this.nama = 'Nama 1', this.alamat = 'Makassar', this.ket = '-'});
  @override
  Widget build(BuildContext context) {
    context.read<DataaksesorisBloc>().add(DataaksesorisConnect());
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Penerimaan Aksesoris",
            textAlign: TextAlign.start,
            style: textpoppin.copyWith(
                fontSize: p1.maxHeight * 0.02, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.85,
            child: BlocBuilder<DataaksesorisBloc, DataaksesorisState>(
              builder: (context, state) {
                return state is Dataaksesorisloaded
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / .3),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Nama\nAlamat\nKeterangan',
                                      textAlign: TextAlign.center,
                                      style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${state.data![index].nama}\n${state.data![index].alamat}\n${state.data![index].keterangan}',
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
                      )
                    : Text(
                        'Cannot Loaded',
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
