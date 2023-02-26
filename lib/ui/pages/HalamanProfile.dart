part of 'pages.dart';

class HalamanProfile extends StatefulWidget {
  String nama;
  String nik;
  String alamat;
  String namadaerah;
  String namapartai;

  HalamanProfile(
      {this.nama = '',
      this.nik = '',
      this.alamat = '',
      this.namadaerah = '',
      this.namapartai = ''});
  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  bool aktif = true;
  TextEditingController nikcontrol = TextEditingController();
  TextEditingController namacontrol = TextEditingController();
  TextEditingController alamatcontrol = TextEditingController();

  TextEditingController namadaerahcontrol = TextEditingController();

  TextEditingController namapartaicontrol = TextEditingController();

  @override
  initState() {
    nikcontrol.text = widget.nik;
    namacontrol.text = widget.nama;
    alamatcontrol.text = widget.alamat;
    namadaerahcontrol.text = widget.namadaerah;
    namapartaicontrol.text = widget.namapartai;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => BlocBuilder<DataprofileBloc, DataprofileState>(
        builder: (context, state) {
          return state is DataprofileLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      textAlign: TextAlign.start,
                      style: textpoppin.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.01,
                    ),
                    Center(
                      child: SizedBox(
                        width: p1.maxWidth * 0.3,
                        height: p1.maxHeight * 0.3,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://web-pilkada.taekwondosulsel.info/public/storage/${state.data!.foto}'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Lengkap",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.05,
                          decoration: BoxDecoration(
                              color: aktif ? hitam.withOpacity(0.2) : putih,
                              border: Border.all(width: 1.0, color: hitam),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: namacontrol,
                            readOnly: aktif,
                            onTap: () {},
                            maxLines: 1,
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 5)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Daerah",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.05,
                          decoration: BoxDecoration(
                              color: aktif ? hitam.withOpacity(0.2) : putih,
                              border: Border.all(width: 1.0, color: hitam),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: namadaerahcontrol,
                            readOnly: aktif,
                            onTap: () {},
                            maxLines: 1,
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 5)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NIK",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.05,
                          decoration: BoxDecoration(
                              color: aktif ? hitam.withOpacity(0.2) : putih,
                              border: Border.all(width: 1.0, color: hitam),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: nikcontrol,
                            readOnly: aktif,
                            onTap: () {},
                            maxLines: 1,
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 5)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alamat",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.05,
                          decoration: BoxDecoration(
                              color: aktif ? hitam.withOpacity(0.2) : putih,
                              border: Border.all(width: 1.0, color: hitam),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: alamatcontrol,
                            readOnly: aktif,
                            onTap: () {},
                            maxLines: 1,
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 5)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Partai",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.05,
                          decoration: BoxDecoration(
                              color: aktif ? hitam.withOpacity(0.2) : putih,
                              border: Border.all(width: 1.0, color: hitam),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            controller: namapartaicontrol,
                            readOnly: aktif,
                            onTap: () {},
                            maxLines: 1,
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.only(top: 5, left: 5)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxWidth * 0.39, top: p1.maxHeight * 0.03),
                      child: Row(
                        children: [
                          Container(
                            width: p1.maxWidth * 0.3,
                            height: p1.maxHeight * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: putih,
                                border:
                                    Border.all(color: colorbiru, width: 1.0)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Batal",
                                  style: textpoppin.copyWith(
                                      color: colorbiru,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          SizedBox(
                            width: p1.maxWidth * 0.01,
                          ),
                          Container(
                            width: p1.maxWidth * 0.3,
                            height: p1.maxHeight * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: hitam.withOpacity(0.2),
                                      offset: const Offset(3, 3))
                                ],
                                color: colorbiru,
                                border:
                                    Border.all(color: colorbiru, width: 1.0)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Simpan",
                                  style: textpoppin.copyWith(
                                      color: putih,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Text(
                  "Failed To Get Profile",
                  style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                );
        },
      ),
    );
  }
}
