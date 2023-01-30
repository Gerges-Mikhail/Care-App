import 'package:care/common/common.dart';
import 'package:care/database/sqflite.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/widgets/radiobtn.dart';
import 'package:care/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({Key? key}) : super(key: key);

  @override
  State<FormRequest> createState() => _FormRequestState();
}

class _FormRequestState extends State<FormRequest> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  SqlDatabase sqldb = SqlDatabase();
  @override
  void dispose() {
    dateCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Do you want to go back?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: darkblue,
          body: Stack(
            alignment: Alignment.topRight,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45, left: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Request an Appointment',
                                style: TextStyle(fontSize: 15, color: white),
                              ),
                              InkWell(
                                onTap: () async {
                                  final shouldPop = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                        const Text('Do you want to go back?'),
                                        actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const HomePage()),
                                              );
                                            },
                                            child: const Text('Yes'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No'),
                                          ),
                                        ],
                                      );
                                    },

                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back,
                                      color: white,
                                    ),
                                    Text(
                                      'Back',
                                      style:
                                      TextStyle(fontSize: 18, color: white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 400,
                        width: 385,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //ONLINE MEDICAL CONSENT FORM
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Online',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: darkblue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Request',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: darkblue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'an Appointment',
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: darkblue,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //START FORM
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 18, color: darkblue),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                EditTextUtils().getCustomEditTextArea(
                                  labelValue: '',
                                  controller: name,
                                  hintValue: 'Name',
                                  validation: true,
                                  keyboardType: TextInputType.text,
                                  validationErrorMsg: 'Please enter a valid name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Phone Number',
                                      style: TextStyle(
                                          fontSize: 18, color: darkblue),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                EditTextUtils().getCustomEditTextArea(
                                  controller: phone,
                                  hintValue: 'ex : 01111618689',
                                  validation: true,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 11,
                                  validationErrorMsg: 'Please enter a valid number',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First Time Visit ?",
                                      style: TextStyle(
                                          fontSize: 18, color: darkblue),
                                    )
                                  ],
                                ),
                                GroupRadioButton(
                                  label: [Text("Yes"), Text("No"),],
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  spaceBetween: 5,
                                  radioRadius: 10,
                                  color: darkblue,
                                  onChanged: (listIndex) {
                                    print(listIndex);
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select An Appointment Date ",
                                      style: TextStyle(
                                          fontSize: 18, color: darkblue),
                                    )
                                  ],
                                ),
                                EditTextUtils().getCustomEditTextArea(
                                  validation: true,
                                  controller: dateCtl,
                                  icon : Icons.calendar_today,
                                  keyboardType: TextInputType.number,
                                  validationErrorMsg: 'Please enter a valid date',
                                  onTap:() async {
                                    DateTime? date;
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    dateCtl.text =
                                        date!.toString().substring(0, 10);
                                  },
                                ),
                                Container(
                                  alignment: Alignment.center,
                                    child : ElevatedButton(
                                        onPressed: () async{
                                          if (_formKey.currentState!.validate()) {
                                            int response = await sqldb.InsertData("INSERT INTO 'request' ('name', 'phonenumber', 'date') VALUES ('${name.text}', '${phone.text}', '${dateCtl.text}')");
                                            print(response);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                        'Reservation successful'),
                                                    Icon(
                                                      Icons.check,
                                                      color: white,
                                                      size: 30,
                                                    ),
                                                  ],
                                                ),
                                                backgroundColor: Colors.green,
                                                duration:
                                                const Duration(milliseconds: 1500),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  children: [
                                                    const Text('There are some errors'),
                                                    Icon(
                                                      Icons.cancel,
                                                      color: white,
                                                      size: 30,
                                                    ),
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                const Duration(milliseconds: 1500),
                                              ),
                                            );
                                          }

                                          },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        18.0),
                                                    side: BorderSide(
                                                        color: green)))),
                                        child: Text(
                                          'SUBMIT',
                                          style: TextStyle(color: white),
                                        )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset('assets/icon.png', width: 100),
              ),
            ],
          ),),);
  }
}
