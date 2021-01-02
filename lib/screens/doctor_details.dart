import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';

class DoctorDetails extends StatefulWidget {
  Doctor doctor;
  DoctorDetails(this.doctor);
  @override
  State<StatefulWidget> createState() {
    return DoctorDetailsState(doctor);
  }
}

class DoctorDetailsState extends State<DoctorDetails> {
  int _selectedItem = 0;
  Doctor doctor;
  DoctorDetailsState(this.doctor);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(doctor.urlPhoto),
                  radius: 65,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    doctor.speciality,
                    style: TextStyle(
                        color: Color(0xff07da5f),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(doctor.rating>0.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>1.4 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>2.4 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>3.4 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>4.4 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Padding(
                        padding: EdgeInsets.only(left:15),
                        child: Text(
                          doctor.rating.toString(),
                          style: TextStyle(fontSize: 18, color: Color(0x770000000)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top:10),
            child: Container(
              height: 2,
              width: size.width*0.9,
              color:Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:25,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Short Description',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:15,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                doctor.shortDescription,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.07,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Location',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:5,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.grey[400]),
                  Text(
                    doctor.address,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:15),
            child: Image.asset('assets/images/map.jpg',width: size.width*0.9,height: size.height*0.3,),
          ),
           Padding(
            padding: EdgeInsets.only(top:20),
            child: SizedBox(
              width: size.width*0.9,
              height: size.height*0.07,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.green,
                child: Text('Request',style: TextStyle(color:Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: (index) {
        setState(() {
          _selectedItem = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notification'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Schedule'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Profile'),
        ),
      ],
    );
  }
}
