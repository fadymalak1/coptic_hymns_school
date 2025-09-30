import 'package:flutter/material.dart';

class InstructorFeature extends StatelessWidget {
  const InstructorFeature({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
  });

  final Color color;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color,),
              SizedBox(width: 8,),
              FittedBox(fit: BoxFit.scaleDown,child: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black,),)),
            ],
          ),
          SizedBox(height: 8,),
          Text("+ $value", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color,),),
        ],
      ),
    );
  }
}
