/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientRequest> open(
 *  String method,
 *  String host,
 *  int port,
 *  String path
 *  )
 * Opens a HTTP connection.
 *
 * The HTTP method to use is specified in method, the server is specified using
 * host and port, and the path (including a possible query) is specified using
 * path. The path may also contain a URI fragment, which will be ignored.
 *
 * The Host header for the request will be set to the value host:port. This can
 * be overridden through the HttpClientRequest interface before the request is
 * sent. NOTE if host is an IP address this will still be set in the Host
 * header.
 *
 * For additional information on the sequence of events during an HTTP
 * transaction, and the objects returned by the futures, see the overall
 * documentation for the class HttpClient.
 * @description Checks that method argument is case insensitive and path is case
 * sensitive
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.equals("GET", request.method);
    Expect.equals("/Xxx", request.uri.toString());
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.open("get", localhost, server.port, "/Xxx")
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
        response.transform(UTF8.decoder).listen((content) {
          Expect.equals(helloWorld, content);
    });
  });
}

main() {
  asyncStart();
  test();
}