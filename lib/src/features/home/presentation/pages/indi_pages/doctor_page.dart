import 'package:adherence_admin/src/utils/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class DoctorPage extends StatelessWidget {
  final values = [
    false, // Sunday
    true, // Monday
    true, // Tuesday
    true, // Wednesday
    true, // Thursday
    true, // Friday
    false, // Saturday
  ];
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
            "Aayush Jain",
            style: Theme.of(context).textTheme.headline6.copyWith(),
          ),
          SizedBox(height: 5),
          Text(
            "Psychologist",
            style: Theme.of(context).textTheme.subtitle1.copyWith(),
          ),
          SizedBox(height: 15),
          _tableRow("Email", "jaayushmax@gmail.com"),
          _tableRow("Phone", "9810115481"),
          _tableRow("Available Days", "Mon-Wed, 9-5", isWeekVisible: true),
          _tableRow("Available Time", "9am-5pm"),
          _tableRow("Location", "Ruby Clinic"),
        ],
      ),
    );
  }

  Widget _tableRow(String title, String val, {bool isWeekVisible = false}) {
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
