// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone/config/themes/theme_colors.dart';
import 'package:instaclone/features/auth/data/utils/image_picker.dart';
import 'package:instaclone/widgets/text_fields.dart';
import '../../data/datasources/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  // clearing the cache and resource used in the text_fields
  @override
  void dispose() {
    super.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void addImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // this allow the widget to build from the bottom
              Flexible(
                child: Container(),
                flex: 1,
              ),
              // the instagram image showing at the bottom
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(
                            _image!,
                          ),
                          radius: 64,
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://image.shutterstock.com/image-vector/default-avatar-profile-icon-social-260nw-1913928688.jpg"),
                          radius: 64,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: addImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // username input text field using personal textfield configurations
              CustomTextInput(
                textEditingController: _usernameController,
                hintText: "Enter your username",
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ), // bio input text field using personal textfield configurations
              CustomTextInput(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              // email input text field using personal textfield configurations
              CustomTextInput(
                textEditingController: _emailController,
                hintText: "Enter your Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              // password input text field using personal textfield configurations
              CustomTextInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // Button used for login
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _usernameController.text,
                    bio: _bioController.text,
                    file: _image!,
                  );
                  print(res);
                },
                child: Container(
                  child: const Text("Sign Up"),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              // Sign up Transition
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  GestureDetector(
                    child: Container(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
}
