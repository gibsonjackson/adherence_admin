import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/patients_list.dart';
import 'package:flutter/material.dart';

import '../../../data/models/parent_model.dart';

class AddParentToPatient extends StatelessWidget {
  final ParentModel doctor;
  const AddParentToPatient({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Patient"),
      ),
      body: PatientsPList(
        isAddressReturnalable: true,
        doctorModel: doctor,
      ),
    );
  }
}
