import 'package:pa_mobile/controller/auth_controller.dart';

import '../../home/screens/home.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_form_field.dart';
import '../../../constants/consts.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _signUpKey = GlobalKey<FormState>();

  // text controllers
  final _nameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _hidePassword = true;
  var controller = Get.put(AuthController());

  // final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailAddressController.dispose();
    _passwordTextController.dispose();
  }

  // void signUpUser() {
  //   if (_signUpKey.currentState!.validate()) {
  //     authService.registerUser(
  //       context: context,
  //       name: _nameController.text,
  //       email: _emailAddressController.text,
  //       password: _passwordTextController.text,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Premiere ',
                style: TextStyle(
                  fontFamily: 'Beyno',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Auctioneers',
                style: TextStyle(
                  fontFamily: 'Beyno',
                ),
              ),
            ],
          ),
          elevation: 5,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: kPaddingHome,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontFamily: 'Beyno',
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _signUpKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textFieldController: _nameController,
                          labelText: "Name",
                          hintText: "Enter your name",
                          keyboardType: TextInputType.text,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          textFieldController: _emailAddressController,
                          hintText: "Enter your email",
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          textFieldController: _passwordTextController,
                          labelText: "Password",
                          hintText: "Enter your password",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _hidePassword,
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _hidePassword = !_hidePassword,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: const Color(0xFF95A1AC),
                              size: 22,
                            ),
                          ),
                        ),

                        // Register Button
                        CustomButton(
                          buttonText: "Register",
                          onPressed: () async {
                            try {
                              await controller
                                  .signupMethod(
                                      context: context,
                                      email: _emailAddressController.text,
                                      password: _passwordTextController.text)
                                  .then((value) {
                                return controller
                                    .storeUserData(
                                  name: _nameController.text,
                                  email: _emailAddressController.text,
                                  password: _passwordTextController.text,
                                )
                                    .then((val) {
                                  showSnackBar(
                                    context: context,
                                    message: "Welcome ${_nameController.text}",
                                    snackbarColor: Colors.green
                                  );
                                  Get.offAll(
                                    () => const Home(),
                                    transition: Transition.fadeIn,
                                    curve: Curves.easeIn,
                                    duration: const Duration(milliseconds: 200),
                                  );
                                });
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                            }

                            // if (_signUpKey.currentState!.validate()) {

                            // }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Already a member?',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            debugPrint('Button-Login pressed ...');
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login Here',
                            style: TextStyle(
                              color: Color(0xFF2DAD9E),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
