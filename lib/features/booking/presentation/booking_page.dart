import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(const Duration(microseconds: 100) ,
     () {
       _formKey.currentState?.reset();
       setState(() {
         
       });
     }, 
     );
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}