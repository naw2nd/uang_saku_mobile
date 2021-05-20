import 'package:flutter/material.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:intl/intl.dart';
//import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class FilterDialog extends StatefulWidget {
  var buttonSimpan = Color(0xFF358BFC);
  DateTime tanggalMulai;
  DateTime tanggalSelesai;

  FilterDialog({this.buttonSimpan, this.tanggalMulai, this.tanggalSelesai});
  @override
  _FilterDialogState createState() => _FilterDialogState(
      buttonSimpan: buttonSimpan,
      tanggalMulai: tanggalMulai,
      tanggalSelesai: tanggalSelesai);
}

class _FilterDialogState extends State<FilterDialog> {
  var buttonSimpan = Color(0xFF358BFC);
  DateTime tanggalMulai;
  DateTime tanggalSelesai;
  TextEditingController tanggalMulaiCtrl = TextEditingController();
  TextEditingController tanggalSelesaiCtrl = TextEditingController();

  _FilterDialogState(
      {this.buttonSimpan, this.tanggalMulai, this.tanggalSelesai});

  _selectDate(BuildContext context, DateTime init, bool end) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: (init != null)
            ? init
            : (!end || tanggalMulai == null)
                ? DateTime.now()
                : tanggalMulai,
        firstDate:
            (tanggalMulai != null && end) ? tanggalMulai : DateTime(1945),
        lastDate:
            (tanggalSelesai != null && !end) ? tanggalSelesai : DateTime(2045),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      if (!end) {
        tanggalMulai = newSelectedDate;
        tanggalMulaiCtrl.text = DateFormat.yMMMMd('en_US').format(tanggalMulai);
      } else {
        tanggalSelesai = newSelectedDate;
        tanggalSelesaiCtrl.text =
            DateFormat.yMMMMd('en_US').format(tanggalSelesai);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Dialog(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Filter",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFF555555))),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Tanggal Mulai',
                    ),
                    onTap: () {
                      setState(() {
                        _selectDate(context, tanggalMulai, false);
                        // _selectDate(context);
                      });
                    },
                    controller: tanggalMulaiCtrl,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Tanggal Selesai',
                    ),
                    onTap: () {
                      setState(() {
                        _selectDate(context, tanggalSelesai, true);
                      });
                    },
                    controller: tanggalSelesaiCtrl,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Batal",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      onPressed: () {
                        print(tanggalMulaiCtrl.text);
                        print(tanggalSelesaiCtrl.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListKasbon(
                                      tglMulaiHolder: DateFormat.yMMMMd('en_US')
                                          .parse(tanggalMulaiCtrl.text),
                                      tglSelesaiHolder:
                                          DateFormat.yMMMMd('en_US')
                                              .parse(tanggalSelesaiCtrl.text),
                                    )));
                      },
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Text(tanggalMulaiCtrl.text),
                Text(tanggalSelesaiCtrl.text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
