import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/show_snack_bar.dart';
import '../blocs/bloc/auth_bloc.dart';
import '../cubits/email_provider/email_provider_cubit.dart';

class EmailAuthPage extends StatefulWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

  static const routeName = '/authentication';

  @override
  State<EmailAuthPage> createState() => _EmailAuthPageState();
}

class _EmailAuthPageState extends State<EmailAuthPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _passwordIsVisible = false;

  bool _isInLoginMode = true;

  int _failureCounter = 0;

  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    //initialize animations controllers
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.3),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordIsVisible = !_passwordIsVisible;
    });
  }

  void _toggleLoginMode() {
    setState(() {
      _isInLoginMode = !_isInLoginMode;
    });
    if (!_isInLoginMode) {
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
  }

  void _tryToSubmit() {
    FocusScope.of(context).unfocus();
    if (!_isInLoginMode) {
      if (_passwordController.text != _repeatPasswordController.text) {
        showSnackBar(
          context: context,
          message: 'The password and repeat password fields must be identical',
          isErrorMessage: true,
        );
      } else {
        context.read<EmailProviderCubit>().signupWithEmailAndPassword(
              _emailController.text,
              _passwordController.text,
            );
      }
    } else {
      context.read<EmailProviderCubit>().signinWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          state.mapOrNull(
            authenticated: (state) {
              showSnackBar(context: context, message: 'Successfully logged in');
              Navigator.pop(context);
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // email text field
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      controller: _emailController,
                      key: const ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        floatingLabelStyle: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                        labelText: 'E-mail',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // password text field
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      controller: _passwordController,
                      key: const ValueKey('password'),
                      obscureText: !_passwordIsVisible,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordVisibility,
                          icon: _passwordIsVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock_rounded),
                        floatingLabelStyle: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                      onEditingComplete: _tryToSubmit,
                    ),
                  ),
                ),
                // repeat password
                FadeTransition(
                  opacity: _opacityAnimation!,
                  child: SlideTransition(
                    position: _slideAnimation!,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: SizedBox(
                            width: 500,
                            child: TextFormField(
                              enabled: !_isInLoginMode,
                              controller: _repeatPasswordController,
                              key: const ValueKey('password'),
                              obscureText: !_passwordIsVisible,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _togglePasswordVisibility,
                                  icon: _passwordIsVisible
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                ),
                                prefixIcon: const Icon(Icons.lock_rounded),
                                floatingLabelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                ),
                                labelText: 'Repeat password',
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                              ),
                              onEditingComplete: _tryToSubmit,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SlideTransition(
                  position: _slideAnimation!,
                  child: const SizedBox(
                    height: 32,
                  ),
                ),
                // login button
                SlideTransition(
                  position: _slideAnimation!,
                  child: BlocConsumer<EmailProviderCubit, EmailProviderState>(
                    listener: (context, state) {
                      state.mapOrNull(error: (state) {
                        showSnackBar(
                          context: context,
                          message: state.message,
                          isErrorMessage: true,
                        );

                        if (_isInLoginMode) {
                          setState(() {
                            _failureCounter++;
                          });
                        }
                      });
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.maybeMap(
                              submitting: (_) => () {},
                              orElse: () => _tryToSubmit,
                            ),
                            child: state.maybeMap(
                              submitting: (_) => const Padding(
                                padding: EdgeInsets.all(2),
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              orElse: () => _isInLoginMode
                                  ? const Text(
                                      'Signin',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  : const Text(
                                      'Signup',
                                      style: TextStyle(fontSize: 16),
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation!,
                  child: const SizedBox(
                    height: 8,
                  ),
                ),
                // signin - signup button
                SlideTransition(
                  position: _slideAnimation!,
                  child: TextButton(
                    onPressed: _toggleLoginMode,
                    child: _isInLoginMode
                        ? const Text('Create new account')
                        : const Text('I aleready have an account'),
                  ),
                ),

                // if (_failureCounter > 2)
                //   ResetPasswordTextButton(slideAnimation: _slideAnimation),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
