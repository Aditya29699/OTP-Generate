//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp/phone.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  //final FirebaseAuth auth=FirebaseAuth.instance;
  //bool isApiCallProcess=false;
  late TextEditingController _otpController;
  late FocusNode myFocusNode;

  @override
  void initState(){
    super.initState();
    _otpController = TextEditingController();
    myFocusNode=FocusNode();
    myFocusNode.requestFocus();
    SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String otp = args['otp'];
    String mobileNo = args['mobileNo'];
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  var code=" ";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
                Text('Otp Verification',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text('We need to enter your otp before getting started!',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                SizedBox(
                  height: 40,
                ),
            Pinput(
              length: 6,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: (value){
                code=value;
              },
            ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()  {
                    //String enteredOTP = _otpController.text;
                    if (code == otp) {
                      // OTP is correct
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('OTP Verified Successfully!'),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      // OTP is incorrect
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid OTP. Please try again.'),
                        backgroundColor: Colors.red,
                      ));
                    }
                    //verify();
                    /*PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);
                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);*/
                  }, child: Text('Verify otp',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),),
                ),
                Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, "phone");
                    }, child: Text('Edit Phone number ?')),
                  ],
                ),
              ],
            ),
          )),
    );
  }
  @override
  void dispose(){
    _otpController.dispose();
    super.dispose();
    // Unregister the listener when the widget is disposed
    SmsAutoFill().unregisterListener();
    //SmsAutoFill.unregisterListener();
  }
}

