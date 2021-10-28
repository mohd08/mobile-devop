import 'package:flutter/material.dart';
 
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<MyApp> {
  bool enableBtn = false;
  String? name, email, password;
  int gender = 0;
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();

  int _value = 1;
  
  void checkText() {
    if (name != "" && email != "" && password != "" && gender != 0) {
      enableBtn = true;
    } else {
      enableBtn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('Chit Chat Room'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Lets Get Connected !',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),


                Image.asset('assets/images/social.png', width: 330, height: 270),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (String newValue) {
                      setState(() {
                        name = newValue;
                      });
                      checkText();
                    },
                    obscureText: false,
                    // controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (String newValue) {
                      setState(() {
                        email = newValue;
                      });
                      checkText();
                    },
                    obscureText: false,
                    // controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (String newValue) {
                      setState(() {
                        name = newValue;
                      });
                      checkText();
                    },
                    obscureText: true,
                    // controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButtonFormField(
                  value: _value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select your gender',
                      ),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Male"),
                      value: 1,
                     ),
                    DropdownMenuItem(
                      child: Text("Female"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Other"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Rather not to say"),
                      value: 4,
                    )
                  ],
             
                  onChanged: (int? value) {
                    setState(() {
                      gender = value!;
                    });
                    checkText();
                  },
                  ),
                ),

                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: enableBtn? () {
                        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: const Text('Successful sign in. '))));                     
                      }: null,
                    )),
              ],
        )));
  }
}