import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_button.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

void showDeleteDialogHelper({
  required Function() onTap,
  required BuildContext context,
  String? confirmButtonText,
  required String title,
  required String body,
}) {
  if (kIsWeb) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Center(
              child: Text(
                title,
                style: Fonts.headline5,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: Fonts.headline6.copyWith(
                color: CustomColors.black.withOpacity(0.8),
              ),
            ),
          ),
          actions: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: confirmButtonText ?? "Ok",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        expanded: true,
                        backgroundColor: CustomColors.black,
                        textColor: CustomColors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  } else {
    showCustomModalBottomSheet(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Center(
              child: Text(
                title,
                style: Fonts.headline5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: Fonts.headline6.copyWith(
                color: CustomColors.black.withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: confirmButtonText ?? "Ok",
                    backgroundColor: CustomColors.brandPurple,
                    textColor: CustomColors.white,
                    onTap: onTap,
                    expanded: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
