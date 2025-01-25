import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_theme_style.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ExpandableText({Key? key, required this.text, this.maxLength = 300})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isTextLong = widget.text.length > widget.maxLength;
    final String displayText =
        _isExpanded ? widget.text : widget.text.substring(0, widget.maxLength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: displayText,
            style: AppTextStyles.urbanistRegular(),
            children: [
              if (isTextLong && !_isExpanded)
                TextSpan(
                  text: ' View more...',
                  style: AppTextStyles.urbanistBold(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _isExpanded = true;
                      });
                    },
                ),
            ],
          ),
        ),
        if (isTextLong && _isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = false;
              });
            },
            child: Text(
              'Hide now',
              style: AppTextStyles.urbanistBold(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
