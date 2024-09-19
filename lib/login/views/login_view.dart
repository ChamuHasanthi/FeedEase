import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:feeding_application/shared/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNameController = TextEditingController(text: 'test1');
  TextEditingController passwordController = TextEditingController( text: 'testPassword2');
  final ScrollController _scrollController = ScrollController();

  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with the registration process

      final String userName = userNameController.text.trim();
      final String password = passwordController.text.trim();

      // You can now use these values to send to your backend or further processing.
      // For example, you could call an API or use a bloc event.

      print('Username: $userName');
      print('Password: $password');

      // Show a success message or navigate to another screen.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: const Text('Sign in Successful')),
      );

      // Clear the form if needed
      _formKey.currentState!.reset();

      context.push('/jobs');
    } else {
      // Form is invalid, show error messages
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Sign-In',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.deepBlue),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 250,
                  child: Image(
                    image: AssetImage('lib/assets/images/login.jpg'),
                    color: AppColors.deepBlue,
                    colorBlendMode: BlendMode.color,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInputField(
                        controller: userNameController,
                        labelName: 'User Name',
                        focusNode: _userNameFocusNode,
                        nextFocusNode: _passwordFocusNode,
                        hintText: 'Enter your username',
                        validatorFucntion: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      CustomInputField(
                        controller: passwordController,
                        labelName: 'Password',
                        focusNode: _passwordFocusNode,
                        hintText: 'Enter your password',
                        validatorFucntion: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.slateGray),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sign in',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Don\'t have an account ?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.deepBlue),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                AppColors.lightSteelBlue),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
