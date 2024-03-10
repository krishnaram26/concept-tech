import 'package:concept_technologies_app/drawer.dart';
import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Groups/Categories",
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
        ),
        drawer: SideDrawer(),
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    // Within the `FirstRoute` widget
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Group Information'),
                          scrollable: true,
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Group Name"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Group ID"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group ID',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Description"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group description',
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
                                  'Add Group',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      '+ Add Group',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _createGroupDataTable(),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    // Within the `FirstRoute` widget
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Group Information'),
                          scrollable: true,
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Group Name"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Category name"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group ID',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Category ID"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group ID',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Description"),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextField(
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your group description',
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
                                  'Add Category',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      '+ Add Category',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _createGroupDataTable2(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> grpData = [
  {
    'grpId': 001,
    'grpName': 'Group 1',
    'grpDesc': 'Description 1',
  },
  {
    'grpId': 002,
    'grpName': 'Group 1',
    'grpDesc': 'Description 2',
  },
  {
    'grpId': 003,
    'grpName': 'Group 1',
    'grpDesc': 'Description 3',
  },
];

List<Map> grpData2 = [
  {
    'grpId': 001,
    'grpName': 'Group 1',
    'grpDesc': 'Description 1',
  },
  {
    'grpId': 002,
    'grpName': 'Group 1',
    'grpDesc': 'Description 2',
  },
  {
    'grpId': 003,
    'grpName': 'Group 1',
    'grpDesc': 'Description 3',
  },
];

DataTable _createGroupDataTable() {
  return DataTable(columns: _createGroupColumns(), rows: _createGroupRows());
}

List<DataColumn> _createGroupColumns() {
  return [
    const DataColumn(
        label: Text(
      'Group ID',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Group Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Group Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createGroupRows() {
  return grpData
      .map((grpData) => DataRow(cells: [
            DataCell(Text('#' + grpData['grpId'].toString())),
            DataCell(Text(grpData['grpName'])),
            DataCell(Text(grpData['grpDesc'])),
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

DataTable _createGroupDataTable2() {
  return DataTable(columns: _createGroupColumns2(), rows: _createGroupRows2());
}

List<DataColumn> _createGroupColumns2() {
  return [
    const DataColumn(
        label: Text(
      'Group ID',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Group Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Group Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createGroupRows2() {
  return grpData2
      .map((grpData2) => DataRow(cells: [
            DataCell(Text('#' + grpData2['grpId'].toString())),
            DataCell(Text(grpData2['grpName'])),
            DataCell(Text(grpData2['grpDesc'])),
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
