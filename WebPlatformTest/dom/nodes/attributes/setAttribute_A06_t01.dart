/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should set the first attribute with the given name
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  Element el = document.createElement("baz");
  el.setAttributeNS("ab", "attr", "fail");
  el.setAttributeNS("kl", "attr", "pass");
  el.setAttribute("attr", "pass");
  Expect.mapEquals({"attr":"pass"}, el. getNamespacedAttributes("ab"));
  Expect.mapEquals({"attr":"pass"}, el. getNamespacedAttributes("kl"));
}
