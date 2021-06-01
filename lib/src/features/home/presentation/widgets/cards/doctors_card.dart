import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/pages/indi_pages/doctor_page.dart';
import 'package:flutter/material.dart';

class DoctorsCard extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorsCard({Key key, @required this.doctorModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    openDoctorPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorPage(doctor: doctorModel),
        ),
      );
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
          onTap: openDoctorPage,
          child: ListTile(
            title: Text(doctorModel.name),
            subtitle: Text(doctorModel.designation),
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
