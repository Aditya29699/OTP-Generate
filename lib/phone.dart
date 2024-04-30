
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http ;
import 'package:phone_otp/todo_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:toast/toast.dart';


class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  static String verify=" ";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController _controller=TextEditingController();
  var code=" ";

  Future<void> otpdata(String code) async {
    //final http.Response response = await http.get(Uri.parse('http://103.121.236.55:86/LoginService.svc/otpVarify?CODE=$code'));
    final http.Response response = await http.get(Uri.parse('http://mobileapp.theghgroup.com/LoginService.svc/otpVarify?CODE=CBSTEST'));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());
      TodoModel todoModel = TodoModel.fromJson(responseData);

      // Access OTP and mobile number
      if (todoModel.otpListResult != null && todoModel.otpListResult!.otpDetail != null) {
        String otp = todoModel.otpListResult!.otpDetail![0].oTP ?? "";
        String mobileNo = todoModel.otpListResult!.otpDetail![0].mobileNo ?? "";

        showToast("OTP: $otp");
        for (OtpDetail otpDetail in todoModel.otpListResult!.otpDetail!) {
          print('OTP: ${otpDetail.oTP}');
          //Toast.show('OTP: ${otpDetail.oTP}');
          print('Mobile Number: ${otpDetail.mobileNo}');
          Navigator.pushNamed(context, "otp",arguments: {"otp": otp, "mobileNo": mobileNo});
        }
      } else {
        print('No OTP data found.');
      }
    } else {
      print('Failed to fetch OTP. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),

        alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/otp1.png'),
                SizedBox(
                  height: 20,
                ),
                Text('Phone Verification',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text('We need to registered your phone number before getting started !',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                  /*Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border:InputBorder.none,
                          ),
                        ),
                      ),
                      Text('|',style: TextStyle(fontSize: 33,color: Colors.grey),),
                      SizedBox(
                        width: 10,
                      ),*/
                      TextField(
                        style:TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                        //maxLength: 10,
                        /*onChanged: (value){
                          code=value;
                        },*/

                        controller:_controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border:InputBorder.none,
                            hintText: 'Enter Code',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold
                          )

                        ),
                      ),
                  
                  // ],
                  ),
               // ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()  {
                    String code=_controller.text;
                    otpdata(code);
                    //Navigator.pushNamed(context, "otp");
                    /*await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${controller.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MyPhone.verify=verificationId;
                        },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );*/
                   //
                  }, child: Text('Send otp',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        
                      )
                      
                    ),),
                ),

              ],
            ),
          )),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
}}
