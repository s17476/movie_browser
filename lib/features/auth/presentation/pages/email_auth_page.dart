import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_browser/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:movie_browser/features/auth/presentation/cubits/email_provider/email_provider_cubit.dart';
import 'package:movie_browser/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movie_browser/features/auth/presentation/widgets/reset_password_text_button.dart';
import 'package:movie_browser/features/core/utils/show_snack_bar.dart';

class EmailAuthPage extends StatefulWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

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
              context.pop();
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // email text field
                CustomTextFormField(
                  textEditingController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  labelText: 'E-mail',
                  prefixIcon: const Icon(Icons.person),
                  key: const ValueKey('email'),
                ),
                const SizedBox(
                  height: 16,
                ),
                // password text field
                CustomTextFormField(
                  textEditingController: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: _isInLoginMode
                      ? TextInputAction.done
                      : TextInputAction.next,
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_rounded),
                  obscureText: !_passwordIsVisible,
                  onEditingComplete: _isInLoginMode ? _tryToSubmit : null,
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: _passwordIsVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  key: const ValueKey('password'),
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
                        CustomTextFormField(
                          textEditingController: _repeatPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          labelText: 'Repeat password',
                          prefixIcon: const Icon(Icons.lock_rounded),
                          obscureText: !_passwordIsVisible,
                          onEditingComplete: _tryToSubmit,
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: _passwordIsVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          key: const ValueKey('password-repeat'),
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
                          width: 500,
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

                if (_failureCounter > 2)
                  ResetPasswordTextButton(slideAnimation: _slideAnimation),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
