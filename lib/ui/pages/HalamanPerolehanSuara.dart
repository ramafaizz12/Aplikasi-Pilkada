part of 'pages.dart';

class HalamanPerolehansuara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Perolehan Suara",
            textAlign: TextAlign.start,
            style: textpoppin.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No',
                style: textpoppin,
              ),
              Text(
                'Perolehan Suara',
                style: textpoppin,
              ),
              Text(
                'Ket',
                style: textpoppin,
              ),
            ],
          )
        ],
      ),
    );
  }
}
