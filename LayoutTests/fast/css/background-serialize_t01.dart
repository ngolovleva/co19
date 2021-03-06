/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test background properties obtained by using cssText when the
 * properties are set by using style element's textContent.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <pre id='console'></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var style = document.createElement('style');
  document.head.append(style);

  test(text) {
    style.text = text;
    return style.sheet.cssRules[0].cssText;
  }

  shouldBeEqualToString(test('.test { background: none; }'), ".test { background: none; }");
  shouldBeEqualToString(test('.test { background: none; background-color: black;}'), ".test { background: none black; }");
  shouldBeEqualToString(test('.test { background: none; background-color: initial !important;}'), ".test { background-image: none; background-attachment: initial; background-color: initial !important; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial; }");
  shouldBeEqualToString(test('.test { background: initial; }'), ".test { background: initial; }");
  shouldBeEqualToString(test('.test { background: initial; background-color: black; }'), ".test { background-image: initial; background-attachment: initial; background-color: black; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial; }");
  shouldBeEqualToString(test('.test { background: inherit; }'), ".test { background: inherit; }");
  shouldBeEqualToString(test('.test { background: inherit; background-color: black; }'), ".test { background-image: inherit; background-attachment: inherit; background-color: black; background-size: inherit; background-origin: inherit; background-clip: inherit; background-position: inherit; background-repeat: inherit; }");
  shouldBeEqualToString(test('.test { background: none; background-repeat: repeat-x !important;}'), ".test { background-image: none; background-attachment: initial; background-color: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: repeat-x !important; }");
  shouldBeEqualToString(test('.test { background: none; background-repeat: repeat-x;}'), ".test { background: none repeat-x; }");
  shouldBeEqualToString(test('.test { background: none; background-position-x: 0%;}'), ".test { background: none 0%; }");
  shouldBeEqualToString(test('.test { background: none; background-position: 20% 80%;}'), ".test { background: none 20% 80%; }");
  shouldBeEqualToString(test('.test { background-position-x: 5%; }'), ".test { background-position-x: 5%; }");
  shouldBeEqualToString(test('.test { background-position-y: 5%; }'), ".test { background-position-y: 5%; }");
  shouldBeEqualToString(test('.test { background-position-x: 5%; background-position-y: 10%; }'), ".test { background-position: 5% 10%; }");
  shouldBeEqualToString(test('.test { background-position-x: 5%; background-position-y: 10% !important; }'), ".test { background-position-x: 5%; background-position-y: 10% !important; }");
  shouldBeEqualToString(stripQuotes(test('.test { background: url(dummy://test.png); }')), ".test { background: url(dummy://test.png); }");
  shouldBeEqualToString(stripQuotes(test('.test { background: url(dummy://test.png); background-color: black; }')), ".test { background: url(dummy://test.png) black; }");
}
