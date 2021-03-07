import 'package:flutter/material.dart';

import './custom_back_button.dart';
import './custom_close_button.dart';

export './custom_back_button.dart';
export './custom_close_button.dart';
export './custom_image_button.dart';
export './custom_text_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  CustomAppBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 0.0,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation != null && elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget leading = this.leading;
    if (leading == null && this.automaticallyImplyLeading) {
      if (!hasDrawer && canPop) {
        leading = useCloseButton ? CustomCloseButton() : CustomBackButton();
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Theme.of(context).brightness == Brightness.dark
            ? Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 0,
                ),
              )
            : null,
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: AppBar(
        leading: leading,
        automaticallyImplyLeading: this.automaticallyImplyLeading,
        title: this.title,
        actions: this.actions,
        flexibleSpace: this.flexibleSpace,
        bottom: this.bottom,
        elevation: this.elevation,
        backgroundColor: this.backgroundColor,
        brightness: this.brightness,
        iconTheme: this.iconTheme,
        textTheme: this.textTheme,
        primary: this.primary,
        centerTitle: this.centerTitle,
        titleSpacing: this.titleSpacing,
        toolbarOpacity: this.toolbarOpacity,
        bottomOpacity: this.bottomOpacity,
      ),
    );
  }

  @override
  final preferredSize;
}
