/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 * scriptTag? libraryName? import* include* resource* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-time error when a top-level
 * definition (a class declaration) comes before the script tag.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

#! scripts tag    // error

main() {
  try {
    new C();
  } catch(var e) {}
}