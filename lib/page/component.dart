import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.press,
  }) : super(key: key);
  String name, price, image;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 1,
        shadowColor: Colors.blue,
        child: Column(
          children: [
            Image.network(
              image,
              height: 180,
            ),
            Text(name),
            Text(
              "\$$price",
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.icon,
    required this.type,
    required this.press,
  }) : super(key: key);
  String icon;
  String type;
  VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: OutlinedButton(
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Image.network(
                icon,
                height: 50,
              ),
              const SizedBox(height: 5),
              Text(
                type,
                style: const TextStyle(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  BuildContext context;
  double width, height;
  IconData icon;
  String label;
  VoidCallback press;
  ButtonWidget({super.key,
    required this.context,
    required this.width,
    required this.height,
    required this.icon,
    required this.label,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: const StadiumBorder(),
        ),
        icon: Icon(icon),
        label: Text(label),
        onPressed: press,
      ),
    );
  }
}

class BuildTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String?) validator;
  final String label;
  final IconData icon;
  final bool? obscureText;
  final IconButton? suffixIcon;
  const BuildTextFormField({
    this.suffixIcon,
    this.obscureText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        label: Text(label,style: TextStyle(color: Colors.brown)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.orange),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(1, 1, 4, 1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: Colors.deepOrange,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  MenuTitle({super.key,
    required this.icon,
    required this.title,
    this.destination,
  });
  String title;
  IconData icon;
  Widget? destination;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            if(destination!=null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination!,),
              );
            }
            else {
              return;
            }
          },
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(icon, color: Colors.orange,),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.orange),
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({super.key,
    required this.name,
    required this.email,
  });
  String name, email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,25,0,0),
      child: ListTile(
        leading: const CircleAvatar(
          maxRadius: 25,
          backgroundImage: AssetImage("assets/images/background.png"),
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.black87),
        ),
        subtitle: Text(
          email,
          style: const TextStyle(color: Colors.black38),
        ),
      ),
    );
  }
}