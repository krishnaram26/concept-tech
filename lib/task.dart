import 'package:concept_technologies_app/drawer.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var currentSelectedTask;
  final tasks = ["Low", "Moderate", "High", "Very High"];
  var currentSelectedEmployee;
  final employee = ["Employee #1", "Employee #2", "Employee #3", "Employee #4"];
  DateTime startDate = DateTime(2022, 12, 24);
  DateTime dueDate = DateTime(2022, 12, 24);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Tasks",
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
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
                                    title: const Text('Add Task'),
                                    scrollable: true,
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Milestone"),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter milestone',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Priority"),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: FormField<String>(
                                            builder:
                                                (FormFieldState<String> state) {
                                              return InputDecorator(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.0))),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    hint:
                                                        Text("Select priority"),
                                                    value: currentSelectedTask,
                                                    isDense: true,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        currentSelectedTask =
                                                            newValue;
                                                      });
                                                      print(
                                                          currentSelectedTask);
                                                    },
                                                    items: tasks
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
                                        Text("Description"),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: TextField(
                                            maxLines: 10,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText:
                                                  'Enter your group description',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Start Date"),
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
                                                        width: 0.7)),
                                                child: Center(
                                                  child: Text(
                                                    "${startDate.day}/${startDate.month}/${startDate.year}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )),
                                          ),
                                          onTap: () async {
                                            DateTime? newDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: startDate,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                            );

                                            if (newDate == null) return;
                                            setState(() => startDate = newDate);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Due Date"),
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
                                                        width: 0.7)),
                                                child: Center(
                                                  child: Text(
                                                    "${dueDate.day}/${dueDate.month}/${dueDate.year}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )),
                                          ),
                                          onTap: () async {
                                            DateTime? newDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: dueDate,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                            );

                                            if (newDate == null) return;
                                            setState(() => startDate = newDate);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Assign an employee"),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: FormField<String>(
                                            builder:
                                                (FormFieldState<String> state) {
                                              return InputDecorator(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.0))),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    hint:
                                                        Text("Select employee"),
                                                    value:
                                                        currentSelectedEmployee,
                                                    isDense: true,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        currentSelectedEmployee =
                                                            newValue;
                                                      });
                                                      print(
                                                          currentSelectedEmployee);
                                                    },
                                                    items: employee
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
                  ))
            ],
          ),
          drawer: SideDrawer(),
          body: ListView(
            children: [
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
                    child: _createTaskDataTable(),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
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
                    child: _createCompletedTaskDataTable(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

List<Map> taskData = [
  {
    'task': 'Task #1',
    'priority': 'Moderate',
    'desc': 'Description for this task',
    'startDate': '12/12/23',
    'endDate': '12/12/30',
    'employee': 'Person #1',
    'creteDate': '12/12/20',
    'action': 'Mark Done'
  },
  {
    'task': 'Task #2',
    'priority': 'Low',
    'desc': 'Description for this task',
    'startDate': '12/12/23',
    'endDate': '12/12/30',
    'employee': 'Person #2',
    'creteDate': '12/12/20',
    'action': 'Mark Done'
  },
  {
    'task': 'Task #3',
    'priority': 'Moderate',
    'desc': 'Description for this task',
    'startDate': '12/12/23',
    'endDate': '12/12/30',
    'employee': 'Person #3',
    'creteDate': '12/12/20',
    'action': 'Mark Done'
  },
  {
    'task': 'Task #4',
    'priority': 'High',
    'desc': 'Description for this task',
    'startDate': '12/12/23',
    'endDate': '12/12/30',
    'employee': 'Person #4',
    'creteDate': '12/12/20',
    'action': 'Mark Done'
  },
];

DataTable _createTaskDataTable() {
  return DataTable(columns: _createTaskColumns(), rows: _createTaskRows());
}

List<DataColumn> _createTaskColumns() {
  return [
    const DataColumn(
        label: Text(
      'Task',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Priority',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Start Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'End Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Employee',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Created On',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Action',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createTaskRows() {
  return taskData
      .map((taskData) => DataRow(cells: [
            DataCell(Text(taskData['task'])),
            DataCell(Text(taskData['priority'])),
            DataCell(Text(taskData['desc'])),
            DataCell(Text(taskData['startDate'])),
            DataCell(Text(taskData['endDate'])),
            DataCell(Text(taskData['employee'])),
            DataCell(Text(taskData['creteDate'])),
            DataCell(Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  taskData['action'],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900),
                ),
              ),
            )),
            //Text(data['status'] == false ? "Active" : "Inactive", style: TextStyle(fontSize: 20, color: Colors.white)),Text(taskData['action'])
          ]))
      .toList();
}

List<Map> completedTaskData = [
  {
    'task': '',
    'priority': '',
    'desc': '',
    'startDate': '',
    'endDate': '',
    'employee': '',
    'creteDate': '',
  },
];

DataTable _createCompletedTaskDataTable() {
  return DataTable(
      columns: _createCompletedTaskColumns(), rows: _createCompletedTaskRows());
}

List<DataColumn> _createCompletedTaskColumns() {
  return [
    const DataColumn(
        label: Text(
      'Task',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Priority',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Description',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Start Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'End Date',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Employee',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
    const DataColumn(
        label: Text(
      'Created On',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    )),
  ];
}

List<DataRow> _createCompletedTaskRows() {
  return completedTaskData
      .map((completedTaskData) => DataRow(cells: [
            DataCell(Text(completedTaskData['task'])),
            DataCell(Text(completedTaskData['priority'])),
            DataCell(Text(completedTaskData['desc'])),
            DataCell(Text(completedTaskData['startDate'])),
            DataCell(Text(completedTaskData['endDate'])),
            DataCell(Text(completedTaskData['employee'])),
            DataCell(Text(completedTaskData['creteDate'])),
            //Text(data['status'] == false ? "Active" : "Inactive", style: TextStyle(fontSize: 20, color: Colors.white)),Text(taskData['action'])
          ]))
      .toList();
}
