import 'package:car_ticket/domain/models/user/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final MyUser customer;

  const UserItem({required this.customer, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(customer.name),
              subtitle: Text(customer.email),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {
            //           Get.toNamed(
            //             UserDashboardProfileScreen.routeName,
            //             arguments: customer,
            //           );
            //         },
            //         child: const Text('View Profile'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
