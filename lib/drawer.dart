import 'package:concept_technologies_app/dashboard.dart';
import 'package:concept_technologies_app/employees.dart';
import 'package:concept_technologies_app/groups.dart';
import 'package:concept_technologies_app/removedAsset.dart';
import 'package:concept_technologies_app/supplier.dart';
import 'package:concept_technologies_app/task.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'Concept Art Technologies ',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: const ListTile(
              tileColor: Color.fromRGBO(0, 0, 0, 0.05),
              leading: Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.redAccent,
              ),
              title: Text(
                "Person 1",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "person#1@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.apartment,
                color: Colors.red,
              ),
              title: Text(
                "Group",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Groups()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.badge_outlined,
                color: Colors.red,
              ),
              title: Text(
                "Employees",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Employees()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.all_inbox,
                color: Colors.red,
              ),
              title: Text(
                "Supplier",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Supplier()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.task,
                color: Colors.red,
              ),
              title: Text(
                "Tasks",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Task()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text(
                "Removed",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RemovedAsset()),
              );
            },
          ),
          ListTile(
            title: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          print("Add");
        },
      ),
    );
  }
}
