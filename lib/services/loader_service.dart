import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoaderService {
  BuildContext context;
  ProgressDialog pr;

  static final LoaderService _instance = LoaderService._internal();
  static LoaderService get instance => _instance;
  factory LoaderService() {
    return _instance;
  }

  LoaderService._internal() {}
  Future<void> ShowLoader({String message = 'Loading'}) async {
    if (pr == null) {
      InitiateLoader(context);
    }
    pr.style(message: message);
    if (!pr.isShowing()) {
      await pr.show();
    }
  }

  Future<void> HideLoader() async {
    if (pr == null) {
      InitiateLoader(context);
    }
    if (pr.isShowing()) {
      await pr.hide();
    }
  }

  void InitiateLoader(BuildContext context) {
    this.context = context;
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal,
        textDirection: TextDirection.ltr,
        isDismissible: false);
  }
}
