import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart';
import '../review.dart';

class Detail extends StatefulWidget {

  static const routeName = '/detail';

  @override
  _DetailState createState() => _DetailState();
}


class _DetailState extends State<Detail> {

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as Anime;

    void goVideo(Anime item) {
      Navigator.pushNamed(
        context,
        "/video",
        arguments: item,
      );
    }


    final appBar = AppBar(
      backgroundColor: Colors.black,
      elevation: .5,
      title: Text(
        'ANIME',
        style: GoogleFonts.ubuntu(),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag:item.title,
            child: Material(
              elevation: 20.0,
              shadowColor: Colors.black,
              child: Image(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          '${item.pages} ตอน',
          style: GoogleFonts.mitr(color: Colors.white, fontSize: 12),
        )
      ],
    );

    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(item.title,
              style: GoogleFonts.ubuntu(
                  fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: <Widget>[RatingBar(rating: item.rating)],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () {
              goVideo(item);
            },
            minWidth: 100.0,
            color: Colors.blue,
            child: text('ดูเลยจ้ะ', color: Colors.white, size: 15),
          ),
        )
      ],
    );

    final topContent = Container(
      color: Colors.grey.shade700,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    final bottomContent = Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          item.description,
          style: GoogleFonts.prompt(fontSize: 15.0, height: 1.5),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  text(String data,
      {Color color = Colors.black87,
        num size = 14,
        EdgeInsetsGeometry padding = EdgeInsets.zero,
        bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}
