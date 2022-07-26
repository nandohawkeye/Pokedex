import 'package:asuka/snackbars/asuka_snack_bar.dart';

class CustomSnackbar {
  static void success(String sucsess) => AsukaSnackbar.success(sucsess).show();

  static void error(String error) => AsukaSnackbar.warning(error).show();
}
