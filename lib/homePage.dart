import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> items = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void submitWIdget() {
    setState(
      () {
        final name = nameController.text;
        final age = ageController.text;
        final address = addressController.text;
        final phone = phoneController.text;

        if (name.isNotEmpty) {
          items.add(
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amberAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(name),
                      Text(age),
                      Text(address),
                      Text(phone),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: width * 0.3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              FieldGenerator(controller: nameController, text: 'Name'),
              SizedBox(height: 20),
              FieldGenerator(controller: ageController, text: 'Age'),
              SizedBox(height: 20),
              FieldGenerator(controller: addressController, text: 'Address'),
              SizedBox(height: 20),
              FieldGenerator(controller: phoneController, text: 'Phone'),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                child: Text('Submit'),
                onPressed: submitWIdget,
                color: Colors.blue,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FieldGenerator extends StatelessWidget {
  const FieldGenerator({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
