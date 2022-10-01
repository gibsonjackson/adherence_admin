import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/pages/indi_pages/add_doctor_tp_patient.dart';
import 'package:adherence_admin/src/features/home/presentation/widgets/patients_for_doctor.dart';
import 'package:adherence_admin/src/utils/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../../data/models/parent_model.dart';
import '../../widgets/patients_for_doctor.dart';
import '../../widgets/patients_for_parent.dart';
import 'AddParentToPatient.dart';

class ParentPage extends StatelessWidget {
  final ParentModel doctor;

  ParentPage({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("awsm");
    print(doctor.password);

    selectPatient() {
      Navigator.of(context)
          .push(new MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return AddParentToPatient(doctor: doctor);
          },
          fullscreenDialog: true))
          .then((value) {
        print(value);
      });
    }

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
            doctor.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: primaryColor,
            ),
          ),
          SizedBox(height: 15),
          MyTableRow("Email", doctor.email),
          MyTableRow("Phone", doctor.phone),
          // _tableRow("Available Days", "Mon-Wed, 9-5", isWeekVisible: true),
          // _tableRow("Available Time", "9am-5pm"),
          MyTableRow(
              "Password", (doctor.password != null ? doctor.password : "")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectPatient,
                child: Text("Add Patient"),
              ),
            ),
          ),
          Expanded(
            child: PatientsForParent(
              doctorModel: doctor,
            ),
          )
        ],
      ),
    );
  }
}

class MyTableRow extends StatelessWidget {
  String title, val;
  final bool isWeekVisible;
  final values = [
    false, // Sunday
    true, // Monday
    true, // Tuesday
    true, // Wednesday
    true, // Thursday
    true, // Friday
    false, // Saturday
  ];

  MyTableRow(this.title, this.val, {this.isWeekVisible = false});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: grey,
                ),
              ),
              isWeekVisible
                  ? Expanded(
                child: FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  //FIXME for websites 1/3 is a good ratio
                  widthFactor: 7.5 / 10,
                  child: SizedBox(
                    height: 20,
                    child: WeekdaySelector(
                      onChanged: (int day) {},
                      values: values,
                    ),
                  ),
                ),
              )
                  : Text(
                val,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
