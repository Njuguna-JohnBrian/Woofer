import 'package:flutter/material.dart';

import '../../button.dart';
import '../../nav_bar.dart';
import '../signup/components/input_field.dart';

enum ProfileTitles { mr, mrs, miss }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileFormKey = GlobalKey<FormState>();
  ProfileTitles? _profileTitles = ProfileTitles.mr;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _deliveryAddress1Controller =
      TextEditingController();
  final TextEditingController _deliveryAddress2Controller =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _lastNameController.dispose();
    _nationalityController.dispose();
    _nationalityController.dispose();
    _deliveryAddress1Controller.dispose();
    _deliveryAddress2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _profileFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Your Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "You can edit your details here",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _firstNameController,
                  textInputType: TextInputType.text,
                  iconData: Icons.keyboard,
                  labelText: "First Name",
                  hintText: "Ian",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _lastNameController,
                  textInputType: TextInputType.text,
                  iconData: Icons.keyboard,
                  labelText: "Last Name",
                  hintText: "Duncan",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _phoneNoController,
                  textInputType: TextInputType.phone,
                  iconData: Icons.phone_enabled,
                  labelText: "Phone Number",
                  hintText: "+254 123 456 678",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  iconData: Icons.email,
                  labelText: "Email Address",
                  hintText: "ianduncan@gmail.com",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _nationalityController,
                  textInputType: TextInputType.text,
                  iconData: Icons.flag,
                  labelText: "Nationality",
                  hintText: "Kenyan",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _deliveryAddress1Controller,
                  textInputType: TextInputType.streetAddress,
                  iconData: Icons.local_post_office_rounded,
                  labelText: "Delivery Address 1",
                  hintText: "234, Nairobi",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputFieldComponent(
                  textEditingController: _deliveryAddress2Controller,
                  textInputType: TextInputType.text,
                  iconData: Icons.keyboard,
                  labelText: "Delivery Address 2",
                  hintText: "244, Nairobi",
                  showIcon: false,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Please not that all service providers have a \n verification badge at the top right \n of their profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ReusableButton(
                  voidCallbackFunction: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NavScreen(),
                      ),
                    ),
                  },
                  buttonText: "SAVE",
                  buttonStyle: TextButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF643B09,
                    ),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButtons() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          RadioListTile(
            value: ProfileTitles.mr,
            groupValue: _profileTitles,
            onChanged: (value) {
              setState(() {
                _profileTitles = value.toString() as ProfileTitles?;
              });
            },
          )
        ],
      ),
    );
  }
}
