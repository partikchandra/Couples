import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Person Carousel
            Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  left: 12,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            // Right side: Setting Carousel
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
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display a circle
              Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 2),

                    // Display a heart shape
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    ),
                    SizedBox(width: 2),

                    // Display another circle
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),

              // Overlapping "234 days together" text
              Container(
                // margin:
                //     EdgeInsets.only(top: -50), // Adjust this margin as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Set your border color
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

              // Automatic moving carousel
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
                items: [
                  Text('Carousel Item 1'),
                  Text('Carousel Item 2'),
                  Text('Carousel Item 3'),
                  // Add more carousel items as needed
                ],
              ),
              SizedBox(height: 20),

              // Two columns with heading and content
              Row(
                children: [
                  Expanded(
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
                  SizedBox(width: 20),
                  Expanded(
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
                ],
              ),
              SizedBox(height: 20),

              // List instead of carousel
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
                    // Add more list items as needed
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
