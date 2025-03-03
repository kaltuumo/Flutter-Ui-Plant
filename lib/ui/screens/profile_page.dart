import 'package:flutter/material.dart';
import 'package:flutter_ui_plant/ui/screens/signin_page.dart';
import 'package:flutter_ui_plant/ui/screens/widgets/profile_widget.dart';
import 'package:flutter_ui_plant/utilities/constants.dart';
import 'package:get/get.dart'; // For GetX navigation

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Image.asset("assets/images/verified.png"),
                    ),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(color: Constants.blackColor.withOpacity(.3)),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(icon: Icons.person, title: 'My Profile'),
                  ProfileWidget(icon: Icons.settings, title: 'Settings'),
                  ProfileWidget(
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                  ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                  ProfileWidget(icon: Icons.share, title: 'Share'),
                  GestureDetector(
                    onTap: () {
                      // Handle the Log Out action
                      _logOut(context);
                    },
                    child: const ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Log out function
  void _logOut(BuildContext context) {
    // Clear user session (example: if using GetStorage or SharedPreferences, clear data here)
    // Example (if using GetStorage or SharedPreferences):
    // GetStorage().remove('user_token');

    // Navigate to the Login Page
    Get.offAll(
      () => const SigninPage(),
    ); // Correctly reference the capitalized class name
  }
}
