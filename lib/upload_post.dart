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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/upload_post.svg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Upload Your Farm-Fresh Product',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
