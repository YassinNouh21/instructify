import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';

class ListOfSigInButtons extends StatelessWidget {
  const ListOfSigInButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppMainButton(
          onPressed: () {},
          text: 'Sign In with Facebook',
          icon: Icons.facebook,
        ),
        const SizedBox(height: SizeManager.s12),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.state == AuthenticationStates.authenticated) {
              Navigator.of(context).pushNamed(Routes.mainRoute);
            }
          },
          child: AppMainButton(
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenicationSignInWithGoogle());
            },
            text: 'Sign In with Google',
            icon: FontAwesomeIcons.google,
          ),
        ),
        const SizedBox(height: SizeManager.s12),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.choosePositionRoute);
          },
          child: const Text('Create an Account'),
        ),
      ],
    );
  }
}
