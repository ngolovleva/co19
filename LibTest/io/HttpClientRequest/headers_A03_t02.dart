/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionHttpHeaders headers
 * Returns the client request headers.
 *
 * The client request headers can be modified until the client request body is
 * written to or closed. After that they become immutable.
 * @description Checks that the client request headers become immutable after
 * the client request is closed
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test(String method) async {
  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.isNull(request.headers.value(HttpHeaders.AGE));
    request.response.write(helloWorld);
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
        var result = request.close();
        Expect.throws(() {request.headers.set(HttpHeaders.AGE, 21);});
        return result;
  }).then((HttpClientResponse response) {
    response.transform(UTF8.decoder).listen((content) {});
    asyncEnd();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}