import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/data/models/patient_model.dart';
import 'package:adherence_admin/src/features/home/data/models/parent_model.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/cards/patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientsList extends StatelessWidget {
  final bool isAddressReturnalable;
  final DoctorModel doctorModel;

  const PatientsList(
      {Key key, this.isAddressReturnalable = false, this.doctorModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('patients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: Text("No Patients yet!"));
        else if (snapshot.data.docs.length == 0)
          return Center(child: Text("No Patients yet!"));

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
      isAddressReturnalable: isAddressReturnalable,
      doctorModel: doctorModel,
    );
  }
}

class PatientsPList extends StatelessWidget {
  final bool isAddressReturnalable;
  final ParentModel doctorModel;

  const PatientsPList(
      {Key key, this.isAddressReturnalable = false, this.doctorModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('patients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: Text("No Patients yet!"));
        else if (snapshot.data.docs.length == 0)
          return Center(child: Text("No Patients yet!"));

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
    return PatientPCard(
      patientModel: patienModel,
      isAddressReturnalable: isAddressReturnalable,
      doctorModel: doctorModel,
    );
  }
}

