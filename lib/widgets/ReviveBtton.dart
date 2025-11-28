import 'package:flutter/material.dart';
import 'package:revive_app/utils/Theme/Colors.dart';

class Revivebutton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color? bgcolor;
  const Revivebutton({
    super.key,
    required this.onTap,
    required this.label,
    this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // fixedSize: Size(MediaQuery.of(context).size.width, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: bgcolor ?? AppColors.Primarycolor,
            ),
            onPressed: onTap,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.translate(
                          offset: const Offset(30, 0),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white.withOpacity(0.2),
                            size: 25,
                            weight: 0.2,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(16, 0),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white.withOpacity(0.5),
                            size: 25,
                            weight: 0.2,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(1, 0),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 25,
                            weight: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
