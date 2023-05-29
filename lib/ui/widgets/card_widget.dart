import 'package:flutter/cupertino.dart';
import 'package:lesson4/ui/themes/app_colors.dart';
import 'package:lesson4/ui/themes/app_styles.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
     this.title = '',
     this.text = '',
     this.date = '',
    // required this.index,
});
  final String title, text, date;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.fontStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: AppStyles.fontStyle.copyWith(
              color: AppColors.lightGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyles.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
