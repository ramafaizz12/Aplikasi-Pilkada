part of 'widgets.dart';

class ContainerDatabaru extends StatelessWidget {
  final String nama;
  final String gambar;
  final double? width;
  final double? height;
  final VoidCallback fungsi;

  const ContainerDatabaru(
      {required this.height,
      required this.width,
      required this.gambar,
      required this.fungsi,
      required this.nama});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fungsi,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: abuabu, borderRadius: BorderRadius.circular(12)),
        child: LayoutBuilder(
          builder: (p0, p1) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                gambar,
                width: p1.maxWidth * 0.4,
                height: p1.maxHeight * 0.4,
              ),
              Text(
                nama,
                textAlign: TextAlign.center,
                style: textpoppin.copyWith(
                    color: hitam, fontSize: p1.maxHeight * 0.14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
