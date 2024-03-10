import 'package:concept_technologies_app/drawer.dart';
import 'package:flutter/material.dart';

class RemovedAsset extends StatefulWidget {
  const RemovedAsset({Key? key}) : super(key: key);

  @override
  State<RemovedAsset> createState() => _RemovedAssetState();
}

class _RemovedAssetState extends State<RemovedAsset> {
  final List<RemovedAssets> asset = [
    RemovedAssets(
        leadingNum: 11,
        title: "Asset #1",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(255, 0, 0, 0.2),
        titleColor: Colors.red),
    RemovedAssets(
        leadingNum: 22,
        title: "Asset #2",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(0, 255, 0, 0.2),
        titleColor: Colors.green),
    RemovedAssets(
        leadingNum: 33,
        title: "Asset #3",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(0, 0, 255, 0.2),
        titleColor: Colors.blue),
    RemovedAssets(
        leadingNum: 44,
        title: "Asset #4",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(255, 0, 0, 0.2),
        titleColor: Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Removed Asset",
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: asset.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5),
                        child: Container(
                          width: 240,
                          // height: 90,
                          decoration: BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Align(
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: asset[index].bgColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    asset[index].leadingNum.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: asset[index].titleColor),
                                  ),
                                ),
                              ),
                              title: Text(
                                asset[index].title,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                asset[index].subtitle,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),

            /// ***** Asset Row *****

            /// ***** Data Table *****
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
                  child: _createRemovedDataTable(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RemovedAssets {
  int leadingNum;
  String title;
  String subtitle;
  Color titleColor;
  Color bgColor;
  RemovedAssets({
    required this.leadingNum,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.titleColor,
  });
}

List<Map> removedData = [
  {
    'type': 'Asset Type #1',
    'name': 'Item #1',
    'desc': 'Description 1',
    'id': 'PGDF537GS4',
    'category': 'cATEGORY #1',
    'date': "12 / 4 / 21",
    'status': false
  },
  {
    'type': 'Asset Type #2',
    'name': 'Item #2',
    'desc': 'Description 2',
    'id': 'PGDF537GS4',
    'category': 'cATEGORY #2',
    'date': "12 / 4 / 21",
    'status': false
  },
  {
    'type': 'Asset Type #3',
    'name': 'Item #3',
    'desc': 'Description 3',
    'id': 'PGDF537GS4',
    'category': 'cATEGORY #3',
    'date': "12 / 4 / 21",
    'status': false
  },
  {
    'type': 'Asset Type #4',
    'name': 'Item #4',
    'desc': 'Description 4',
    'id': 'PGDF537GS4',
    'category': 'cATEGORY #4',
    'date': "12 / 4 / 21",
    'status': false
  },
];

DataTable _createRemovedDataTable() {
  return DataTable(
      columns: _createRemovedColumns(), rows: _createRemovedRows());
}

List<DataColumn> _createRemovedColumns() {
  return [
    const DataColumn(
        label: Text(
      'Asset Type',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Asset Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Asset Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'ID Tag',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Category',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Status',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createRemovedRows() {
  return removedData
      .map((removedData) => DataRow(cells: [
            DataCell(Text(removedData['type'])),
            DataCell(Text(removedData['name'])),
            DataCell(Text(removedData['desc'])),
            DataCell(Text(removedData['id'])),
            DataCell(Text(removedData['category'])),
            DataCell(Text(removedData['date'])),
            DataCell(Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: removedData['status'] == false
                        ? Colors.red
                        : Colors.green),
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              removedData['status'] == false
                                  ? "Inactive"
                                  : "Active",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    )),
              ),
            )),
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
                      print("View");
                    },
                    child: Icon(
                      Icons.visibility,
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
            //Text(data['status'] == false ? "Active" : "Inactive", style: TextStyle(fontSize: 20, color: Colors.white)),
          ]))
      .toList();
}
