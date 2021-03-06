/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> sublist(int start, [int end])
 * It is an error if [start] or [end] are not indices into [this],
 * or if [end] is before [start].
 * @description Checks that it is an error if [end] is before [start].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Uint32List.fromList([0, 0, 0, 0]);

  Expect.throws( () {
    list.sublist(3, 2);
  });

  Expect.throws( () {
    list.sublist(4, 0);
  });
}
