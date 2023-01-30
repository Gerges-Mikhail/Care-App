import 'package:care/common/common.dart';
import 'package:care/database/sqflite.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/widgets/ListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  SqlDatabase sqlDatabase = SqlDatabase();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDatabase.readData("SELECT * FROM 'request'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, left: 15, bottom: 20, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Appointment',
                          style: TextStyle(
                              color: green,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: white,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(fontSize: 18, color: white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text(
                      'From / 12 : 00 pm , to / 6:00 pm  ',
                      style: TextStyle(
                          color: white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 385,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView(
                    children: [
                      FutureBuilder(
                        future: readData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Map>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, i) {
                                  return (i > 0 || i == 0)
                                      ? Dismissible(
                                        key: Key(i.toString()),
                                        background: Container(color: green,),
                                        onDismissed: (d)async{
                                          int response = await sqlDatabase.deleteData("DELETE FROM 'request' WHERE id = ${snapshot.data![i]['id']}");
                                          if (response > 0){
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Appointments()));
                                          }
                                        },
                                        child: ListTiLeAppointment(
                                            "${snapshot.data![i]['id']}",
                                            "${snapshot.data![i]['name']}",
                                            "${snapshot.data![i]['phonenumber']}",
                                            "${snapshot.data![i]['date']}"),
                                      )
                                      : Container();
                                });
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
