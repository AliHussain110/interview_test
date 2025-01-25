import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speedforce_interview/common/loginoptions.dart';
import 'package:speedforce_interview/theme/colors.dart';
import 'package:speedforce_interview/theme/text_theme_style.dart';
import 'package:speedforce_interview/utils/customsizeboxes.dart';
import '../../common/botton_widget.dart';
import '../../common/search_widget.dart';
import '../../provider/auth_provider.dart';
import '../../provider/user_provider.dart';

class SignupPageScreen extends ConsumerStatefulWidget {
  const SignupPageScreen({super.key});

  @override
  _SignupPageScreenState createState() => _SignupPageScreenState();
}

class _SignupPageScreenState extends ConsumerState<SignupPageScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPaswordController = TextEditingController();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _cpasswordFocusNode = FocusNode();
  String? _selectedGender;

  bool switchProvider = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  void _onSubmitted() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      log('Navigating to Home Page');
      ref.read(fetchProvider({}).future).then((user) {
        if (mounted) {
          context.go('/home');
        }
        ref.read(userProvider.notifier).setUser(user);

        log('user Log in ${user.firstName}');
      }).catchError(
        (error) {
          if (mounted) {
            context.go('/');
          }
        },
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.clear();
    _emailController.clear();
    _passwordFocusNode.dispose();
    // _formKey.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25).w,
        child: Column(
          children: [
            SizedBox(height: 0.05.sh),
            Container(
              alignment: Alignment.centerLeft,
              width: 1.0.sw,
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 25.w,
                  ),
                  Text(
                    'Create Account',
                    style: AppTextStyles.urbanistExraLargeBold(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            AppSpaces.largeHeight(),
            serviceProviderOption(),
            AppSpaces.largeHeight(height: 20),
            formWidget(),
            AppSpaces.largeHeight(),
            privacyPolicy(),
            AppSpaces.largeHeight(),
            ButtonWidget(
              width: 1.0.sw,
              title: 'Sign Up',
              onTap: _onSubmitted,
            ),
            AppSpaces.largeHeight(),
            loginAccountOption(),
            AppSpaces.largeHeight(),
            LoginOptionWidget(),
            AppSpaces.largeHeight(height: 30),
          ],
        ),
      ),
    );
  }

  Container serviceProviderOption() {
    return Container(
      width: 1.0.sw,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Shadow offset
          ),
        ],
        color: AppColors.backgroundColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                switchProvider = !switchProvider;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: switchProvider
                      ? AppColors.primaryColor
                      : AppColors.backgroundColor),
              width: 0.443.sw,
              child: Text(
                'Consumer',
                style: AppTextStyles.urbanistBold(
                  fontSize: 20,
                  color: switchProvider
                      ? AppColors.backgroundColor
                      : AppColors.primaryColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                switchProvider = !switchProvider;
              });
            },
            child: Container(
              width: 0.44.sw,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: switchProvider
                    ? AppColors.backgroundColor
                    : AppColors.primaryColor,
              ),
              child: Text(
                'Service Provider',
                style: AppTextStyles.urbanistBold(
                    fontSize: 20,
                    color: switchProvider
                        ? AppColors.primaryColor
                        : AppColors.backgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row loginAccountOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          'Already Have an account?',
          style: AppTextStyles.urbanistRegular(
            color: AppColors.inputFeildColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            log('going back to login screen');
            context.go('/login');
          },
          child: Text(
            'Log in',
            style: AppTextStyles.urbanistRegular(
              color: AppColors.iconColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  RichText privacyPolicy() {
    return RichText(
      text: TextSpan(
        text: 'By continuing you agree to our',
        style: AppTextStyles.urbanistLargeBold(
          color: AppColors.inputFeildColor,
        ),
        children: [
          TextSpan(
            text: ' Terms of Service ',
            style: AppTextStyles.urbanistLargeBold(
              color: AppColors.secondaryTextColor,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: AppTextStyles.urbanistLargeBold(
              color: AppColors.inputFeildColor,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: AppTextStyles.urbanistLargeBold(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Form formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SearchWidget(
            // prefixIcon: Icon(
            //   Icons.email,
            //   color: AppColors.secondaryTextColor,
            //   size: 25.w,
            // ),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name is required';
              }

              return null; // No error
            },
            controller: _nameController,
            hintText: 'First Name',
            keyboardType: TextInputType.name,
            onChangeFunction: (_) {
              FocusScope.of(context).requestFocus(_lastNameFocusNode);
            },
          ),
          AppSpaces.mediumHeight(),
          SearchWidget(
            // prefixIcon: Icon(
            //   Icons.email,
            //   color: AppColors.secondaryTextColor,
            //   size: 25.w,
            // ),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Last Name is required';
              }

              return null; // No error
            },
            controller: _lastnameController,
            hintText: 'Last Name',
            keyboardType: TextInputType.name,
            foucsnode: _lastNameFocusNode,
            onChangeFunction: (_) {
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
          ),
          AppSpaces.mediumHeight(),
          SearchWidget(
            // prefixIcon: Icon(
            //   Icons.email,
            //   color: AppColors.secondaryTextColor,
            //   size: 25.w,
            // ),
            foucsnode: _emailFocusNode,
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              // Regex for email validation
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null; // No error
            },
            controller: _emailController,
            suffixIcon: Icon(
              Icons.email_outlined,
              color: AppColors.buttonColor,
              size: 25.w,
            ),
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChangeFunction: (_) {
              FocusScope.of(context).unfocus();
            },
          ),
          AppSpaces.mediumHeight(),
          DropdownButtonFormField<String>(
            value: _selectedGender,

            items: ['Male', 'Female']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppTextStyles.urbanistRegular(
                          color: AppColors.inputFeildColor,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Gender is required';
              }

              return null; // No error
            },
            onChanged: (value) {
              setState(() {
                _selectedGender = value; // Update the selected gender
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFeildColor2,
              hintText: 'Gender',
              hintStyle: AppTextStyles.urbanistRegular(
                color: AppColors.inputFeildColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8).w,
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8).w,
                borderSide: BorderSide.none,
              ),
            ),
            style: AppTextStyles.urbanistRegular(
              // Apply the same TextStyle here
              color: AppColors.inputFeildColor,
            ),
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 25.w,
              color: AppColors.buttonColor,
            ),

            // dropdownColor: AppColors.inputFeildColor2, // Optional: Match dropdown background
          ),
          AppSpaces.mediumHeight(),
          SearchWidget(
            prefixIcon: _buildFlagDropdown(),
            value: true,
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone Number is required';
              }
              // Regex for email validation

              return null; // No error
            },
            controller: _phonenumberController,
            hintText: 'Phone Number',
            keyboardType: TextInputType.number,
            onChangeFunction: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          AppSpaces.mediumHeight(),
          SearchWidget(
            // prefixIcon: Icon(
            //   Icons.email,
            //   color: AppColors.secondaryTextColor,
            //   size: 25.w,
            // ),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              // Regex for at least one uppercase, one lowercase, one number, and one special character
              final passwordRegex = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
              if (!passwordRegex.hasMatch(value)) {
                return 'Password must include uppercase, lowercase, number, and special character';
              }
              return null; // No error
            },

            controller: _passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.text,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? Icons.lock_open_outlined : Icons.lock_outline,
                size: 25.w,
                color: AppColors.buttonColor,
              ),
            ),
            password: showPassword,
            foucsnode: _passwordFocusNode,
            onChangeFunction: (_) {
              FocusScope.of(context).requestFocus(_cpasswordFocusNode);
            },
          ),
          AppSpaces.mediumHeight(),
          SearchWidget(
            // prefixIcon: Icon(
            //   Icons.email,
            //   color: AppColors.secondaryTextColor,
            //   size: 25.w,
            // ),
            password: showConfirmPassword,
            foucsnode: _cpasswordFocusNode,
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm Password is required';
              }
              if (value != _passwordController.text) {
                return 'Password doesn\'t match';
              }
              // Regex for at least one uppercase, one lowercase, one number, and one special character

              return null; // No error
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  showConfirmPassword = !showConfirmPassword;
                });
              },
              child: Icon(
                showConfirmPassword
                    ? Icons.lock_open_outlined
                    : Icons.lock_outline,
                size: 25.w,
                color: AppColors.buttonColor,
              ),
            ),
            controller: _cPaswordController,
            hintText: 'Confirm Password',
            keyboardType: TextInputType.text,
            onChangeFunction: (_) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          AppSpaces.mediumHeight(),
        ],
      ),
    );
  }

  Widget _buildFlagDropdown() {
    return SizedBox(
      width: 60.w,
      child: DropdownButton<String>(
        isExpanded: true,
        value: _selectedFlag,
        onChanged: (String? newValue) {
          setState(() {
            _selectedFlag = newValue!;
          });
        },
        items: _flags.entries.map((MapEntry<String, String> entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Image.asset(
                  entry.value,
                  height: 20.h,
                  width: 26.w,
                ),
                SizedBox(width: 8.w),
                Text(entry.key), // Show country code (e.g., US, PK, UK)
              ],
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return _flags.entries.map((MapEntry<String, String> entry) {
            return Center(
              child: Image.asset(
                entry.value,
                height: 20.h,
                width: 26.w,
              ),
            );
          }).toList();
        },
        underline: SizedBox(), // Remove the default underline
      ),
    );
  }

  String _selectedFlag = '+1'; // Default flag

  final Map<String, String> _flags = {
    '+1': 'assets/images/US.png',
    '+92': 'assets/images/US.png',
    '+44': 'assets/images/US.png',
  };
}
