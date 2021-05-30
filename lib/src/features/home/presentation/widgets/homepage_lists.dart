import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/cards/doctors_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('doctors').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
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
    final doctor = DoctorModel.fromSnapshot(data);

    return DoctorsCard(doctorModel: doctor);

    // return Padding(
    //   // key: ValueKey(doctor.name),
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.lightGreen),
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(5.0),
    //     ),
    //     child: ListTile(
    //       title: Text(
    //         doctor.name,
    //         style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    //       ),
    //       trailing: Text(
    //         doctor.designation.toString(),
    //         style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    //       ),
    // onTap: () => doctor.reference.updateData({'votes': record.votes + 1}),
    //     ),
    //   ),
    // );
  }
}
