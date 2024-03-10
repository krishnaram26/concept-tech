import 'package:flutter/material.dart';

import 'drawer.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  var currentSelectedValue;
  final deviceTypes = ["Male", "Female", "Other"];
  var currentValue;
  final statusTypes = ["Active", "Inactive", "Intern"];
  String dropdownValue = 'Male';
  DateTime date = DateTime(2022, 12, 24);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Employees",
            style: TextStyle(color: Colors.red),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
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
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => StatefulBuilder(
                          builder: ((context, setState) => AlertDialog(
                                title: const Text('Add Employee'),
                                scrollable: true,
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Basic Info",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("First Name"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your first name',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("Middle Name"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your mid name',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Last Name"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your last name',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Employee Photo"),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: InkWell(
                                        child: Container(
                                          height: 50,
                                          color: Colors.grey.shade300,
                                          child: const ListTile(
                                            leading: Icon(Icons.upload),
                                            title: Text("Upload File"),
                                          ),
                                        ),
                                        onTap: () {
                                          print("Upload Photo");
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Gender"),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: FormField<String>(
                                        builder:
                                            (FormFieldState<String> state) {
                                          return InputDecorator(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0))),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                hint:
                                                    const Text("Select Gender"),
                                                value: currentSelectedValue,
                                                isDense: true,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    currentSelectedValue =
                                                        newValue;
                                                  });
                                                  print(currentSelectedValue);
                                                },
                                                items: deviceTypes
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
                                    const SizedBox(height: 10),
                                    const Text("Email"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your email',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Status"),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: FormField<String>(
                                        builder:
                                            (FormFieldState<String> state) {
                                          return InputDecorator(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0))),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                hint:
                                                    const Text("Select status"),
                                                value: currentValue,
                                                isDense: true,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    currentValue = newValue;
                                                  });
                                                  print(currentValue);
                                                },
                                                items: statusTypes
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
                                    const SizedBox(height: 10),
                                    const Text("Phone Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your phone num',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Date of birth"),
                                    // Text(
                                    //     '${date.year}/${date.month}/${date.day}'),
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
                                                style: const TextStyle(
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
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text(
                                        "Extra Info",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const Text("Emergency Contact Name"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your contact name',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                        "Emergency Contact Relationship"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText:
                                              'Enter contact relationship',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Emergency Contact Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your contact number',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Designation"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your designation',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Aadhar Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your aadhar num',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Pan Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your pan',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Passport Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your passport num',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Driving License Number"),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText:
                                              'Enter driving  license num',
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
                                      child: const Text(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _createEmployeeDataTable(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> employeeData = [
  {
    'name': 'Person 1',
    'date': "12 / 4 / 21",
    'status': 'Intern',
    'gender': true,
    'num': 1234567890,
    'bloodGrp': 'B+'
  },
  {
    'name': 'Person 2',
    'date': "14 / 12 / 21",
    'status': 'Inactive',
    'gender': true,
    'num': 9246891235,
    'bloodGrp': 'A+'
  },
  {
    'name': 'Person 3',
    'date': "13 / 9 / 21",
    'status': 'Active',
    'gender': false,
    'num': 7483574638,
    'bloodGrp': 'O+'
  },
];

DataTable _createEmployeeDataTable() {
  return DataTable(
      columns: _createEmployeeColumns(), rows: _createEmployeeRows());
}

List<DataColumn> _createEmployeeColumns() {
  return [
    const DataColumn(
        label: Text(
      'Name',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Status',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Phone Number',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Blood Group',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Gender',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Actions',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createEmployeeRows() {
  return employeeData
      .map((data) => DataRow(cells: [
            DataCell(Text(data['name'])),
            DataCell(Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: data['status'] == 'Intern'
                      ? Colors.deepPurpleAccent
                      : data['status'] == 'Active'
                          ? Colors.green
                          : Colors.redAccent,
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              data['status'] == 'Intern'
                                  ? "Intern"
                                  : data['status'] == 'Active'
                                      ? "Active"
                                      : "Inactive",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    )),
              ),
            )),
            DataCell(Text(data['date'])),
            DataCell(Text(data['num'].toString())),
            DataCell(Text(data['bloodGrp'])),
            DataCell(Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: data['gender'] == false ? Colors.pink : Colors.blue),
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(
                            data['gender'] == false ? Icons.female : Icons.male,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(data['gender'] == false ? "Female" : "Male",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ],
                      ),
                    )),
              ),
            )),
            DataCell(Container(
              width: 100,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: InkWell(
                    onTap: () {
                      print("Edit");
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: InkWell(
                    onTap: () {
                      print("View");
                    },
                    child: const Icon(
                      Icons.visibility,
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
