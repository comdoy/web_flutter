import 'package:web_flutter/components/components.dart';

import 'exception.dart';

bool handleException(Object exception, {bool Function(ApiException)? onError}) {
  ApiException apiException = ApiException.from(exception);
  if (onError?.call(apiException) == true) {
    return true;
  }
  if (apiException.code == 0) {
    IToast.loading();
    return true;
  }

  IToast.show(
    apiException.message ?? ApiException.unknownException,
    position: IToastPosition.center,
  );

  return false;
}
