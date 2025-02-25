import 'package:car_ticket/controller/dashboard/customers.dart';
import 'package:car_ticket/presentation/widgets/dashboard/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            title: const Text('Users'),
            floating: true,
            snap: true,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 160,
            foregroundColor: Colors.white,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
            )),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: const Row(
                  children: [
                    Text('All Users',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              GetBuilder(
                  init: CustomersController(),
                  builder: (customersController) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customersController.customers.length,
                          itemBuilder: (context, index) {
                            return UserItem(
                              customer: customersController.customers[index],
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ],
    ));
  }
}
