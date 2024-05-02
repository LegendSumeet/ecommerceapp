

import 'package:ecommerceapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_orders/my_orders_screen.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // StreamBuilder<User>(
          //     stream: AuthentificationService().userChanges,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         final user = snapshot.data;
          //         return buildUserAccountsHeader(user);
          //       } else if (snapshot.connectionState ==
          //           ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         return Center(
          //           child: Icon(Icons.error),
          //         );
          //       }
          //     }),
          buildEditAccountExpansionTile(context),
          ListTile(
            leading: const Icon(Icons.edit_location),
            title: const Text(
              "Manage Addresses",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {

            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_location),
            title: const Text(
              "My Orders",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {
              Get.to(() => MyOrdersScreen());

            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              "About Developer",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {

            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Sign out",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {

            },
          ),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsHeader() {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.15),
      ),
      accountEmail: const Text(
         "No Email",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      accountName: const Text(
         "No Name",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),

    );
  }

  ExpansionTile buildEditAccountExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.person),
      title: const Text(
        "Edit Account",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      children: [
        ListTile(
          title: const Text(
            "Change Display Picture",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {

          },
        ),
        ListTile(
          title: const Text(
            "Change Display Name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {

          },
        ),
        ListTile(
          title: const Text(
            "Change Phone Number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {

          },
        ),
        ListTile(
          title: const Text(
            "Change Email",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {

          },
        ),
        ListTile(
          title: const Text(
            "Change Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () {

          },
        ),
      ],
    );
  }

  Widget buildSellerExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.business),
      title: const Text(
        "I am Seller",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      children: [
        ListTile(
          title: const Text(
            "Add New Product",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {},
        ),
        ListTile(
          title: const Text(
            "Manage My Products.dart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {

          },
        ),
      ],
    );
  }
}
