import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/colors.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/utils/bottom_bar_widget.dart';
import 'package:untitled/src/core/utils/images.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Thank you for choosing' ,style: getMediumStyle(fontSize: 22.sp,color: AppColors.black),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Workiom' , style: getMediumStyle(fontSize: 22.sp,color: AppColors.black),textAlign: TextAlign.end,),
                            SvgImageWidget(image: SvgImages.logo,width: 29.w,height: 29.h,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              BottomBarWidget(withLang: false,),
              26.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
