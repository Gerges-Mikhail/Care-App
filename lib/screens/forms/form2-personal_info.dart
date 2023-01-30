import 'package:care/common/common.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/widgets/diseases.dart';
import 'package:care/widgets/radiobtn.dart';
import 'package:care/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class FormMedicalHistory extends StatefulWidget {
  const FormMedicalHistory({Key? key}) : super(key: key);

  @override
  State<FormMedicalHistory> createState() => _FormMedicalHistoryState();
}

class _FormMedicalHistoryState extends State<FormMedicalHistory> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _controllerGender = TextEditingController();
  var items1 = [
    'Male',
    'Female',
  ];
  @override
  void dispose() {
    _controllerGender.dispose();
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
                        'Medical History Form',
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
                        'Patient Medical History',
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
                                  'History Form',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Patient Gender',
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
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
                          controller: _controllerGender,
                          decoration: InputDecoration(
                            labelText: '',
                            hintText: '',
                            border: const OutlineInputBorder(),
                            suffixIcon: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (String value) {
                                _controllerGender.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return items1.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return PopupMenuItem(
                                          child: Text(value),
                                          value: value);
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
                              "Patient Height (cm's)",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            labelValue: 'ex : 170',
                            hintValue: 'ex : 170',
                            validation: true,
                            keyboardType: TextInputType.number,
                            validationErrorMsg: 'Please enter a valid number'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Patient Weight  (kg's)",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            labelValue: 'ex : 70',
                            hintValue: 'ex : 70',
                            validation: true,
                            keyboardType: TextInputType.number,
                            validationErrorMsg: 'Please enter a valid number'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Reason for seeing the doctor : ",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            validationErrorMsg: 'Please enter a valid answer'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Please list any drug allergies
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Please list any drug allergies : ",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            maxline: 6,
                            validationErrorMsg: 'Please enter a valid answer'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Have you ever had (Please check all that apply ) : ",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 18, color: darkblue),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Diseases(text: 'Anemia'),
                            Diseases(text: 'Asthma'),
                            Diseases(text: 'Cancer'),
                            Diseases(text: 'Asthma'),
                            Diseases(text: 'Gout'),
                            Diseases(text: 'Diabetes'),
                            Diseases(text: 'Emotional Disorder'),
                            Diseases(text: 'Epilepsy Seizures'),
                            Diseases(text: 'Fainting Spells'),
                            Diseases(text: 'Gallstones'),
                            Diseases(text: 'Heart Disease'),
                            Diseases(text: 'Heart Attack'),
                            Diseases(text: 'Sleep Apenea'),
                            Diseases(text: 'Thyroid Problems'),
                            Diseases(text: 'Liver Disease'),
                            Diseases(text: 'Ulcer Disease'),
                            Diseases(text: 'Hepatitis'),
                            Row(
                              children: [
                                Text(
                                  "Other illnesses:",
                                  style: TextStyle(
                                      fontSize: 18, color: darkblue),
                                ),
                              ],),
                            EditTextUtils().getCustomEditTextArea(
                              validation: false,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Please list any drug allergies
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Please list any Operations and Dates of Each : ",
                                style: TextStyle(
                                    fontSize: 18, color: darkblue),
                              ),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            maxline: 6,
                            validationErrorMsg: 'Please enter a valid answer'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Please list any drug allergies
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Please list your Current Medications :",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            maxline: 6,
                            validationErrorMsg: 'Please enter a valid answer'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Please list your Current Medications :",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            maxline: 6,
                            validationErrorMsg: 'Please enter a valid answer'
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Exercise",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        GroupRadioButton(
                          label: [Text("Never"), Text("1-2 Days"), Text("3-4 Days"), Text("5+ Days")],
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
                              "Eating following a diet",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        GroupRadioButton(
                          label: [Text("I have a loose diet"), Text("I have a strict diet"), Text("I don't have a diet plan")],
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
                              "Do you smoke?",
                              style: TextStyle(
                                  fontSize: 18, color: darkblue),
                            )
                          ],
                        ),
                        GroupRadioButton(
                          label: [Text("No"), Text("0-1 Pack/day"), Text("1-2 Packs/day"),Text("2+ Pack/day")],
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
                            Flexible(
                              child: Text(
                                "Include other comments regarding your Medical History ",
                                style: TextStyle(
                                    fontSize: 18, color: darkblue),
                              ),
                            )
                          ],
                        ),
                        EditTextUtils().getCustomEditTextArea(
                            validation: true,
                            keyboardType: TextInputType.text,
                            maxline: 6,
                            validationErrorMsg: 'Please enter a valid answer'
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
                                            const Text('Some errors'),
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
        padding: const EdgeInsets.only(top: 80),
        child: Image.asset('assets/med.png', width: 100),
      ),
    ],
    ),),);
  }
}
