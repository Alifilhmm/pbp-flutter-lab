import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/menu.dart';
import 'package:counter_7/show_budget.dart';
import 'list.dart' as globals;

class InputBudgetPage extends StatefulWidget {
  const InputBudgetPage({super.key});

  @override
  State<InputBudgetPage> createState() => _InputBudgetPageState();
}

class Budget {
  late String judul;
  late int nominal;
  late String tipeBudget;
  late DateTime date;

  Budget(
      {required this.judul,
      required this.nominal,
      required this.tipeBudget,
      required this.date});
}

class _InputBudgetPageState extends State<InputBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String? judul;
  int? nominal;
  String? tipeBudget;
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime date = DateTime.now();

  onPressed(BuildContext context) {
    var data = Budget(judul: judul!, nominal: nominal!, tipeBudget: tipeBudget!, date: date);
    globals.budgets.add(data);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ShowBudgetPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Budget')),
      drawer: const DrawMenu(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Beli Barang",
                      labelText: "Judul",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "50000",
                      labelText: "Nominal",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                ListTile(
                  title: Text(date.toString()),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != date) {
                      setState(() 
                        {date = picked;
                      });
                    }
                  },
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: tipeBudget,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: listJenisBudget.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        tipeBudget = newValue!;
                      });
                    },
                    hint: Container(
                      width: 150,
                      child: const Text(
                        "Pilih Jenis",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (tipeBudget == null || tipeBudget == '') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text('Pilih tipe tidak boleh kosong')
                                      ),
                                      const SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          onPressed(context);
                        }
                      }
                    },
                    child: const Text("Simpan", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
