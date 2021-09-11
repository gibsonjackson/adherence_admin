import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/data/models/patient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cards/patient_card.dart';

class PatientsForDoctor extends StatelessWidget {
  final DoctorModel doctorModel;
  const PatientsForDoctor({Key key, this.doctorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('patients')
          .where('doctor', isEqualTo: doctorModel.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: Text("Add Patients for the doctor"));
        else if (snapshot.data.docs.length == 0)
          return Center(child: Text("Add Patients for the doctor"));

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final patienModel = PatientModel.fromSnapshot(data);
    return PatientCard(
      patientModel: patienModel,
      isAddressReturnalable: false,
    );
  }
}
