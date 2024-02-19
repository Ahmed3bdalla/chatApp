import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talku_app/pages/Cubits/Chat_Cubit/Chat_Cubit.dart';
import 'package:talku_app/pages/Cubits/Login_Cubit/Login_Cubit.dart';
import 'package:talku_app/pages/Cubits/Register_Cubit/Register_Cubit.dart';
import 'package:talku_app/pages/chat_page.dart';
import 'package:talku_app/pages/login_page.dart';
import 'package:talku_app/pages/resgister_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
      BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
    ],
    child: const ScholarChat(),
  ));
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id: (context) => ChatPage()
      },
      initialRoute: LoginPage.id,
    );
  }
}
