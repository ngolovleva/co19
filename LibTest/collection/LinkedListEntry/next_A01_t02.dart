/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E next
 * Return the successor of this element in its linked list.
 * Returns null if there is no successor in the linked list, or if this entry is
 * not currently in any list.
 * @description Checks that null is returned if there is no successor in the
 * linked list
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  MyLinkedListEntry<int> entry = new MyLinkedListEntry<int>(1);
  LinkedList list = new LinkedList();
  list.add(entry);

  Expect.isNull(entry.next);
}
