import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/patients_list.dart';
import 'package:flutter/material.dart';

class AddDoctorToPatient extends StatelessWidget {
  final DoctorModel doctor;
  const AddDoctorToPatient({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Patient"),
      ),
      body: PatientsList(
        isAddressReturnalable: true,
        doctorModel: doctor,
      ),
    );
  }
}
