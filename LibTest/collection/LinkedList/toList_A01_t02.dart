/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements are in iteration order. The list is fixed-length if growable is false.
 * @description Checks that the list created with growable==true can change it's size.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(List a0) {
  List<MyLinkedListEntry> list=toLinkedList(a0).toList();
  list.add(new MyLinkedListEntry(null));
}

main() {
  check([]);
  check(["1","2","3","4","5"]);
  check([null, [null], [], [1,2,3], [[null]]]);
}
