import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.email_outlined),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  controller: widget.emailController,
                  autocorrect: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      label: Text(" E-mail ..."),
                      border: InputBorder.none,
                      errorStyle: TextStyle(

                          fontSize: 0,
                          height: 0,
                          decoration: TextDecoration.lineThrough

                      )
                  ),
                  validator: (text) {
                    final txt = text;
                    validateEmail(txt!);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            )
          ],
        ));
  }

  String? validateEmail(String text) {
    if (text == null || text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }
}