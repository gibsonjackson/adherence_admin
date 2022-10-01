import 'package:adherence_admin/src/features/home/data/models/parent_model.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/cards/doctors_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cards/parents_card.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

class ParentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fs.Firestore store = firestore();
    // fs.CollectionReference ref = store.collection('doctors');
    // List blah = [];
    // ref.onSnapshot.listen((querySnapshot) {
    //   querySnapshot.docChanges().forEach((change) {
    //     blah.add(change.doc.data());
    //     print(change.doc.data());

    //     if (change.type == "added") {
    //       // Do something with change.doc
    //     }
    //   });
    // });
    // return _buildList(context, blah);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('parents').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: Text("No Parents yet!"));
        else if (snapshot.data.docs.length == 0)
          return Center(child: Text("No Parents yet!"));

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List snapshot) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, var data) {
    final parent = ParentModel.fromSnapshot(data);
    return ParentsCard(doctorModel: parent);
  }
}
