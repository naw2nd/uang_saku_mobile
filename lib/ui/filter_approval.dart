import 'package:flutter/material.dart';

class FilterApproval extends StatefulWidget {
  @override
  _FilterApprovalState createState() => _FilterApprovalState();
}

class _FilterApprovalState extends State<FilterApproval> {
  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now();
  var buttonSimpan = Color(0xFF358BFC);
  TextEditingController tanggalMulai = TextEditingController();
  TextEditingController tanggalSelesai = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        String convertedDateTime =
            "${currentDate.year.toString()}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')} ";

        tanggalMulai.text = convertedDateTime;
      });
  }

  Future<void> _endDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != endDate)
      setState(() {
        endDate = pickedDate;
        String convertedDateTime =
            "${endDate.year.toString()}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')} ";

        tanggalSelesai.text = convertedDateTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            //height: MediaQuery.of(context).size.height * 0.5,
            child: Dialog(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Filter",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0xFF555555))),
                        IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Tanggal Pengajuan",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF555555))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.black45),
                                        errorStyle:
                                            TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                        labelText: 'Dari',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectDate(context);
                                        });
                                      },
                                      controller: tanggalMulai,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.black45),
                                        errorStyle:
                                            TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                        labelText: 'Sampai',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _endDate(context);
                                        });
                                      },
                                      controller: tanggalSelesai,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LabelChip(
                              judul: "Kategori Penjualan",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "Perjalanan Dinas",
                                ),
                                ChipFilter(
                                  label: "Kebutuhan Kantor",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "Biaya Kirim",
                                ),
                                ChipFilter(
                                  label: "Promosi",
                                ),
                                ChipFilter(
                                  label: "Entertaiment",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LabelChip(
                              judul: "Status",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "Menunggu  ",
                                ),
                                ChipFilter(
                                  label: "Setuju",
                                ),
                                ChipFilter(
                                  label: "Tolak",
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LabelChip(
                              judul: "Divisi",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "IT",
                                ),
                                ChipFilter(
                                  label: "Marketing",
                                ),
                                ChipFilter(
                                  label: "Keuangan",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "HRGA",
                                ),
                                ChipFilter(
                                  label: "Manajemen",
                                ),
                                ChipFilter(
                                  label: "Teknisi",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LabelChip(
                              judul: "Perushaan",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "WRG",
                                ),
                                ChipFilter(
                                  label: "WMI",
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LabelChip(
                              judul: "Cabang",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ChipFilter(
                                  label: "Surabaya",
                                ),
                                ChipFilter(
                                  label: "Malang",
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChipFilter extends StatefulWidget {
  String label = "Tolak";
  ChipFilter({this.label});
  @override
  _ChipFilterState createState() => _ChipFilterState(label: label);
}

class _ChipFilterState extends State<ChipFilter> {
  String label = "Tolak";
  _ChipFilterState({this.label});
  bool _chipBackground = false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 10),
        ),
        selected: _chipBackground,
        onSelected: (bool selected) {
          setState(() {
            _chipBackground = !_chipBackground;
          });
        },
        selectedColor: Colors.blue,
        checkmarkColor: Colors.white,
      ),
    );
  }
}

class LabelChip extends StatelessWidget {
  String judul = "Divisi";
  LabelChip({this.judul});
  @override
  Widget build(BuildContext context) {
    return Text(
      judul,
      style: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          color: Color(0xFF555555)),
    );
  }
}
