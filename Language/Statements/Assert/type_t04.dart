/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned
 * to either bool or () -> bool.
 * @description Checks that it is a static type warning if the type of e is
 * (Dynamic) -> bool.
 * @static-warning
 * @issue 26002
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

import '../../../Utils/dynamic_check.dart';

bool foo(x) {
  return false;
}


main() {
  try {
    assert (foo); /// static type warning
    if (isCheckedMode()) {
      Expect.fail("NoSuchMethodError expected");
    }
  } on NoSuchMethodError catch (e) {
    if (!isCheckedMode()) {
      Expect.fail("Unexpected error: $e");
    }
  }
}
