import 'package:adherence_admin/src/features/home/data/datasources/firebase_home_provider.dart';
import 'package:adherence_admin/src/features/home/data/models/patient_model.dart';
import 'package:adherence_admin/src/utils/res/res.dart';
import 'package:flutter/material.dart';

import 'add_doctor.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _patientFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController(),
      _phoneController = TextEditingController(),
      _emailController = TextEditingController();

  bool isLoading = false;

  validateForm(BuildContext context) async {
    if (!isLoading) {
      if (_patientFormKey.currentState.validate()) {
        FirebaseHomeProvider firebaseHomeProvider = FirebaseHomeProvider();
        PatientModel patientModel = PatientModel(
          name: _nameController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          role: ROLES.PATIENT,
        );
        setState(() {
          isLoading = true;
        });
        await firebaseHomeProvider.addUser(patientModel.toUserJson());
        await firebaseHomeProvider
            .addPatient(patientModel.toPatientJson())
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Patient Added Successfully!',
              ),
              backgroundColor: successColor,
            ),
          );
          Navigator.of(context).pop();
        });

        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Doctor"),
        actions: [
          TextButton(
            child: Text(
              "ADD",
              style: TextStyle(color: white),
            ),
            onPressed: () => validateForm(context),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Form(
                  key: _patientFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyFormField(
                        title: "Enter Name",
                        controller: _nameController,
                      ),
                      MyFormField(
                        title: "Enter Email",
                        isEmail: true,
                        controller: _emailController,
                      ),
                      MyFormField(
                        title: "Enter Phone",
                        isPhone: true,
                        controller: _phoneController,
                      ),
                      MyButton(
                        foo: () => validateForm(context),
                        title: "Add Patient",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
