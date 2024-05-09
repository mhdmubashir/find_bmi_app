import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String weight = '';
  String height = '';
  String result = '';
  String information = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 50, left: 10),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                title: const Text(
                  'About',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showAboutDialog(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.black),
                title: const Text(
                  'Exit',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showExitDialog(context);
                },
              ),
            ),
            ListTile(
              title: const Text(
                '© Pixclue Studios',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add functionality for your company details
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  weight = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  height = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: const Text('Calculate BMI'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 182, 190, 194),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                information,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double weightValue = double.tryParse(weight) ?? 0;
    double heightValue = double.tryParse(height) ?? 0;

    if (weightValue <= 0 || heightValue <= 0) {
      setState(() {
        result = 'Please enter valid weight and height';
        information = '';
      });
      return;
    }

    double bmi = weightValue / (heightValue * heightValue);

    setState(() {
      result = 'Your BMI: ${bmi.toStringAsFixed(2)}';

      if (bmi < 18.5) {
        information =
            'Underweight: You may need to gain weight. Suggestions: \n'
            '- Increase your calorie intake with nutrient-rich foods like nuts, avocados, and dairy.\n'
            '- Incorporate strength training exercises to build muscle mass.\n'
            '- Consult with a healthcare professional for personalized advice.';
      } else if (bmi >= 18.5 && bmi < 25) {
        information = 'Normal weight: Keep up the good work! Suggestions: \n'
            '- Maintain a balanced diet with plenty of fruits, vegetables, lean proteins, and whole grains.\n'
            '- Stay physically active with regular exercise like walking, jogging, or swimming.\n'
            '- Schedule regular check-ups with your doctor to monitor your overall health.';
      } else if (bmi >= 25 && bmi < 30) {
        information = 'Overweight: You may need to lose weight. Suggestions: \n'
            '- Focus on portion control and reducing your intake of high-calorie, processed foods.\n'
            '- Increase your physical activity levels with activities like cycling, dancing, or aerobics.\n'
            '- Seek support from a healthcare provider or nutritionist for personalized weight loss strategies.';
      } else {
        information =
            'Obese: You are at a higher risk of developing health problems. Suggestions: \n'
            '- Work with a healthcare professional to create a comprehensive weight loss plan.\n'
            '- Incorporate more fruits, vegetables, and whole grains into your diet while limiting sugar and saturated fats.\n'
            '- Engage in regular physical activity, aiming for at least 150 minutes of moderate-intensity exercise per week.';
      }
    });
  }

  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("About BMI Calculator"),
          content: const Text(
              "This BMI calculator app helps you calculate your Body Mass Index (BMI) based on your weight and height. BMI is a measure of body fat based on height and weight that applies to adult men and women. It is used as a screening tool to identify possible weight problems for adults."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Exit BMI Calculator"),
          content: const Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop(); // Exit the application
              },
              child: const Text("Exit"),
            ),
          ],
        );
      },
    );
  }
}
