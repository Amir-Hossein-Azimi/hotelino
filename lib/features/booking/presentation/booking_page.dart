import 'package:Hotelino/features/booking/presentation/booking_provider.dart';
import 'package:Hotelino/features/booking/presentation/widgets/booking_form_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/date_picker_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/number_text_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/terms_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  static GlobalKey<BookingPageState> bookingPageKey =
      GlobalKey<BookingPageState>();

  //use key for super
  BookingPage({Key? key}) : super(key: bookingPageKey);

  @override
  State<BookingPage> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(const Duration(microseconds: 100), () {
      _formKey.currentState?.reset();
      TermsWidget.termsKey.currentState?.resetCheckbox();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "فرم رزرو هتل",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingFormField(
                      title: "نام و نام خانوادگی",
                      hint: "نام و نام خانوادگی خود را وارد کنید...",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "نام خود را کامل بنویسید ";
                        }
                        return null;
                      },
                      initialValue: bookingProvider.booking.fullName,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setName(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: "مقصد",
                      hint: "مقصد خود را وارد کنید...",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا مقصد خود را مشخص کنید";
                        }
                        return null;
                      },
                      initialValue: bookingProvider.booking.destination,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setDestination(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    DatePickerField(
                      title: 'تاریخ اقامت',
                      hint: 'بازه زمانی اقامت را مشخص کنید',
                      initialValue: bookingProvider.booking.checkInOutRangeData,
                      validator: (value) {
                        if (value == null) {
                          return 'لطفا بازه زمانی را مشخص کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setRangeDate(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: "تعداد نفرات",
                      hint: "تعداد نفرات خود را وارد کنید...",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا تعداد نفرات را مشخص کنید...";
                        }
                        return null;
                      },
                      initialValue: bookingProvider.booking.numberOfGuests,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setNumberOfGeusts(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    NumberFormField(
                      initialValue: bookingProvider.booking.phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "لطفا شماره تلفن را درست وارد کنید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setPhoneNumber(newValue);
                        }
                      },
                    ),
                    TermsWidget(
                      initialValue: false,
                      validator: (value) {
                        if (value == null || value==false) {
                          return ".لطفا قوانین را تایید کنید";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "درخواست رزرو با موفقیت ثبت شد.🎉",
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("جست و جوی هتل ها"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
