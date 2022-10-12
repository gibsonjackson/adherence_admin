import 'package:adherence_admin/src/features/home/data/models/patient_model.dart';
import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';

import 'doctor_page.dart';

class PatientPage extends StatelessWidget {
  final PatientModel patientModel;

  const PatientPage({Key key, this.patientModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Icon(
            Icons.account_circle,
            size: 60,
          ),
          SizedBox(height: 5),
          Text(
            patientModel.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: primaryColor,
                ),
          ),
          // SizedBox(height: 5),
          // Text(
          //   doctor.designation,
          //   style: Theme.of(context).textTheme.subtitle1.copyWith(
          //         color: accentColor,
          //       ),
          // ),
          SizedBox(height: 15),
          MyTableRow("Email", patientModel.email),
          MyTableRow("Phone", patientModel.phone),
          MyTableRow("Password", patientModel.password),
          MyTableRow("Doctor", patientModel.doctor==Null?"No Doctor Assigned yet":patientModel.doctor),
          MyTableRow("Parent", patientModel.parent==Null?"No Doctor Assigned yet":patientModel.parent),
        ],
      ),
    );
  }
}
