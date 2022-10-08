import 'package:adherence_admin/src/features/home/presentation/pages/add_pages/add_doctor.dart';
import 'package:adherence_admin/src/features/home/presentation/pages/add_pages/add_patient.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/doctor_list.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/patients_list.dart';
import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';

import '../widgets/parents_list.dart';
import 'add_pages/add_parent.dart';
// import 'package:flutter_boom_menu/flutter_boom_menu.dart' as boom;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    openAddDoctorPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddDoctor(),
        ),
      );
    }

    openAddPatientsPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPatient(),
        ),
      );
    }

    openAddParentsPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddParent(),
        ),
      );
    }


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
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            // animatedIcon: AnimatedIcons.add_event,
            // child: Icon(Icons.add),
            // animatedIconTheme: IconThemeData(size: 22.0),
            // backgroundColor: accentColor,
            // //child: Icon(Icons.add),
            // onOpen: () => print('OPENING DIAL'),
            // onClose: () => print('DIAL CLOSED'),
            // scrollVisible: true,
            // overlayColor: Colors.black,
            // overlayOpacity: 0.7,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  openAddDoctorPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent
                  ),
                  child: Padding(
                      padding:EdgeInsets.only(
                          left: 14, right: 14, top: 15, bottom: 15),
                      child: new Text("Add Doctor",style: TextStyle(color: white),)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  openAddPatientsPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(
                        left: 14, right: 14, top: 15, bottom: 15),
                child: new Text("Add Patient",style: TextStyle(color: white)),
                  )
                )
              ),
              GestureDetector(
                onTap: () {
                  openAddParentsPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(
                        left: 14, right: 14, top: 15, bottom: 15),
                child: new Text("Add Parent",style: TextStyle(color: white)),
                  )
                )
              ),
              // boom.MenuItem(
              //   child: Icon(
              //     Icons.local_hospital_rounded,
              //     color: Colors.green,
              //   ),
              //   title: "Add Doctor",
              //   // titleColor: Colors.white,
              //   subtitle: "Add a doctor or medical professional",
              //   // subTitleColor: Colors.white,
              //   // backgroundColor: Colors.deepOrange,
              //   onTap: openAddDoctorPage,
              // ),
              // boom.MenuItem(
              //   child: Icon(
              //     Icons.family_restroom_rounded,
              //     color: Colors.blue,
              //   ),
              //   title: "Add Parent",
              //   // titleColor: Colors.white,
              //   subtitle: "Add the parent or guardian of the patient",
              //   // subTitleColor: Colors.white,
              //   // backgroundColor: Colors.deepOrange,
              //   onTap: () => print('Parent'),
              // ),
              // boom.MenuItem(
              //   child: Icon(
              //     Icons.account_circle_rounded,
              //     color: Colors.purple,
              //   ),
              //   title: "Add Patient",
              //   // titleColor: Colors.white,
              //   subtitle: "Add a new Patient",
              //   // subTitleColor: Colors.white,
              //   // backgroundColor: Colors.deepOrange,
              //   onTap: openAddPatientsPage,
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DoctorsList(),
            ParentsList(),
            PatientsList(),
          ],
        ),
      ),
    );
  }
}
