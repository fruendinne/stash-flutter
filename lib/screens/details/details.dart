import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stash/components/panel/slide_panel_header.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/models/stash_model.dart';
import 'package:stash/screens/components/logo.dart';
import 'package:stash/screens/details/details_controller.dart';
import 'package:stash/themes/style.dart';

class DetailsScreen extends StatefulWidget {
  final StashModel stash;
  DetailsScreen({Key key, this.stash}) : super(key: key);

  @override
  DetailsScreenController createState() => DetailsScreenController(stash);
}

class DetailsScreenView
    extends WidgetView<DetailsScreen, DetailsScreenController> {
  DetailsScreenView(DetailsScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    Color textColor = state.textColor;

    return Column(
      children: <Widget>[
        SlidePanelHeader(
          color: state.stash.color,
          body: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(state.stash.imageUrl)
          ),
          topRightAppend: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(state.stash.viewCount.toString(),
                  style: TextStyle(fontSize: 24, color: textColor)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text("×",
                    style: TextStyle(fontSize: 24, color: textColor)
                ),
              ),
              Icon(
                MdiIcons.glasses,
                color: textColor,
              )
            ],
          ),
        ),
        Container(
            color: CustomColors.surface100,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                  child: Text(state.stash.body),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 2),
                    IconButton(
                      icon: state.thumbUpIcon,
                      onPressed: () {
                        state.thumbsUpCallback();
                      },
                    ),
                    Spacer(flex: 1),
                    IconButton(
                      icon: state.thumbDownIcon,
                      onPressed: () {
                        state.thumbsDownCallback();
                      },
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
