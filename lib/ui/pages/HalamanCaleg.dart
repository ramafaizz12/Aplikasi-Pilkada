part of 'pages.dart';

class HalamanCaleg extends StatefulWidget {
  @override
  State<HalamanCaleg> createState() => _HalamanCalegState();
}

class _HalamanCalegState extends State<HalamanCaleg> {
  List<DataKandidat> _allUsers = [];

  List<DataKandidat> _foundUsers = [];
  @override
  initState() {
    var data = context.read<DatakandidatBloc>().state;
    if (data is DataKandidatLoaded) {
      _allUsers = data.data!;
      _foundUsers = _allUsers;
    }

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<DataKandidat> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user.nama_kandidat!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatakandidatBloc>().add(DataKandidatConnect());

    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Jumlah Caleg",
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
                                    haldata: HalamanTambahDatacaleg(),
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
                      hintText: 'Masukkan Nama Kandidat',
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
              height: p1.maxHeight * 0.7,
              child: _foundUsers.isNotEmpty
                  ? GridView.builder(
                      itemCount: _foundUsers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / .9),
                          crossAxisCount: 1,
                          mainAxisSpacing: p1.maxHeight * 0.02,
                          crossAxisSpacing: 5),
                      itemBuilder: (context, index) => Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.2,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: abuabu,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              width: p1.maxWidth * 0.94,
                              height: p1.maxHeight * 0.2,
                              child: Image.network(
                                'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${_foundUsers[index].foto}',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            // CircleAvatar(
                            //   radius: 50,
                            //   backgroundImage: NetworkImage(
                            //       'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${_foundUsers[index].foto}'),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No.Kandidat\nNama Kandidat\nNama Wakil\nVisi Misi\nProgram",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    "${_foundUsers[index].no_kandidat}\n${_foundUsers[index].nama_kandidat}\n${_foundUsers[index].nama_wakil}\n${_foundUsers[index].visi_misi}\n${_foundUsers[index].program}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
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
    );
  }
}
