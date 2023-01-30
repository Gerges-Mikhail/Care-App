
import 'package:care/common/common.dart';
import 'package:care/widgets/Doctors.dart';
import 'package:care/widgets/contact_widgets.dart';
import 'package:care/widgets/floatongbtn.dart';
import 'package:flutter/material.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials>  with SingleTickerProviderStateMixin{
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length:2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0,top: 47,left: 2,right: 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'C A R E',
                        style: TextStyle(
                          color: green,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),

                        )),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Testimonials',
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            height: 380,
                            width: 350,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: grey,
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBarView(
                                controller: _tabController,
                                children: const <Widget>[
                                  DoctorsCV(image: 'assets/doctor.png', name: 'Tammy J. Perez', cv:' Dr. Xander was terrific. Knowledgeable, sensitive, informative… I immediately felt at ease – and felt confident in my receiving expert medical care. Staff was great, too. Walked away, very impressed w. the overall experience. HIGHLY recommend.' ),
                                  DoctorsCV(image: 'assets/doctor.png', name: 'Gregory J. Alvarez', cv:'Dr. Xander did a great job with my first ever health exam. She explained everything to me in a very clear manner. She was also kind and friendly. All of the staff was great – they were helpful, patient and helped with my insurance.' ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back_ios_rounded,size: 20,color: darkblue,),
                              const SizedBox(width: 40,),
                              Icon(Icons.arrow_forward_ios,size: 20,color: darkblue,),
                          ],),
                          const SizedBox(height: 20,),
                          const ContactWidgets(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:floatingBtn(),
    );
  }
}
