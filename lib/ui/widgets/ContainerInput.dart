part of 'widgets.dart';

class ContainerInput extends StatefulWidget {
  String nama;
  TextEditingController? control;
  Function(String)? fungsi;
  double width;
  double height;
  double lebarfont;
  TextInputType? tipekeyboard;
  Color warnaborder;
  VoidCallback? ontapfield;
  bool readonly;

  ContainerInput(
      {required this.nama,
      required this.control,
      required this.width,
      required this.height,
      required this.lebarfont,
      this.ontapfield,
      this.readonly = false,
      this.fungsi,
      this.tipekeyboard,
      this.warnaborder = hitam});

  @override
  State<ContainerInput> createState() => _ContainerInputState();
}

class _ContainerInputState extends State<ContainerInput> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.nama,
          style: textpoppin.copyWith(fontSize: widget.lebarfont),
        ),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: putih,
              border: Border.all(width: 1.0, color: widget.warnaborder),
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            readOnly: widget.readonly,
            onTap: widget.ontapfield,
            maxLines: 1,
            keyboardType: widget.tipekeyboard,
            style: textpoppin.copyWith(fontSize: widget.lebarfont),
            decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.only(top: 5, left: 5)),
            onChanged: widget.fungsi,
          ),
        )
      ],
    );
  }
}
