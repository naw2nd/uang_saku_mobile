import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';
import 'package:uang_saku/ui/widgets/filter_dialog.dart';

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
                      Navigator.push(context, MaterialPageRoute(builder: (context){
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
                            return FilterDialog(buttonSimpan: Color(0xFF3AE3CE),);
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     BottomNavigationBar(
          //       currentIndex: _currentTab,
          //       items: [
          //         BottomNavigationBarItem(
          //             icon: Icon(
          //               Icons.dashboard_outlined,
          //               color: Color(0xFF358BFC),
          //               size: 25,
          //             ),
          //             label: ""),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.history,
          //                 color: Color(0xFF358BFC), size: 25),
          //             label: ""),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.add_circle_outlined,
          //                 color: Color(0xFF3AE3CE), size: 60),
          //             label: ""),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.notifications,
          //                 color: Color(0xFF3AE3CE), size: 25),
          //             label: ""),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.person_outline_rounded,
          //                 color: Color(0xFF3AE3CE), size: 25),
          //             label: "")
          //       ],
          //       onTap: (index) {},
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
