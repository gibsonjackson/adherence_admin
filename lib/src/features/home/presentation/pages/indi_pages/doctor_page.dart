import 'package:adherence_admin/src/features/home/data/models/doctor_model.dart';
import 'package:adherence_admin/src/utils/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class DoctorPage extends StatelessWidget {
  final DoctorModel doctor;

  DoctorPage({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 5),
          Text(
            doctor.designation,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: accentColor,
                ),
          ),
          SizedBox(height: 15),
          TableRow("Email", doctor.email),
          TableRow("Phone", doctor.phone),
          // _tableRow("Available Days", "Mon-Wed, 9-5", isWeekVisible: true),
          // _tableRow("Available Time", "9am-5pm"),
          TableRow("Location", doctor.clinic),
        ],
      ),
    );
  }
}

class TableRow extends StatelessWidget {
  final String title, val;
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

  TableRow(this.title, this.val, {this.isWeekVisible = false});

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
                        fontWeight: FontWeight.w500,
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
