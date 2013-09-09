/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A label is an identifier followed by a colon. A labeled statement is a statement
 * prefixed by a label L. A labeled case clause is a case clause within a switch
 * statement (11.8) prefixed by a label L.
 * The sole role of labels is to provide targets for the break (11.12) and continue
 * (11.13) statements.
 * label:
 * identifier ':'
 * ;
 * @description Checks that it is a compile-time error if a label is used in a wrong context
 * (next to an import declaration).
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

Label: import "../../Utils/dynamic_check.dart";

main() {
}