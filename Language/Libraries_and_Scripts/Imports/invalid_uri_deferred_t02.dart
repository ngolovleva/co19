/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the specified URI of a deferred import
 * does not refer to a library declaration.
 * @description Checks that it is a static type warning if the URI in a
 * deferred import directive does not denote an existing file.
 * @static-warning
 * @author ngl@unipro.ru
 */

import "IntentionallyMissingFile.dart" deferred as p; // static type warning

main() {
  var someVar = 0;
}
