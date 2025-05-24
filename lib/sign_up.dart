import 'package:delv_app/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
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
                            const SizedBox(height: 20),
                            _buildUsernameField(),
                            const SizedBox(height: 20),
                            _buildPhoneField(),
                            const SizedBox(height: 40),
                            _buildSignUpButton(),
                            const SizedBox(height: 20),
                            _buildSignInLink(),
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
        Text(
          'sign up',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4CAF50),
              fontFamily: "ElMessiri"
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () {
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
          },
          child: Text(
            'sign in',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF82CE70),
                fontFamily: "ElMessiri"
            ),
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
            fillColor: const Color(0xFFF5F5F0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
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
            hintText: '••••••••••••',
            hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: "ElMessiri"
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
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
            if (value.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User name',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "ElMessiri"
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _usernameController,
          style: TextStyle(fontFamily: "ElMessiri"),
          decoration: InputDecoration(
            hintText: 'John Doe',
            hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: "ElMessiri"
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x84767474).withOpacity(0.52),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "ElMessiri"
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0x84767474).withOpacity(0.52),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 16,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '+256',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "ElMessiri"
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontFamily: "ElMessiri"),
                decoration: InputDecoration(
                  hintText: '(XX)XXXXXX)',
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontFamily: "ElMessiri"
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: const Color(0x84767474).withOpacity(0.52),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: const Color(0x84767474).withOpacity(0.52),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: const Color(0x84767474).withOpacity(0.52),
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Sign Up...')),
            );
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
        );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5F5F0),
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: const Color(0x84767474).withOpacity(0.52),
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          'Sign up',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "ElMessiri",
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontFamily: "ElMessiri",
          ),
          children: [
            TextSpan(text: 'Already have an account ? '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF82CE70),
                    fontWeight: FontWeight.w600,
                    fontFamily: "ElMessiri",
                    decoration: TextDecoration.underline,
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