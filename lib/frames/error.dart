import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.blue,
              size: 160,
            ),
            Text(
              'Ошибка',
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 12, 0, 0),
              child: Text(
                'Неверный логин или пароль',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
