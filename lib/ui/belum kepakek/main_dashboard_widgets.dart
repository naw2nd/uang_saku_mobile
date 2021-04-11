import 'package:flutter/material.dart';
import 'package:uang_saku/ui/bottom_navbar.dart';

import 'filter_dialog.dart';

class DashboardWidgets extends StatefulWidget {
  final String judul;
  final IconData icon;
  final IconData iconback;
  final Widget child;
  var backgroundColor = [Color(0xFF358BFC), Color(0xFF3AE3CE)];

  DashboardWidgets(
      {this.judul, this.icon, this.child, this.backgroundColor, this.iconback});

  @override
  _DashboardWidgetsState createState() => _DashboardWidgetsState(
      judul: judul,
      icon: icon,
      child: child,
      backgroundColor: backgroundColor,
      iconback: iconback);
}

class _DashboardWidgetsState extends State<DashboardWidgets> {
  final String judul;
  final IconData icon;
  final IconData iconback;
  final Widget child;
  var backgroundColor = [Color(0xFF358BFC), Color(0xFF3AE3CE)];

  _DashboardWidgetsState(
      {@required this.judul,
      this.icon,
      this.child,
      this.backgroundColor,
      this.iconback});
  @override
  Widget build(BuildContext context) {
    print(judul);
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: backgroundColor)),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(iconback, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavbar();
                      }));
                    }),
                Text(
                  judul,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                IconButton(
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterDialog(
                            buttonSimpan: Color(0xFF3AE3CE),
                          );
                        });
                  },
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: child,
          ),
        ],
      ),
    );
  }
}
