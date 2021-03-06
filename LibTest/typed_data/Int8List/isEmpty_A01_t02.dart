/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isEmpty
 * Returns true if there is no element in this collection.
 * @description Checks that [isEmpty] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int8List(0);

  try {
    l.isEmpty = false;
    Expect.fail("[isEmpty] should be final");
  } on NoSuchMethodError catch(ok) {}
}
