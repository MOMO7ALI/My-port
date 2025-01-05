import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/port/presentation/cubit/port_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortScreen extends StatelessWidget {
  final TextEditingController portController = TextEditingController();

  PortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Port",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5b2892),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06), // Adjust padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo/Image Section
              Image.asset(
                "assets/images/MyPort.png",
                width: screenWidth * 0.3, // Adjust image width
                height: screenWidth * 0.3, // Adjust image height
              ),
              SizedBox(height: screenHeight * 0.05), // Adjust spacing
        
              // Port Number Input Section
              TextField(
                controller: portController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Frame",
                  labelStyle: TextStyle(
                    color: const Color(0xFF5b2892),
                    fontSize: screenWidth * 0.04, // Adjust font size
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF5b2892),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF5b2892),
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // Adjust vertical padding
                    horizontal: screenWidth * 0.03, // Adjust horizontal padding
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Adjust spacing
        
              // Calculate Button
              ElevatedButton(
                onPressed: () {
                  final port = int.tryParse(portController.text) ?? 0;
                  context.read<PortCubit>().calculatePort(port);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2, // Adjust horizontal padding
                    vertical: screenHeight * 0.02, // Adjust vertical padding
                  ),
                  backgroundColor: const Color(0xFF5b2892),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.purpleAccent,
                  elevation: 5,
                ),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Adjust font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05), // Adjust spacing
        
              // Result Display Section
              BlocConsumer<PortCubit, PortState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is PortInitial) {
                    return const Text(
                      "Enter a port number to calculate",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    );
                  } else if (state is PortInvalid) {
                    return const Text(
                      "Invalid Port Number",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    );
                  } else if (state is PortCalculated) {
                    return ResultCard(state: state, screenWidth: screenWidth);
                  }
                  return const SizedBox.shrink();
                },
              ),
        
              // Button to navigate to Details Screen
              SizedBox(height: screenHeight * 0.02), // Adjust spacing
             
            ],
          ),
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final PortCalculated state;
  final double screenWidth;

  const ResultCard({super.key, required this.state, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 243, 242, 243),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Adjust padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResultText("Shelf: ", state.shelf),
            _buildResultText("Comb: ", state.comb),
            _buildResultText("Port: ", state.port),
          ],
        ),
      ),
    );
  }

  Widget _buildResultText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02), // Adjust spacing
      child: Text(
        "$label$value",
        style: TextStyle(
          fontSize: screenWidth * 0.045, // Adjust font size
          fontWeight: FontWeight.w600,
          color: const Color(0xFF5b2892),
        ),
      ),
    );
  }
}
