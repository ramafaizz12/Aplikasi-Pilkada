part of 'pages.dart';

class HalamanAksesoris extends StatefulWidget {
  String nama;
  String alamat;
  String ket;

  HalamanAksesoris(
      {this.nama = 'Nama 1', this.alamat = 'Makassar', this.ket = '-'});

  @override
  State<HalamanAksesoris> createState() => _HalamanAksesorisState();
}

class _HalamanAksesorisState extends State<HalamanAksesoris> {
  List<Dataaksesoris> _allUsers = [];

  List<Dataaksesoris> _foundUsers = [];
  @override
  initState() {
    var data = context.read<DataaksesorisBloc>().state;
    if (data is Dataaksesorisloaded) {
      _allUsers = data.data!;
      _foundUsers = _allUsers;
    }
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Dataaksesoris> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user.nama!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

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
                  onChanged: (value) => _runFilter(value),
                  style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  decoration: const InputDecoration(
                      hintText: 'Masukkan Nama Penerima',
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
              width: p1.maxWidth,
              height: p1.maxHeight * 0.85,
              child: _foundUsers.isNotEmpty
                  ? GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _foundUsers.length,
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
                                    '${_foundUsers[index].nama}\n${_foundUsers[index].alamat}\n${_foundUsers[index].keterangan}',
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
                  : SpinKitDualRing(
                      color: colororange,
                    ))
        ],
      ),
    );
  }
}
