import 'package:FlutterWebSample/spinner_text.dart';
import 'package:flutter_web/material.dart';

class CutCircleText extends StatelessWidget {
  final BuildContext context;
  final String spinnerText;

  CutCircleText(this.context, this.spinnerText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45.0,
        left: 16.0,
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SpinnerText(
            text: spinnerText,
          ),
          Text(
            'Flutter on\nThe Web!',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
