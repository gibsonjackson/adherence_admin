import 'package:adherence_admin/src/features/home/presentation/widgets/homepage_lists.dart';
import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.APP_NAME),
          bottom: TabBar(
            indicatorColor: white,
            tabs: [
              Tab(text: "Doctors"),
              Tab(text: "Parents"),
              Tab(text: "Patients"),
            ],
          ),
        ),
        floatingActionButton: BoomMenu(
          // animatedIcon: AnimatedIcons.add_event,
          child: Icon(Icons.add),
          animatedIconTheme: IconThemeData(size: 22.0),
          backgroundColor: accentColor,
          //child: Icon(Icons.add),
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          scrollVisible: true,
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          children: [
            MenuItem(
              child: Icon(
                Icons.local_hospital_rounded,
                color: Colors.green,
              ),
              title: "Add Doctor",
              // titleColor: Colors.white,
              subtitle: "Add a doctor or medical professional",
              // subTitleColor: Colors.white,
              // backgroundColor: Colors.deepOrange,
              onTap: () => print('FIRST CHILD'),
            ),
            MenuItem(
              child: Icon(
                Icons.family_restroom_rounded,
                color: Colors.blue,
              ),
              title: "Add Parent",
              // titleColor: Colors.white,
              subtitle: "Add the parent or guardian of the patient",
              // subTitleColor: Colors.white,
              // backgroundColor: Colors.deepOrange,
              onTap: () => print('Parent'),
            ),
            MenuItem(
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.purple,
              ),
              title: "Add Patient",
              // titleColor: Colors.white,
              subtitle: "Add a new Patient",
              // subTitleColor: Colors.white,
              // backgroundColor: Colors.deepOrange,
              onTap: () => print('Patient'),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            HomepageLists(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
