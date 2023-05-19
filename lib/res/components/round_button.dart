import 'package:flutter/material.dart';

import '../app_colors.dart';


//stfl
//stls
class RoundedButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress; //mistake dont use Action


  RoundedButton({Key? key,
    required this.title,
    this.loading = false,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 40,
        width: 200,
        child: Center(
            child: loading ? const CircularProgressIndicator(color: AppColors.whiteColor,) :
                   Text("$title", style: const TextStyle(color:AppColors.whiteColor),)),
      ),

    );
  }
}
