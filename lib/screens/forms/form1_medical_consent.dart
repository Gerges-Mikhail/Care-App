import 'package:care/common/common.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/widgets/contact_widgets.dart';
import 'package:care/widgets/gender.dart';
import 'package:care/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class MedicalForm extends StatefulWidget {
  const MedicalForm({Key? key}) : super(key: key);

  @override
  State<MedicalForm> createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  @override
  bool? ismale = true;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController cphonenumber1 = TextEditingController();
  TextEditingController cphonenumber2 = TextEditingController();
  TextEditingController dsigned = TextEditingController();
  TextEditingController _controllerBlood = TextEditingController();
  TextEditingController _controllerGlass = TextEditingController();

  @override
  void dispose() {
    dateCtl.dispose();
    phonenumber.dispose();
    cphonenumber1.dispose();
    cphonenumber2.dispose();
    dsigned.dispose();
    _controllerBlood.dispose();
    _controllerGlass.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var items = ['A', 'B', 'AB', 'O'];
  var items2 = [
    'yes',
    'no',
  ];

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
                              'Medical Consent Form',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Patient Information',
                              style: TextStyle(
                                color: green,
                                fontSize: 20,
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
                                        'Medical',
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
                                        'Consent Form',
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
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Name',
                                  hintValue: 'Enter Your Name',
                                  validation: true,
                                  keyboardType: TextInputType.text,
                                  validationErrorMsg: 'valid name'
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Age',
                                  hintValue: 'Enter Your Age',
                                  validation: true,
                                  keyboardType: TextInputType.number,
                                  validationErrorMsg: 'Please enter an age'
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Your Birthday',
                                  hintValue: 'Enter Your Birthday',
                                  validation: true,
                                  controller: dateCtl,
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
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          ismale = true;
                                        });
                                      },
                                      child: Gender(
                                          name: 'Male',
                                          icon: Icons.male_rounded,
                                          isSelected: ismale! ? true : false)),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        ismale = false;
                                      });
                                    },
                                    child: Gender(
                                        name: 'Female',
                                        icon: Icons.female_rounded,
                                        isSelected: ismale! ? false : true),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Email',
                                  hintValue: 'ex: name@gmail.com',
                                  validation: true,
                                  keyboardType: TextInputType.emailAddress,
                                  validationErrorMsg: 'Please enter an email'
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ) {
                                    return 'Please enter a valid number';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Phone Number',
                                  hintText: '01******689',
                                ),
                                maxLength: 11,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Address',
                                  hintValue: 'Enter your address',
                                  validation: true,
                                  keyboardType: TextInputType.streetAddress,
                                  validationErrorMsg: 'Please enter a valid address'
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Health Insurance Name',
                                  hintValue: 'Enter your Health Insurance Name',
                                  validation: true,
                                  keyboardType: TextInputType.text,
                                  validationErrorMsg: 'Please enter a valid health insurance name'
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(color: darkblue, thickness: 2.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Parent/Guardian or Emergency Contact Details',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18, color: darkblue),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                  labelValue: 'Name',
                                  hintValue: 'Enter the name',
                                  validation: true,
                                  keyboardType: TextInputType.text,
                                  validationErrorMsg: 'Please enter a valid name'
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ) {
                                    return 'Please enter a valid number';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Primary Phone Number',
                                  hintText: '01******689',
                                ),
                                maxLength: 11,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Secondary Phone Number',
                                  hintText: '01******689',
                                ),
                                maxLength: 11,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a blood type';
                                  }
                                  return null;
                                },
                                controller: _controllerBlood,
                                decoration: InputDecoration(
                                  labelText: 'Blood Type',
                                  hintText: 'Blood Type',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      _controllerBlood.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid answer';
                                  }
                                  return null;
                                },
                                controller: _controllerGlass,
                                decoration: InputDecoration(
                                  labelText:
                                      'Are you wearing glasses or contact lenses?',
                                  hintText:
                                      'Are you wearing glasses or contact lenses?',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      _controllerGlass.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items2.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return PopupMenuItem(
                                            value: value,
                                            child: Text(value));
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Are you vaccinated? \nIf yes, please list the vaccines you have \nreceived.',
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
                                  hintValue: '',
                                  validation: true,
                                  keyboardType: TextInputType.text,
                                  validationErrorMsg: 'Please enter a valid answer',
                                maxline: 6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Are you currently taking medications?\nIf yes, please list the medications \nand why are you taking them.',
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
                                hintValue: '',
                                validation: true,
                                keyboardType: TextInputType.text,
                                validationErrorMsg: 'Please enter a valid answer',
                                maxline: 6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'What is your current medical condition?\nDo you have any communicable\ndisease,cardiovascular problems, \ndiabetes, asthma etc.?',
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
                                hintValue: '',
                                validation: true,
                                keyboardType: TextInputType.text,
                                validationErrorMsg: 'Please enter a valid answer',
                                maxline: 6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EditTextUtils().getCustomEditTextArea(
                                labelValue: 'Date Signed',
                                hintValue: 'Date Signed',
                                controller: dsigned,
                                validation: true,
                                keyboardType: TextInputType.text,
                                validationErrorMsg: 'Please enter a date',
                                onTap: () async {
                                  DateTime? date;
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  dsigned.text =
                                      date!.toString().substring(0, 10);
                                },
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                      'Your submission has been sent'),
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
                                      ))
                                ],
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
              padding: const EdgeInsets.only(top: 55),
              child: Image.asset('assets/care2.png', width: 200),
            ),
          ],
        ),
      ),
    );
  }
}
