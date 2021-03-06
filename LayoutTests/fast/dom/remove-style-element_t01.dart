/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test should not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="content"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var content = document.getElementById("content");
  document.getElementById("content").innerHtml = "<style>text</style>";
  content.style.display = "none";
  content.innerHtml = '';
}
