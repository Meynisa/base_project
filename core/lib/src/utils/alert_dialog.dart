import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:scm_mobile_app/main_lib.dart';

class AlertDialogCustom {
  Future<void> alertDialog(BuildContext context, String text, String? desc,
      {IconData icon = Icons.warning,
      Color colorIcon = ColorsCollection.cRipple10,
      bool isNavigate = false,
      navigate,
      isOneButton = false,
      String imgAsset = "",
      String? roomId,
      Function? onPressedOK,
      bool noButton = false,
      Widget? customWidget,
      bool isDismissable = true,
      String? leftBtnLabel,
      String? rightBtnLabel,
      String oneBtnLabel = 'OK',
      bool isImgEmpty = false}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: isDismissable, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: SingleChildScrollView(
                  child: ListBody(children: <Widget>[
                SizedBox(height: 30),
                Text(
                  text,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isImgEmpty
                      ? Container()
                      : imgAsset != ""
                          ? Image.asset(
                              imgAsset,
                              height: 70,
                            )
                          : Icon(
                              icon,
                              color: colorIcon,
                              size: 70,
                            ),
                ),
                SizedBox(height: 20),
                customWidget == null
                    ? Text(desc!,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(150, 150, 150, 1)),
                        textAlign: TextAlign.center)
                    : customWidget,
                SizedBox(height: 30),
                noButton == false
                    ? isOneButton
                        ? Center(
                            child: MaterialButton(
                                color: ColorsCollection.cRipple10,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsCollection.cRipple10),
                                    borderRadius: new BorderRadius.circular(8)),
                                child: Text(oneBtnLabel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.white)),
                                onPressed: onPressedOK as void Function()?))
                        : Container(
                            height: 36,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  MaterialButton(
                                      color: ColorsCollection.cRipple10,
                                      shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorsCollection.cRipple10),
                                          borderRadius:
                                              new BorderRadius.circular(8)),
                                      child: Text(leftBtnLabel ?? DictionaryUtil.no.tr.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  MaterialButton(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsCollection.cRipple10),
                                        borderRadius:
                                            new BorderRadius.circular(8),
                                      ),
                                      onPressed:
                                          onPressedOK as void Function()?,
                                      child: Text(rightBtnLabel ?? DictionaryUtil.yes.tr.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : ColorsCollection
                                                          .cRipple10)))
                                ]))
                    : Container()
              ])));
        });
  }

  void loading() {
    boxDialog(
        Get.context!,
        true,
        Center(
            child: Container(
                height: 60.w,
                width: 60.w,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? ColorsCollection.cDarkCard
                        : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                padding: EdgeInsets.all(8.0),
                child: loadingProgressIndicator())));
  }

  Future<void> boxDialog(
      BuildContext context, bool isDismissable, Widget childWidget) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: isDismissable,
        builder: (BuildContext context) {
          return childWidget;
        });
  }

  Widget loadingProgressIndicator({double height = 60, double width = 60}) {
    return Container(
        height: height,
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            colors: const [ColorsCollection.cRipple10],
            backgroundColor: Colors.transparent));
  }

  Widget lazyLoadWidget({double height = 24, double width = 24}) {
    return Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(5),
        child: CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: ColorsCollection.cIvo,
            color: Colors.green.shade50));
  }
}
