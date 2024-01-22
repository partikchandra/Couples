import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// Import statements...

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle setting carousel button press
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            right: 130.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              child: Image.asset('lib/assets/male.png'),
                            ),
                          ),
                          Positioned(
                            left: 130.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              child: Image.asset('lib/assets/male.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        '234 days together',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 80,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
                items: [
                  Container(child: Image.asset('your_image_path_here')),
                  Container(child: Image.asset('your_image_path_here')),
                  Container(child: Image.asset('your_image_path_here')),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Column 1 Heading',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('Column 1 Content'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Column 2 Heading',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('Column 2 Content'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 68,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      color: Colors.red,
                      child: Center(child: Text('Text 1')),
                    ),
                    Container(
                      color: Colors.green,
                      child: Center(child: Text('Text 2')),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Center(child: Text('Text 3')),
                    ),
                    Container(
                      color: Colors.orange,
                      child: Center(child: Text('Text 4')),
                    ),
                    Container(
                      color: Colors.purple,
                      child: Center(child: Text('Text 5')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
        ],
      ),
    );
  }
}
