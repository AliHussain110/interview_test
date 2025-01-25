import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speedforce_interview/common/loadingscreen.dart';
import '../../common/loginoptions.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme_style.dart';
import '../../utils/customsizeboxes.dart';
import '../../common/botton_widget.dart';
import '../../common/search_widget.dart';
import '../../provider/auth_provider.dart';
import '../../provider/user_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  bool _hidePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.clear();
    _emailController.clear();
    _passwordFocusNode.dispose();
    // _formKey.
    super.dispose();
  }

  void _onSubmitted(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      log('showing Loader');
      setState(() {
        _isLoading = true;
      });
      ref
          .read(loginProvider({
        'email': _emailController.text,
        'password': _passwordController.text,
        'value': _rememberMe,
      }).future)
          .then((user) {
        ref.read(userProvider.notifier).setUser(user);

        log('user Log in ${user.firstName}');
        log('Loader off');
        setState(() {
          _isLoading = false;
        });
        context.go('/home');
      }).catchError((error) {
        log('Loader off');
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${error.toString()}')),
        );
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 0.05.sh),
              _buildBackButton(),
              AppSpaces.largeHeight(),
              _buildLogo(),
              AppSpaces.largeHeight(),
              _buildWelcomeText(),
              AppSpaces.largeHeight(height: 25),
              _buildLoginForm(),
              _buildRememberMeCheckbox(),
              _buildLoginButton(),
              _buildForgotPasswordText(),
              AppSpaces.largeHeight(height: 20),
              LoginOptionWidget(),
              AppSpaces.largeHeight(height: 30),
              _buildSignUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Container(
      alignment: Alignment.centerLeft,
      width: 1.0.sw,
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 25.w),
        onPressed: () {},
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      width: 1.0.sw,
      child: Image.asset(
        'assets/images/mainLogo.jpg',
        width: 334.w,
        height: 110.h,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      'Welcome Back',
      style: AppTextStyles.urbanistBold(),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailField(),
          AppSpaces.mediumHeight(),
          _buildPasswordField(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return SearchWidget(
      prefixIcon: Icon(
        Icons.email,
        color: AppColors.secondaryTextColor,
        size: 25.w,
      ),
      validation: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },
      controller: _emailController,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      onChangeFunction: (_) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
    );
  }

  Widget _buildPasswordField() {
    return SearchWidget(
      foucsnode: _passwordFocusNode,
      onChangeFunction: (_) {
        _onSubmitted(context);
      },
      prefixIcon: Icon(
        Icons.lock,
        size: 25.w,
        color: AppColors.secondaryTextColor,
      ),
      validation: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      controller: _passwordController,
      hintText: 'Password',
      password: _hidePassword,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: Icon(
          _hidePassword ? Icons.visibility_off : Icons.visibility,
          size: 25.w,
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value ?? false;
            });
          },
          focusColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: Colors.red,
            width: 3,
          ),
        ),
        Text(
          'Remember Me',
          style: AppTextStyles.urbanistMediumBold(),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ButtonWidget(
      width: 1.0.sw,
      title: 'Log in',
      onTap: () {
        _onSubmitted(context);
      },
    );
  }

  Widget _buildForgotPasswordText() {
    return Text(
      'Forgot the password?',
      style: AppTextStyles.urbanistLargeBold(),
    );
  }

  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTextStyles.urbanistRegular(
            color: AppColors.inputFeildColor,
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            // Navigate to signup screen
            context.go('/signup');
          },
          child: Text(
            'Sign up',
            style: AppTextStyles.urbanistRegular(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
