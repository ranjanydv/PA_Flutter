import '../../../constants/consts.dart';
import '../../../controller/auth_controller.dart';
import '../../home/screens/home.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_form_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/auth';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInKey = GlobalKey<FormState>();

  // text controllers
  final _emailAddressController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _hidePassword = true;

  var controller = Get.put(AuthController());

  // final AuthService authService = AuthService();
  // final SignInService _signInService = SignInService();

  @override
  void dispose() {
    super.dispose();
    _emailAddressController.dispose();
    _passwordTextController.dispose();
  }

  // void signInUser() {
  //   if (_signInKey.currentState!.validate()) {
  //     authService.signInUser(
  //       context: context,
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
                children: <Widget>[
                  Text(
                    'Login,',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Beyno',
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _signInKey,
                    child: Column(
                      children: [
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
                        CustomButton(
                          buttonText: "Login",
                          onPressed: () async {
                            try {
                              var loginResult = await controller.loginMethod(
                                email: _emailAddressController.text,
                                password: _passwordTextController.text,
                                context: context,
                              );
                              // Check if the login was successful
                              if (loginResult != null) {
                                controller.getUserDetailsByEmail(context, _emailAddressController.text);
                                Get.offAll(
                                  () => const Home(),
                                  transition: Transition.fadeIn,
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 400),
                                );
                              } else {
                                debugPrint("login failed");
                              }
                              // await controller
                              //     .loginMethod(
                              //         email: _emailAddressController.text,
                              //         password: _passwordTextController.text,
                              //         context: context)
                              //     .then((value) {
                              //   // if (value != null) {
                              //     controller.getUserDetailsByEmail(context, _emailAddressController.text);
                              //     Get.offAll(
                              //       () => const Home(),
                              //       transition: Transition.fadeIn,
                              //       curve: Curves.easeIn,
                              //       duration: const Duration(milliseconds: 400),
                              //     );
                              // }
                              // });
                            } catch (e) {
                              debugPrint(e.toString());
                              showSnackBar(
                                context: context,
                                // message: "An Error Occurred",
                                message: e.toString(),
                                snackbarColor: Colors.red,
                              );
                            }

                            // if (_signInKey.currentState!.validate()) {
                            //   signInUser();
                            // }
                          },
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {
                      debugPrint('Button-ForgotPassword pressed ...');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            debugPrint('Button-CreateAccount pressed ...');
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //     builder: (context) => const RegisterScreen(),
                            //   ),
                            // );
                            Get.offAll(
                              () => const RegisterScreen(),
                              transition: Transition.fadeIn,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 200),
                            );
                          },
                          child: const Text(
                            'Create Account',
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
