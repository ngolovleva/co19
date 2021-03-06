/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeLast()
 * Removes and returns the last element of the queue.
 * @description Checks that exactly the last element is removed and returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  list.addLast(1);
  list.addLast("2");
  list.addLast(true);

  Expect.isTrue(list.length == 3);

  Expect.isTrue(list.removeLast() == true);
  Expect.isTrue(list.length == 2);
  Expect.isTrue(list.last == "2");

  Expect.isTrue(list.removeLast() == "2");
  Expect.isTrue(list.length == 1);
  Expect.isTrue(list.last == 1);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 0);

  list = new DoubleLinkedQueue();
  list.addLast(1);
  list.addLast(1);
  list.addLast(1);

  Expect.isTrue(list.length == 3);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 2);
  Expect.isTrue(list.last == 1);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 1);
  Expect.isTrue(list.last == 1);

  Expect.isTrue(list.removeLast() == 1);
  Expect.isTrue(list.length == 0);
}
