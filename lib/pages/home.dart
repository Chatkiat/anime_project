import 'package:anime_project/pages/anime_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text(_subPageIndex == 0 ? 'Anime' : 'Profile', style: GoogleFonts.fredokaOne(),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/images/profile.png'),
                        )),
                  ),
                  Text(
                    'Chatkiat Sriphuttha',
                    style: GoogleFonts.righteous(fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    'nimbus@gmail.com',
                    style: GoogleFonts.righteous(fontSize: 12.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.aspect_ratio_rounded), 'Anime2021'),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'Profile'),
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),
      body: _buildSubPage(),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return AnimePage();

      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title,
          style: GoogleFonts.fredokaOne(fontSize: 15.0,color: Colors.blueGrey),),
      ],
    );
  }


}