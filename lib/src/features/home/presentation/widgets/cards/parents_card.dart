import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/features/home/presentation/pages/indi_pages/ParentPage.dart';
import 'package:flutter/material.dart';
import '../../../data/models/parent_model.dart';
class ParentsCard extends StatelessWidget {
  final ParentModel doctorModel;

  const ParentsCard({Key key, @required this.doctorModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    openParentPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParentPage(doctor: doctorModel),
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
          onTap: openParentPage,
          child: ListTile(
            title: Text(doctorModel.name),
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
