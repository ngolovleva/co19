/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * This method is equivalent to this.elementAt(0).
 * @description Checks that this method is equivalent to this.elementAt(0).
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(array) {
  var l = new Uint64List.fromList(array);
  Expect.equals(l.elementAt(0), l.first);
}
void checkClear(length) {
  var l = new Uint64List(length);
  Expect.equals(l.elementAt(0), l.first);
}

main() {
  check([1]);
  check([1, 2, 3, 4, 5]);
  check([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  checkClear(1);
  checkClear(100);
}