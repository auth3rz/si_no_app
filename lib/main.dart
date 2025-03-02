import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/config/theme/app_theme.dart';
import 'package:si_no_app/presentation/providers/chat_provider.dart';
import 'package:si_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        title: 'Yes No App',
        home: const ChatScreen()
      ),
    );
  }
}