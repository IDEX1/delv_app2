import 'package:flutter/material.dart';

class ForgetPasswordFlow extends StatefulWidget {
  const ForgetPasswordFlow({super.key});

  @override
  _ForgetPasswordFlowState createState() => _ForgetPasswordFlowState();
}

class _ForgetPasswordFlowState extends State<ForgetPasswordFlow> {
  int currentStep = 1;
  String phoneNumber = '';
  List<String> verificationCode = ['', '', '', '', '', ''];
  String newPassword = '';
  String confirmPassword = '';
  List<TextEditingController> codeControllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> codeFocusNodes = List.generate(6, (index) => FocusNode());

  final Color backgroundColor = Color(0xFFF5F1E8);
  final Color greenColor = Color(0xFF82CE70);
  final Color yellowColor = Color(0xFFFDB462);
  final Color borderColor = Color(0x84767474); // 52% opacity
  final Color textColor = Color(0xB3767474); // 70% opacity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 24,
              color: greenColor,
              fontFamily: 'ElMessiri',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          // Background decorative circles
          _buildBackgroundCircles(),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Header with back button
                _buildHeader(),

                // Content based on current step
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: _buildCurrentStep(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundCircles() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: greenColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 200,
          right: 0,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: yellowColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 0,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: greenColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: yellowColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (currentStep > 1) {
                setState(() {
                  currentStep--;
                });
              }
            },
            icon: Icon(
              Icons.arrow_back,
              color: greenColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 1:
        return _buildPhoneNumberStep();
      case 2:
        return _buildVerificationStep();
      case 3:
        return _buildNewPasswordStep();
      case 4:
        return _buildSuccessStep();
      default:
        return _buildPhoneNumberStep();
    }
  }

  Widget _buildPhoneNumberStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 24,
            color: greenColor,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 40),

        Text(
          'Please Enter Your Phone Number To receive a confirmation code to set a new password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 60),

        Text(
          'Phone number',
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 8),

        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    '🇱🇧',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '+961',
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  onChanged: (value) => phoneNumber = value,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'ElMessiri',
                  ),
                  decoration: InputDecoration(
                    hintText: '(XX)XXXXXX)',
                    hintStyle: TextStyle(
                      color: textColor,
                      fontFamily: 'ElMessiri',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 40),

        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                currentStep = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: borderColor),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                fontFamily: 'ElMessiri',
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 24,
            color: greenColor,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 60),

        Center(
          child: Container(
            width: 80,
            height: 60,
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 20,
                  child: Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.check,
                      color: yellowColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),

        Text(
          'Enter the 6 Digit code sent to\nsomething@email.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: codeControllers[index],
                focusNode: codeFocusNodes[index],
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontFamily: 'ElMessiri',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (value) {
                  verificationCode[index] = value;
                  if (value.isNotEmpty && index < 5) {
                    codeFocusNodes[index + 1].requestFocus();
                  }
                },
              ),
            );
          }),
        ),

        SizedBox(height: 40),

        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                currentStep = 3;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: borderColor),
              ),
            ),
            child: Text(
              'Verify',
              style: TextStyle(
                fontFamily: 'ElMessiri',
                fontSize: 16,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Resend Code',
              style: TextStyle(
                color: greenColor,
                fontFamily: 'ElMessiri',
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewPasswordStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40),

        Text(
          'Enter New Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 40),

        Text(
          'New Password',
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: true,
            onChanged: (value) => newPassword = value,
            style: TextStyle(
              color: textColor,
              fontFamily: 'ElMessiri',
            ),
            decoration: InputDecoration(
              hintText: '••••••••••••••••',
              hintStyle: TextStyle(
                color: textColor,
                fontFamily: 'ElMessiri',
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),

        SizedBox(height: 20),

        Text(
          'Confirm Password',
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: 'ElMessiri',
          ),
        ),

        SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: true,
            onChanged: (value) => confirmPassword = value,
            style: TextStyle(
              color: textColor,
              fontFamily: 'ElMessiri',
            ),
            decoration: InputDecoration(
              hintText: '••••••••••••••••',
              hintStyle: TextStyle(
                color: textColor,
                fontFamily: 'ElMessiri',
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),

        SizedBox(height: 40),

        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                currentStep = 4;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: borderColor),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(
                fontFamily: 'ElMessiri',
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 24,
            color: greenColor,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 60),

        Center(
          child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xff767474).withOpacity(0.52) , width: 2),
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 2,
                        color: yellowColor,
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: yellowColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Successfully\nsave',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'your password has been reset',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontFamily: 'ElMessiri',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentStep = 1;
                      phoneNumber = '';
                      verificationCode = ['', '', '', '', '', ''];
                      newPassword = '';
                      confirmPassword = '';
                      for (var controller in codeControllers) {
                        controller.clear();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    foregroundColor: textColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: borderColor),
                    ),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontFamily: 'ElMessiri',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    for (var focusNode in codeFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}