import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'sign_up.dart';
import 'package:delv_app/root_screen.dart';
import 'forgot_password_page.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8),
      body: Stack(
        children: [
          // Background decorative circles
          _buildBackgroundDecorations(),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Toggle text buttons without container
                  _buildToggleButtons(),

                  const SizedBox(height: 80),

                  // Form
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildEmailField(),
                            const SizedBox(height: 20),
                            _buildPasswordField(),
                            const SizedBox(height: 12),
                            _buildForgotPasswordLink(),
                            const SizedBox(height: 40),
                            _buildSignInButton(),
                            const SizedBox(height: 20),
                            _buildSignUpLink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        // Top left yellow circle
        Positioned(
          top: -80,
          left: -80,
          child: Hero(
            tag: 'yellow-circle-large',
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xffffe175),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Top right green circle
        Positioned(
          top: -40,
          right: -40,
          child: Hero(
            tag: 'green-circle-large',
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFF9ED99E),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xff82CE70),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Bottom left large green circle
        Positioned(
          bottom: -120,
          left: -100,
          child: Hero(
            tag: 'green-circle-bottom',
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                color: Color(0xFF9ED99E),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Color(0xff82CE70),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Bottom right yellow circle
        Positioned(
          bottom: -100,
          right: -100,
          child: Hero(
            tag: 'yellow-circle-small-top',
            child: Container(
              width: 240,
              height: 240,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Color(0xffffe175),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Small green circle on right
        Positioned(
          bottom: 120,
          right: -30,
          child: Hero(
            tag: 'green-circle-middle',
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF9ED99E),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff82CE70),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
          },
          child: Text(
            'sign up',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF82CE70),
                fontFamily: "ElMessiri"
            ),
          ),
        ),
        const SizedBox(width: 40),
        Text(
          'sign in',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4CAF50),
              fontFamily: "ElMessiri"
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "ElMessiri"
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontFamily: "ElMessiri"),
          decoration: InputDecoration(
            hintText: 'something@email.com',
            hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: "ElMessiri"
            ),
            filled: true,
            fillColor: const Color(0xFFF5F1E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "ElMessiri"
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          style: TextStyle(fontFamily: "ElMessiri"),
          decoration: InputDecoration(
            hintText: '••••••••••••••••',
            hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: "ElMessiri"
            ),
            filled: true,
            fillColor: Color(0xFFF5F1E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey[400],
              ),
              onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgetPasswordFlow()),
          );
        },
        child: Text(
          'Forgot password?',
          style: TextStyle(
              color: Color(0xFFB9E7AD),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "ElMessiri"
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RootScreen()),
        );
          }
      },

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5F1E8),
          foregroundColor: Color(0xFF767474).withOpacity(0.52),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
        child: Text(
          'Sign in',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF767474).withOpacity(0.70),
              fontFamily: "ElMessiri"
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Create a new account ? ',
          style: TextStyle(
              color: Color(0xFF767474).withOpacity(0.70),
              fontFamily: "ElMessiri"
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color(0xFF767474).withOpacity(0.70),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      fontFamily: "ElMessiri"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}