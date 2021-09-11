import 'package:adherence_admin/src/features/home/data/datasources/firebase_home_provider.dart';
import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/data/models/patient_model.dart';
import 'package:adherence_admin/src/features/home/presentation/pages/indi_pages/patient_page.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final PatientModel patientModel;
  final bool isAddressReturnalable;
  final DoctorModel doctorModel;

  const PatientCard(
      {Key key,
      this.patientModel,
      this.isAddressReturnalable,
      this.doctorModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    openPatientPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientPage(patientModel: patientModel),
        ),
      );
    }

    returnAddress() {
      FirebaseHomeProvider()
          .addDoctorToPatient(patientModel.email, doctorModel.email);
      Navigator.pop(context);
      // return patientModel.email;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          onTap: isAddressReturnalable ? returnAddress : openPatientPage,
          child: ListTile(
            title: Text(patientModel.name),
            subtitle: Text(patientModel.email),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ],
            ),
            minLeadingWidth: 0,
          ),
        ),
      ),
    );
  }
}
