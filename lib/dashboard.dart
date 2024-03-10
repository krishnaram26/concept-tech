import 'package:concept_technologies_app/login.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime date = DateTime(2022, 12, 24);
  var selectedStatus;
  final status = ["Active", "Inactive"];
  var selectedEmployee;
  final employeeList = [
    "Employee #1",
    "Employee #2",
    "Employee #3",
    "Employee #4",
    'Employee #5'
  ];
  var selectedWarranty;
  final warrantyTypes = [
    "Full",
    "Part",
  ];
  var selectedCategory;
  final categories = [
    "Category #1",
    "Category #2",
    "Category #3",
    "Category #4",
    'Category #5'
  ];
  var selectedSupplier;
  final suppliers = [
    "Supplier #1",
    "Supplier #2",
    "Supplier #3",
    "Supplier #4",
    'Supplier #5'
  ];

  final List<Assets> asset = [
    Assets(
        leadingNum: 11,
        title: "Asset #1",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(255, 0, 0, 0.2),
        titleColor: Colors.red),
    Assets(
        leadingNum: 22,
        title: "Asset #2",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(0, 255, 0, 0.2),
        titleColor: Colors.green),
    Assets(
        leadingNum: 33,
        title: "Asset #3",
        subtitle: "Asset Subtitle",
        bgColor: Color.fromRGBO(0, 0, 255, 0.2),
        titleColor: Colors.blue),
    Assets(
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
              "Dashboard",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
                child: Container(
                  width: 35,
                  height: 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(255, 0, 0, 0.5),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
                child: Container(
                  width: 35,
                  height: 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(255, 0, 0, 0.5),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
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
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: ((context, setState) => AlertDialog(
                                  title: const Text('Add Asset'),
                                  scrollable: true,
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Basic Info",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Asset Name"),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                'Enter your supplier name',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Description"),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextField(
                                          maxLines: 10,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter your agent name',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Assign to an employee"),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Select Employee"),
                                                  value: selectedEmployee,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedEmployee =
                                                          newValue;
                                                    });
                                                    print(selectedEmployee);
                                                  },
                                                  items: employeeList
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Group Name"),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter group name',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Select Category"),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Select Category"),
                                                  value: selectedCategory,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedCategory =
                                                          newValue;
                                                    });
                                                    print(selectedCategory);
                                                  },
                                                  items: categories
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Product Info",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Supplier Name"),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Select Supplier"),
                                                  value: selectedSupplier,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedSupplier =
                                                          newValue;
                                                    });
                                                    print(selectedSupplier);
                                                  },
                                                  items: suppliers
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Product Invoice"),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: InkWell(
                                          child: Container(
                                            height: 50,
                                            color: Colors.grey.shade300,
                                            child: ListTile(
                                              leading: Icon(Icons.upload),
                                              title: Text("Upload File"),
                                            ),
                                          ),
                                          onTap: () {
                                            print("Upload Photo");
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Warranty"),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Select warranty"),
                                                  value: selectedWarranty,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedWarranty =
                                                          newValue;
                                                    });
                                                    print(selectedWarranty);
                                                  },
                                                  items: warrantyTypes
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Warranty Expiration"),
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black54,
                                                      width: 0.5)),
                                              child: Center(
                                                child: Text(
                                                  "${date.day}/${date.month}/${date.year}",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              )),
                                        ),
                                        onTap: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: date,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                          );

                                          if (newDate == null) return;
                                          setState(() => date = newDate);
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Status"),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Select Status"),
                                                  value: selectedStatus,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedStatus = newValue;
                                                    });
                                                    print(selectedStatus);
                                                  },
                                                  items: status
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Quantity"),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child:
                                            NumberInputWithIncrementDecrement(
                                          widgetContainerDecoration:
                                              BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          min: 1,
                                          initialValue: 1,
                                          controller: TextEditingController(),
                                          numberFieldDecoration:
                                              InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
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
                                ))));
                  },
                ),
              )
            ],
          ),
          drawer: SideDrawer(),
          body: ListView(
            children: [
              /// ***** Asset Row *****
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
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
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
                    child: _createDashboardDataTable(),
                  ),
                ),
              ),

              /// ***** Data Table *****
            ],
          )),
    );
  }
}

class Assets {
  int leadingNum;
  String title;
  String subtitle;
  Color titleColor;
  Color bgColor;
  Assets({
    required this.leadingNum,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.titleColor,
  });
}

List<Map> dashboardData = [
  {
    'id': 100,
    'name': 'Person 1',
    'desc': 'Description 1',
    'price': 100,
    'qty': 1,
    'date': "12 / 4 / 21",
    'status': true
  },
  {
    'id': 101,
    'name': 'Person 2',
    'desc': 'Description 2',
    'price': 200,
    'qty': 3,
    'date': "14 / 12 / 21",
    'status': false
  },
  {
    'id': 102,
    'name': 'Person 3',
    'desc': 'Description 3',
    'price': 150,
    'qty': 3,
    'date': "13 / 9 / 21",
    'status': false
  },
  {
    'id': 103,
    'name': 'Person 4',
    'desc': 'Description 4',
    'price': 150,
    'qty': 3,
    'date': "13 / 9 / 21",
    'status': true
  },
  {
    'id': 104,
    'name': 'Person 5',
    'desc': 'Description 5',
    'price': 100,
    'qty': 7,
    'date': "13 / 9 / 21",
    'status': true
  },
  {
    'id': 105,
    'name': 'Person 6',
    'desc': 'Description 6',
    'price': 230,
    'qty': 5,
    'date': "13 / 9 / 21",
    'status': false
  },
  {
    'id': 106,
    'name': 'Person 7',
    'desc': 'Description 7',
    'price': 350,
    'qty': 5,
    'date': "13 / 9 / 21",
    'status': true
  },
];

// class Datas {
//   Icon ico;
//   String title;
//   String desc;
//   int numb;
//   int id;
//   int price;
//   Datas(
//       {required this.title,
//       required this.numb,
//       required this.ico,
//       required this.price,
//       required this.id,
//       required this.desc});
// }

DataTable _createDashboardDataTable() {
  return DataTable(
      columns: _createDashboardColumns(), rows: _createDashboardRows());
}

List<DataColumn> _createDashboardColumns() {
  return [
    const DataColumn(
        label: Text(
      'ID',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Price',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Quantity',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Status',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createDashboardRows() {
  return dashboardData
      .map((data) => DataRow(cells: [
            DataCell(Text('#' + data['id'].toString())),
            DataCell(Text(data['name'])),
            DataCell(Text(data['desc'])),
            DataCell(Text('₹' + data['price'].toString())),
            DataCell(Text(data['qty'].toString())),
            DataCell(Text(data['date'])),
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
            DataCell(Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: data['status'] == false ? Colors.green : Colors.red),
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
                          Text(data['status'] == false ? "Active" : "Inactive",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    )),
              ),
            )),
          ]))
      .toList();
}
