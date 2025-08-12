import 'package:flutter/material.dart';
import '../utils/theme/app_colors.dart';
import '../utils/theme/app_text_styles.dart';

import '../utils/responsive/responsive.dart';
import '../utils/responsive/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //inisialisasi ukuran layar
    SizeConfig.init(context);
    //check apakah sedang dalam darkmode?
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppTextStyles.headLine(context, isDark: true),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal(context) * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome ",
              style: AppTextStyles.headLine(context, isDark: isDark),
            ),
            SizedBox(height: SizeConfig.safeBlockHorizontal(context) * 2),
            Text(
              "This the Page of Your App!",
              style: AppTextStyles.body(context, isDark: isDark),
            ),
            //tomnol adaftif
            SizedBox(
              width: Responsive.isMobile(context)
                  ? double.infinity
                  : SizeConfig.safeBlockHorizontal(context) *
                        50, //lebar 1/2 desktop
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight, //warna sesuai themee
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical(context) * 2,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Start Now',
                  style: AppTextStyles.subheadLine(context, isDark: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
