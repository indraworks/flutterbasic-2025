import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';
import '../utils/theme/app_text_styles.dart';

import '../utils/responsive/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(
          SizeConfig.safeBlockHorizontal(context) * 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: AppTextStyles.headLine(context, isDark: isDark),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical(context) * 2),
            Text(
              "Please to fill your email & password ",
              style: AppTextStyles.body(context, isDark: isDark),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical(context) * 3),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: AppTextStyles.body(context, isDark: isDark),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical(context) * 2),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: AppTextStyles.body(context, isDark: isDark),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical(context) * 3),
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical(context) * 2,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "LogIn",
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
