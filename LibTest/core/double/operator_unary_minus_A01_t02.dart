/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator unary-()
 * @description Checks [:unary-():] on a NaN.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";


main() {
  double nan = double.NAN;
  Expect.isTrue((-nan).isNaN);
  Expect.isTrue((-(-nan)).isNaN);
}
