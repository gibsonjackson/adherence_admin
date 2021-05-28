import 'package:adherence_admin/src/features/home/presentation/widgets/cards/doctors_card.dart';
import 'package:flutter/material.dart';

class HomepageLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return DoctorsCard();
      },
    );
  }
}
