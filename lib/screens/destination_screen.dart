import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_ui/models/activity_model.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Destination_Screen extends StatefulWidget {
  const Destination_Screen(
      {Key? key,
      required this.destination,
      required this.city,
      required this.length,
      required this.country})
      : super(key: key);
  final String destination;
  final String city;
  final String country;
  final int length;
  @override
  _Destination_ScreenState createState() => _Destination_ScreenState();
}

class _Destination_ScreenState extends State<Destination_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Hero(
                  tag: widget.destination,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  children: [
                    Text(
                      widget.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 10.0,
                              color: Colors.white60,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              widget.country,
                              style: TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = activities[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
