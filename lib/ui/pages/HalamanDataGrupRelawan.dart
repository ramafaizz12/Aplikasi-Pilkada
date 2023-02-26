part of 'pages.dart';

class HalamanDataGruprelawan extends StatelessWidget {
  String namagruprelawan;
  String alamat;
  String email;

  HalamanDataGruprelawan(
      {this.namagruprelawan = 'Group 1',
      this.alamat = 'Makassar',
      this.email = 'email23@gmail.com'});
  @override
  Widget build(BuildContext context) {
    context.read<DatarelawanBloc>().add(GrupRelawanConnect());
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Grup Relawan",
            textAlign: TextAlign.start,
            style: textpoppin.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.85,
            child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
              builder: (context, state) {
                return state is DataGruprelawanLoaded
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / .4),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Nama Grup Relawan\nAlamat\nEmail',
                                      textAlign: TextAlign.center,
                                      style: textpoppin.copyWith(
                                          fontSize: p1.maxHeight * 0.02),
                                    )
                                  ],
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${state.data![index].nama_grup}\n${state.data![index].alamat_posko}\n${state.data![index].email}',
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.start,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(
                        'Cannot Loaded',
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
