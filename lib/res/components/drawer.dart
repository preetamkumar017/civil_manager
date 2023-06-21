import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  UserViewModel userViewModel = UserViewModel();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          FutureBuilder(
            future: userViewModel.getUser() ,
            builder: (context, snapshot) {
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green
                ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("https://ukcdesigner.in/android/images/avatar.png",scale: 0.5),
                  ),
                  accountName: Text(
                    snapshot.data!.userName ?? "",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(224, 255, 255, 255)),
                  ),
                  accountEmail: Text(snapshot.data!.email ??  "",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(224, 255, 255, 255))));
            }
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 111, 115, 116),
            ),
            onTap: (() {
              Get.toNamed(RoutesName.profile_view);
            }),
            title: const Text(
              "My Profile",
            ),
          ),

          const Divider(
            thickness: 2.0,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 111, 115, 116),
            ),
            onTap: () async {
              if(await userViewModel.remove())
              {
              Get.offAllNamed(RoutesName.login_view);
              }
            },
            title: const Text(
              "Log Out",
            ),
          ),
        ],
      ),
    );
  }
}
