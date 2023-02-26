part of 'pages.dart';

class HalamanTambahDatacaleg extends StatefulWidget {
  @override
  State<HalamanTambahDatacaleg> createState() => _HalamanTambahDatacalegState();
}

class _HalamanTambahDatacalegState extends State<HalamanTambahDatacaleg> {
  File? _file;

  Future pickfoto() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  _tambahdata() {
    context.read<DatakandidatBloc>().add(TambahDataKandidat(
        no_kandidat: nourut.text,
        nama_kandidat: namakandidatcontrol.text,
        nama_wakil: namawakilcontrol.text,
        visi_misi: visimisicontrol.text,
        program: programcontrol.text,
        foto: _file));
  }

  TextEditingController nourut = TextEditingController();

  TextEditingController namakandidatcontrol = TextEditingController();

  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController tempatlahircontrol = TextEditingController();
  TextEditingController tanggalahircontrol = TextEditingController();
  TextEditingController namawakilcontrol = TextEditingController();
  TextEditingController visimisicontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();
  TextEditingController gruprelawancontrol = TextEditingController();
  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController programcontrol = TextEditingController();
  TextEditingController nohpcontrol = TextEditingController();

  @override
  initState() {
    super.initState();

    tanggalahircontrol.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocBuilder<DatakandidatBloc, DatakandidatState>(
          builder: (context, state) {
            if (state is DatakandidatUpdate) {
              if (state.update == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Data Berhasil Disimpan',
                      onConfirmBtnTap: () {
                        Navigator.pop(context);
                      },
                      confirmBtnColor: colorbiru,
                      confirmBtnTextStyle: textpoppin.copyWith(color: putih));
                });
              }
              if (state.update == false) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: 'Data Gagal Disimpan',
                      confirmBtnColor: colorbiru,
                      confirmBtnTextStyle: textpoppin);
                });
              }
            }

            return SizedBox();
          },
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tambah Data Kandidat",
                textAlign: TextAlign.start,
                style: textpoppin.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor Urut',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: nourut,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan No.Urut',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Kandidat',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: namakandidatcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Kandidat',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Wakil',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: namawakilcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nama Wakil',
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visi Misi',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: visimisicontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Visi Dan Misi',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Program',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: programcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Program',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: p1.maxWidth * 0.4,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: colorbiru,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: hitam.withOpacity(0.2),
                              offset: const Offset(3, 3))
                        ]),
                    child: TextButton(
                        onPressed: () {
                          pickfoto();
                        },
                        child: Text(
                          "Upload Foto",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02,
                              color: putih,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.39, top: p1.maxHeight * 0.02),
                child: Row(
                  children: [
                    Container(
                      width: p1.maxWidth * 0.3,
                      height: p1.maxHeight * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: putih,
                          border: Border.all(color: colorbiru, width: 1.0)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Batal",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02,
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
                          border: Border.all(color: colorbiru, width: 1.0)),
                      child: TextButton(
                          onPressed: () {
                            _tambahdata();
                          },
                          child: Text(
                            "Simpan",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02,
                                color: putih,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
