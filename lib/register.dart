import 'package:farmerchoice/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _accountType = 'user';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          height: double.maxFinite,
          color: Color(0xffF3FFFA),
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Center(
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              radius: 50.0,
                            ),
                            Positioned(
                                right: -10,
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
                      //Person Name
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            // errorText: null,
                            hintText: 'Enter Contact',
                            labelText: 'Person Name',
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
                            hintText: 'Enter Contact Detail',
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      //Email
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            // errorText: null,
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            // errorText: null,
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            // errorText: null,
                            hintText: 'Enter your password again',
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: DropdownButtonFormField(
                          value: _accountType,
                          onTap: () {},
                          onChanged: (newValue) {
                            setState(() {
                              _accountType = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Select Account type',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'user',
                              child: Text('user'),
                            ),
                            DropdownMenuItem(
                              value: 'seller',
                              child: Text('seller'),
                            ),
                          ],
                          // hint:
                          //     const Text('Select Department'),
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
                                builder: (context) => Home(),
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
        ),
      ),
    );
  }
}
