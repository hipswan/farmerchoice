import 'package:farmerchoice/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadPost extends StatelessWidget {
  const UploadPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          color: Color(0xffF3FFFA),
          child: Center(
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/upload_post.svg',
                  width: 200,
                  height: 200,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.cloud_upload_outlined,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              CircleBorder(),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.white,
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.edit_outlined,
                                            color: Colors.green,
                                          )))
                                ],
                              ),
                            ),
                            //Product Name
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  // errorText: null,
                                  hintText: 'Product Name',
                                  labelText: 'Product',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            //Mobile Number

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: false,
                                  signed: false,
                                ),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  // errorText: null,
                                  hintText: 'Enter Quntity',
                                  labelText: 'Quantity',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            //Price
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  // errorText: null,
                                  hintText: 'Enter Price per Kilo',
                                  labelText: 'Price',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            //Description
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: TextFormField(
                                maxLength: 200,
                                maxLines: 5,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  // errorText: null,
                                  hintText: 'Enter Description',
                                  labelText: 'Description',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xff26C485),
                                  ),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Landing(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 15.0,
                // ),
                // Text(
                //   'Upload Your Farm-Fresh Product',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
