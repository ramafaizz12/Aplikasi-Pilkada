part of 'pages.dart';

class HalamanJumlahdpt extends StatefulWidget {
  @override
  State<HalamanJumlahdpt> createState() => _HalamanJumlahdptState();
}

class _HalamanJumlahdptState extends State<HalamanJumlahdpt> {
  List<Datadpt> _allUsers = [];

  List<Datadpt> _foundUsers = [];

  @override
  initState() {
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Datadpt> results = [];
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

  @override
  Widget build(BuildContext context) {
    context.read<DatadptBloc>().add(Datadptconnect());
    var data = context.read<DatadptBloc>().state;
    if (data is DatadptLoaded) {
      _allUsers = data.data!;
      _foundUsers = _allUsers;
    }

    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Cari DPT",
            textAlign: TextAlign.start,
            style: textpoppin.copyWith(fontWeight: FontWeight.w600),
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
                      hintText: 'Masukkan Nama DPT',
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
                      itemBuilder: (context, index) =>
                          FutureBuilder<SemuaDaerah>(
                        future: auth.getprovkabupatenkecamatan(
                            kabupaten:
                                _foundUsers[index].regency_id.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              width: p1.maxWidth,
                              height: p1.maxHeight * 0.2,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: abuabu,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${_foundUsers[index].foto}'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Nama DPT\nKabupaten/Kota",
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "${_foundUsers[index].nama}\n${snapshot.data!.kabupaten}",
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
                            );
                          }
                          return SpinKitDualRing(
                            color: colororange,
                          );
                        },
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
