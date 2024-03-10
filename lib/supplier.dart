import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class Supplier extends StatefulWidget {
  const Supplier({Key? key}) : super(key: key);

  @override
  State<Supplier> createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  var currentSelectedValue;
  final deviceTypes = ["Male", "Female", "Other"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Supplier",
            style: TextStyle(color: Colors.red),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.red,
                size: 35,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                child: Container(
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Supplier Information'),
                      scrollable: true,
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Supplier Name"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your supplier name',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Agent Name"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your agent name',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Email"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your email',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Agent Phone Number"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your number',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("GST No"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your GST number',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Items Supplied"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your items supplied',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Brands Supplied"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your brands supplied',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Supplier Address"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your supplier address',
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            // Within the `FirstRoute` widget
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Add',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        drawer: SideDrawer(),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _createSupplierDataTable(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

List<Map> supplierData = [
  {
    'gstNo': 'abcd@gmail.com',
    'suppName': 'Person 1',
    'agentName': 'Agent 1',
    'agentNum': 'EDG668BGR99GR',
    'agentAdd': 1234567890
  },
  {
    'gstNo': 'abcd2@gmail.com',
    'suppName': 'Person 2',
    'agentName': 'Agent 2',
    'agentNum': 'EDG668BGR99GR',
    'agentAdd': 3597851555
  },
  {
    'gstNo': 'abcd3@gmail.com',
    'suppName': 'Person 3',
    'agentName': 'Agent 3',
    'agentNum': 'EDG668BGR99GR',
    'agentAdd': 4582648455
  },
];

DataTable _createSupplierDataTable() {
  return DataTable(
      columns: _createSupplierColumns(), rows: _createSupplierRows());
}

List<DataColumn> _createSupplierColumns() {
  return [
    const DataColumn(
        label: Text(
      'Supplier Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'GST NO',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Agent Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Agent Number',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Agent Address',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createSupplierRows() {
  return supplierData
      .map((supplierData) => DataRow(cells: [
            DataCell(Text(supplierData['suppName'])),
            DataCell(Text(supplierData['gstNo'])),
            DataCell(Text(supplierData['agentName'])),
            DataCell(Text(supplierData['agentNum'])),
            DataCell(Text(supplierData['agentAdd'].toString())),
            DataCell(Container(
              width: 100,
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.all(2.5),
                  child: InkWell(
                    onTap: () {
                      print("Edit");
                    },
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.5),
                  child: InkWell(
                    onTap: () {
                      print("Delete");
                    },
                    child: Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
            )),
          ]))
      .toList();
}
