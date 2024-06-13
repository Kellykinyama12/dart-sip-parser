import 'package:dart_sip_parser/dart_sip_parser.dart';
import 'package:test/test.dart';

void main() {
  //test('String.split() splits the string on the delimiter', () {
  var m = [
    'INVITE sip:bob@biloxi.com SIP/2.0',
    'Via: SIP/2.0/UDP pc33.atlanta.com;branch=z9hG4bK776asdhds',
    'Max-Forwards: 70',
    'To: Bob <sip:bob@biloxi.com>',
    'From: Alice <sip:alice@atlanta.com>;tag=1928301774',
    'Call-ID: a84b4c76e66710@pc33.atlanta.com',
    'CSeq: 314159 INVITE',
    'Contact: <sip:alice@pc33.atlanta.com>',
    'Content-Type: application/sdp',
    'Content-Length: 142',
    'Authorization: Digest username="Alice", realm="atlanta.com", nonce="84a4cc6f3082121f32b42a2187831a9e", response="7587245234b3434cc3412213e5f113a5432"',
    'Proxy-Authorization: Digest username="Alice", realm="atlanta.com", nonce="84a4cc6f3082121f32b42a2187831a9e", response="7587245234b3434cc3412213e5f113a5432"',
    'WWW-Authenticate: Digest realm="atlanta.com", nonce="84a4cc6f3082121f32b42a2187831a9e"',
    'Authentication-Info: nextnonce="1234"',
    'Refer-To: sip:100@somewhere.net',
    r'\r\n'
  ].join(r'\r\n');

  SipMsg sipMsg = SipMsg();
  sipMsg.Parse(m);

  var register = [
    'REGISTER sip:10.100.54.52:5060;transport=UDP SIP/2.0',
    'Via: SIP/2.0/UDP 10.100.54.52:60901;branch=z9hG4bK-524287-1---0f3eb40b11f97a9c;rport',
    'Max-Forwards: 70',
    'Contact: <sip:6002@10.100.54.52:60901;rinstance=1964f334d2b5ba69;transport=UDP>',
    'To: <sip:6002@10.100.54.52:5060;transport=UDP>',
    'From: <sip:6002@10.100.54.52:5060;transport=UDP>;tag=5e00e125',
    'Call-ID: wSSsR1c-lUjKuRhxr0iEKA..',
    'CSeq: 1 REGISTER',
    'Expires: 70',
    'Allow: INVITE, ACK, CANCEL, BYE, NOTIFY, REFER, MESSAGE, OPTIONS, INFO, SUBSCRIBE',
    'Supported: replaces, norefersub, extended-refer, timer, sec-agree, outbound, path, X-cisco-serviceuri',
    'User-Agent: Z 5.6.1 v2.10.19.9',
    'Allow-Events: presence, kpml, talk, as-feature-event',
    'Content-Length: 0'
  ].join(r'\r\n');

  SipMsg sipMsg2 = SipMsg();
  sipMsg2.Parse(register);
  print(sipMsg2.Exp.Value);

  //   method: 'INVITE'
  // uri: 'sip:bob@biloxi.com'
  // version: '2.0'
  // headers:
  //   via: [{version: '2.0', protocol: 'UDP', host: 'pc33.atlanta.com', port: undefined, params:{branch: 'z9hG4bK776asdhds'}}]
  //   'max-forwards': '70'
  //   to: {name: 'Bob', uri: 'sip:bob@biloxi.com', params: {}}
  //   from: {name: 'Alice', uri: 'sip:alice@atlanta.com', params: {tag: '1928301774'}}
  //   'call-id': 'a84b4c76e66710@pc33.atlanta.com'
  //   cseq: {seq: 314159, method: 'INVITE'}
  //   contact: [{name: undefined, uri: 'sip:alice@pc33.atlanta.com', params: {}}]
  //   'content-type': 'application/sdp'
  //   'content-length': 142
  //   authorization: [
  //     scheme: 'Digest'
  //     username: '"Alice"'
  //     realm: '"atlanta.com"'
  //     nonce: '"84a4cc6f3082121f32b42a2187831a9e"'
  //     response: '"7587245234b3434cc3412213e5f113a5432"'
  //   ]
  //   'proxy-authorization': [
  //     scheme: 'Digest'
  //     username: '"Alice"'
  //     realm: '"atlanta.com"'
  //     nonce: '"84a4cc6f3082121f32b42a2187831a9e"'
  //     response: '"7587245234b3434cc3412213e5f113a5432"'
  //   ]
  //   'www-authenticate': [
  //     scheme: 'Digest'
  //     realm: '"atlanta.com"'
  //     nonce: '"84a4cc6f3082121f32b42a2187831a9e"'
  //   ]
  //   'authentication-info': {nextnonce: '"1234"'}
  //   'refer-to': {name: undefined, uri: 'sip:100@somewhere.net', params: {}}
  // content: ''

  // expect(sipMsg.Req.Method, 'INVITE');
  // expect(sipMsg.Req.UriType, 'sip');
  // expect(sipMsg.Req.User, 'bob');
  // expect(sipMsg.Req.Host, 'biloxi.com');
  // expect(sipMsg.Req.Port, null);
  // expect(sipMsg.Req.UserType, null);
  // expect(sipMsg.Req.Src, null);
  // expect(sipMsg.Req.StatusCode, null);
  // expect(sipMsg.Req.StatusDesc, null);

  // expect(sipMsg.Via[0].Trans, 'UDP');
  // expect(sipMsg.Via[0].Host, 'pc33.atlanta.com');
  // expect(sipMsg.Via[0].Port, null);
  // expect(sipMsg.Via[0].Branch, 'z9hG4bK776asdhds');
  //expect(sipMsg.Via[0].Rport, null);
  //expect(sipMsg.Via[0].Maddr, null);
  //expect(sipMsg.Via[0].Ttl, null);
  //expect(sipMsg.Via[0].Rcvd, null);
  //expect(sipMsg.Via[0].Src, null);
  //});

  var badaspec = r"OPTIONS sip:user@example.org SIP/2.0\r\n" +
      r"Via: SIP/2.0/UDP host4.example.com:5060;branch=z9hG4bKkdju43234\r\n" +
      r"Max-Forwards: 70" +
      r'From: "Bell, Alexander" <sip:a.g.bell@example.com>;tag=433423\r\n' +
      r'To: "Watson, Thomas" < sip:t.watson@example.org >\r\n' +
      r"Call-ID: badaspec.sdf0234n2nds0a099u23h3hnnw009cdkne3\r\n" +
      r"Accept: application/sdp\r\n" +
      r"CSeq: 3923239 OPTIONS\r\n" +
      r"l: 0\r\n";

  var badbranch = r"""OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.org;tag=33242\r\n
Max-Forwards: 3\r\n
Via: SIP/2.0/UDP 192.0.2.1;branch=z9hG4bK\r\n
Accept: application/sdp\r\n
Call-ID: badbranch.sadonfo23i420jv0as0derf3j3n\r\n
CSeq: 8 OPTIONS\r\n
l: 0\r\n""";

  var badcseq = r"""INVITE sip:user@example.com SIP/2.0\r\n
Contact: <sip:caller@host5.example.net>\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=8392034\r\n
Max-Forwards: 70\r\n
Call-ID: invut.0ha0isndaksdjadsfij34n23d\r\n
CSeq: fhdjkgfhdkjhgkj\r\n
Via: SIP/2.0/UDP somehost.example.com;branch=z9hG4bKkdjuw\r\n
Content-Type: application/unknownformat\r\n
Content-Length: 40\r\n
""";

  var baddate = r"""
INVITE sip:user@example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=2234923\r\n
Max-Forwards: 70\r\n
Call-ID: baddate.239423mnsadf3j23lj42--sedfnm234\r\n
CSeq: 1392934 INVITE\r\n
Via: SIP/2.0/UDP host.example.com;branch=z9hG4bKkdjuw\r\n
Date: Fri, 01 Jan 2010 16:00:00 EST\r\n
Contact: <sip:caller@host5.example.net>\r\n
Content-Type: application/sdp\r\n
Content-Length: 150\r\n
\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.5\r\n
s=-\r\n
c=IN IP4 192.0.2.5\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n""";

  var baddn = r"""
OPTIONS sip:t.watson@example.org SIP/2.0\r\n
Via:     SIP/2.0/UDP c.example.com:5060;branch=z9hG4bKkdjuw\r\n
Max-Forwards:      70\r\n
From:    Bell, Alexander <sip:a.g.bell@example.com>;tag=43\r\n
To:      Watson, Thomas <sip:t.watson@example.org>\r\n
Call-ID: baddn.31415@c.example.com\r\n
Accept: application/sdp\r\n
CSeq:    3923239 OPTIONS\r\n
l: 0
""";

  var badinv01 = r"""
INVITE sip:user@example.com SIP/2.0\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=134161461246\r\n
Max-Forwards: 7\r\n
Call-ID: badinv01.0ha0isndaksdjasdf3234nas\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.15;;,;,,\r\n
Contact: "Joe" <sip:joe@example.org>;;;;\r\n
Content-Length: 152\r\n
Content-Type: application/sdp\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.15\r\n
s=-\r\n
c=IN IP4 192.0.2.15\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var badvers = r"""
OPTIONS sip:t.watson@example.org SIP/7.0\r\n
Via:     SIP/7.0/UDP c.example.com;branch=z9hG4bKkdjuw\r\n
Max-Forwards:     70\r\n
From:    A. Bell <sip:a.g.bell@example.com>;tag=qweoiqpe\r\n
To:      T. Watson <sip:t.watson@example.org>\r\n
Call-ID: badvers.31417@c.example.com\r\n
CSeq:    1 OPTIONS\r\n
l: 0\r\n
""";

  var bcas = r"""
SIP/2.0 200 OK\r\n
Via: SIP/2.0/UDP 192.0.2.198;branch=z9hG4bK1324923\r\n
Via: SIP/2.0/UDP 255.255.255.255;branch=z9hG4bK1saber23\r\n
Call-ID: bcast.0384840201234ksdfak3j2erwedfsASdf\r\n
CSeq: 35 INVITE\r\n
From: sip:user@example.com;tag=11141343\r\n
To: sip:user@example.edu;tag=2229\r\n
Content-Length: 154\r\n
Content-Type: application/sdp\r\n
Contact: <sip:user@host28.example.com>\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.198\r\n
s=-\r\n
c=IN IP4 192.0.2.198\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var bext01 = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:j_user@example.com\r\n
From: sip:caller@example.net;tag=242etr\r\n
Max-Forwards: 6\r\n
Call-ID: bext01.0ha0isndaksdj\r\n
Require: nothingSupportsThis, nothingSupportsThisEither\r\n
Proxy-Require: noProxiesSupportThis, norDoAnyProxiesSupportThis\r\n
CSeq: 8 OPTIONS\r\n
Via: SIP/2.0/TLS fold-and-staple.example.com;branch=z9hG4bKkdjuw\r\n
Content-Length: 0\r\n
""";

  var bigcode = r"""
SIP/2.0 4294967301 better not break the receiver\r\n
Via: SIP/2.0/UDP 192.0.2.105;branch=z9hG4bK2398ndaoe\r\n
Call-ID: bigcode.asdof3uj203asdnf3429uasdhfas3ehjasdfas9i\r\n
CSeq: 353494 INVITE\r\n
From: <sip:user@example.com>;tag=39ansfi3\r\n
To: <sip:user@example.edu>;tag=902jndnke3\r\n
Content-Length: 0\r\n
Contact: <sip:user@host105.example.com>\r\n
""";

  var clerr = r"""
INVITE sip:user@example.com SIP/2.0\r\n
Max-Forwards: 80\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=93942939o2\r\n
Contact: <sip:caller@hungry.example.net>\r\n
Call-ID: clerr.0ha0isndaksdjweiafasdk3\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP host5.example.com;branch=z9hG4bK-39234-23523\r\n
Content-Type: application/sdp\r\n
Content-Length: 9999\r\n
\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.155\r\n
s=-\r\n
c=IN IP4 192.0.2.155\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var cparam = r"""
REGISTER sip:example.com SIP/2.0\r\n
Via: SIP/2.0/UDP saturn.example.com:5060;branch=z9hG4bKkdjuw\r\n
Max-Forwards: 70\r\n
From: sip:watson@example.com;tag=DkfVgjkrtMwaerKKpe\r\n
To: sip:watson@example.com\r\n
Call-ID: cparam01.70710@saturn.example.com\r\n
CSeq: 2 REGISTER\r\n
Contact: sip:+19725552222@gw1.example.net;unknownparam\r\n
l: 0\r\n
""";

  var cparam2 = r"""
REGISTER sip:example.com SIP/2.0\r\n
Via: SIP/2.0/UDP saturn.example.com:5060;branch=z9hG4bKkdjuw\r\n
Max-Forwards: 70\r\n
From: sip:watson@example.com;tag=838293\r\n
To: sip:watson@example.com\r\n
Call-ID: cparam02.70710@saturn.example.com\r\n
CSeq: 3 REGISTER\r\n
Contact: <sip:+19725552222@gw1.example.net;unknownparam>\r\n
l: 0\r\n
""";

  var dbl = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: sip:j.user@example.com\r\n
From: sip:j.user@example.com;tag=43251j3j324\r\n
Max-Forwards: 8\r\n
I: dblreq.0ha0isndaksdj99sdfafnl3lk233412\r\n
Contact: sip:j.user@host.example.com\r\n
CSeq: 8 REGISTER\r\n
Via: SIP/2.0/UDP 192.0.2.125;branch=z9hG4bKkdjuw23492\r\n
Content-Length: 0\r\n
""";

  var env = r"""
INVITE sip:joe@example.com SIP/2.0\r\n
t: sip:joe@example.com\r\n
From: sip:caller@example.net;tag=141334\r\n
Max-Forwards: 8\r\n
Call-ID: dblreq.0ha0isnda977644900765@192.0.2.15\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.15;branch=z9hG4bKkdjuw380234\r\n
Content-Type: application/sdp\r\n
Content-Length: 150\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.15\r\n
s=-\r\n
c=IN IP4 192.0.2.15\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m =video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var esc01 = r"""
INVITE sip:sips%3Auser%40example.com@example.net SIP/2.0\r\n
To: sip:%75se%72@example.com\r\n
From: <sip:I%20have%20spaces@example.net>;tag=938\r\n
Max-Forwards: 87\r\n
i: esc01.239409asdfakjkn23onasd0-3234\r\n
CSeq: 234234 INVITE\r\n
Via: SIP/2.0/UDP host5.example.net;branch=z9hG4bKkdjuw\r\n
C: application/sdp\r\n
Contact:\r\n
  <sip:cal%6Cer@host5.example.net;%6C%72;n%61me=v%61lue%25%34%31>\r\n
Content-Length: 150\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.1\r\n
s=-\r\n
c=IN IP4 192.0.2.1\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var ec02 = r"""
RE%47IST%45R sip:registrar.example.com SIP/2.0\r\n
To: "%Z%45" <sip:resource@example.com>\r\n
From: "%Z%45" <sip:resource@example.com>;tag=f232jadfj23\r\n
Call-ID: esc02.asdfnqwo34rq23i34jrjasdcnl23nrlknsdf\r\n
Via: SIP/2.0/TCP host.example.com;branch=z9hG4bK209%fzsnel234\r\n
CSeq: 29344 RE%47IST%45R\r\n
Max-Forwards: 70\r\n
Contact: <sip:alias1@host1.example.com>\r\n
C%6Fntact: <sip:alias2@host2.example.com>\r\n
Contact: <sip:alias3@host3.example.com>\r\n
l: 0\r\n
""";

  var ecnull = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: sip:null-%00-null@example.com\r\n
From: sip:null-%00-null@example.com;tag=839923423\r\n
Max-Forwards: 70\r\n
Call-ID: escnull.39203ndfvkjdasfkq3w4otrq0adsfdfnavd\r\n
CSeq: 14398234 REGISTER\r\n
Via: SIP/2.0/UDP host5.example.com;branch=z9hG4bKkdjuw\r\n
Contact: <sip:%00@host5.example.com>\r\n
Contact: <sip:%00%00@host5.example.com>\r\n
L:0\r\n
""";

  var escruri = r"""
INVITE sip:user@example.com?Route=%3Csip:example.com%3E SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=341518\r\n
Max-Forwards: 7\r\n
Contact: <sip:caller@host39923.example.net>\r\n
Call-ID: escruri.23940-asdfhj-aje3br-234q098w-fawerh2q-h4n5\r\n
CSeq: 149209342 INVITE\r\n
Via: SIP/2.0/UDP host-of-the-hour.example.com;branch=z9hG4bKkdjuw\r\n
Content-Type: application/sdp\r\n
Content-Length: 150\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.1\r\n
s=-\r\n
c=IN IP4 192.0.2.1\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var insuf = r"""
INVITE sip:user@example.com SIP/2.0\r\n
CSeq: 193942 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.95;branch=z9hG4bKkdj.insuf\r\n
Content-Type: application/sdp\r\n
l: 152\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.95\r\n
s=-\r\n
c=IN IP4 192.0.2.95\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var intmeth = r"""
!interesting-Method0123456789_*+`.%indeed'~ sip:1_unusual.URI~(to-be!sure)&isn't+it\$/crazy?,/;;*:&it+has=1,weird!*pas\$wo~d_too.(doesn't-it)@example.com SIP/2.0\r\n
Via: SIP/2.0/TCP host1.example.com;branch=z9hG4bK-.!%66*_+`'~\r\n
To: "BEL:\ NUL:\ DEL:" <sip:1_unusual.URI~(to-be!sure)&isn't+it\$/crazy?,/;;*@example.com>\r\n
From: token1~` token2'+_ token3*%!.- <sip:mundane@example.com>;fromParam''~+*_!.-%="работающий";tag=_token~1'+`*%!-.\r\n
Call-ID: intmeth.word%ZK-!.*_+'@word`~)(><:\/"][?}{\r\n
CSeq: 139122385 !interesting-Method0123456789_*+`.%indeed'~\r\n
Max-Forwards: 255\r\n
extensionHeader-!.%*+_`'~:﻿大停電\r\n
Content-Length: 0\r\n
""";

  var inv2543 = r"""
INVITE sip:UserB@example.com SIP/2.0\r\n
Via: SIP/2.0/UDP iftgw.example.com\r\n
From: <sip:+13035551111@ift.client.example.net;user=phone>\r\n
Record-Route: <sip:UserB@example.com;maddr=ss1.example.com>\r\n
To: sip:+16505552222@ss1.example.net;user=phone\r\n
Call-ID: inv2543.1717@ift.client.example.com\r\n
CSeq: 56 INVITE\r\n
Content-Type: application/sdp\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.5\r\n
s=-\r\n
c=IN IP4 192.0.2.5\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0\r\n
""";

  var invut = r"""
INVITE sip:user@example.com SIP/2.0\r\n
Contact: <sip:caller@host5.example.net>\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=8392034\r\n
Max-Forwards: 70\r\n
Call-ID: invut.0ha0isndaksdjadsfij34n23d\r\n
CSeq: 235448 INVITE\r\n
Via: SIP/2.0/UDP somehost.example.com;branch=z9hG4bKkdjuw\r\n
Content-Type: application/unknownformat\r\n
Content-Length: 40\r\n
""";

  var longreq = r"""
INVITE sip:user@example.com SIP/2.0\r\n
To: "I have a user name of extremeextremeextremeextremeextremeextremeextremeextremeextremeextreme proportion"<sip:user@example.com:6000;unknownparam1=verylonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglongvalue;longparamnamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename=shortvalue;verylonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglongParameterNameWithNoValue>\r\n
F: sip:amazinglylongcallernameamazinglylongcallernameamazinglylongcallernameamazinglylongcallernameamazinglylongcallername@example.net;tag=12982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982982424;unknownheaderparamnamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename=unknowheaderparamvaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue;unknownValuelessparamnameparamnameparamnameparamnameparamnameparamnameparamnameparamnameparamnameparamname\r\n
Call-ID: longreq.onereallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallylongcallid\r\n
CSeq: 3882340 INVITE\r\n
Unknown-LongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLong-Name: unknown-longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong-value; unknown-longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong-parameter-name = unknown-longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong-parameter-value\r\n
Via: SIP/2.0/TCP sip33.example.com\r\n
v: SIP/2.0/TCP sip32.example.com\r\n
V: SIP/2.0/TCP sip31.example.com\r\n
Via: SIP/2.0/TCP sip30.example.com\r\n
ViA: SIP/2.0/TCP sip29.example.com\r\n
VIa: SIP/2.0/TCP sip28.example.com\r\n
VIA: SIP/2.0/TCP sip27.example.com\r\n
via: SIP/2.0/TCP sip26.example.com\r\n
viA: SIP/2.0/TCP sip25.example.com\r\n
vIa: SIP/2.0/TCP sip24.example.com\r\n
vIA: SIP/2.0/TCP sip23.example.com\r\n
V :  SIP/2.0/TCP sip22.example.com\r\n
v :  SIP/2.0/TCP sip21.example.com\r\n
V  : SIP/2.0/TCP sip20.example.com\r\n
v  : SIP/2.0/TCP sip19.example.com\r\n
Via : SIP/2.0/TCP sip18.example.com\r\n
Via  : SIP/2.0/TCP sip17.example.com\r\n
Via: SIP/2.0/TCP sip16.example.com\r\n
Via: SIP/2.0/TCP sip15.example.com\r\n
Via: SIP/2.0/TCP sip14.example.com\r\n
Via: SIP/2.0/TCP sip13.example.com\r\n
Via: SIP/2.0/TCP sip12.example.com\r\n
Via: SIP/2.0/TCP sip11.example.com\r\n
Via: SIP/2.0/TCP sip10.example.com\r\n
Via: SIP/2.0/TCP sip9.example.com\r\n
Via: SIP/2.0/TCP sip8.example.com\r\n
Via: SIP/2.0/TCP sip7.example.com\r\n
Via: SIP/2.0/TCP sip6.example.com\r\n
Via: SIP/2.0/TCP sip5.example.com\r\n
Via: SIP/2.0/TCP sip4.example.com\r\n
Via: SIP/2.0/TCP sip3.example.com\r\n
Via: SIP/2.0/TCP sip2.example.com\r\n
Via: SIP/2.0/TCP sip1.example.com\r\n
Via: SIP/2.0/TCP host.example.com;received=192.0.2.5;branch=verylonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglongbranchvalue\r\n
Max-Forwards: 70\r\n
Contact: <sip:amazinglylongcallernameamazinglylongcallernameamazinglylongcallernameamazinglylongcallernameamazinglylongcallername@host5.example.net>\r\n
Content-Type: application/sdp\r\n
l: 150\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.1\r\n
s=-\r\n
c=IN IP4 192.0.2.1\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var ltgtruri = r"""
INVITE <sip:user@example.com> SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=39291\r\n
Max-Forwards: 23\r\n
Call-ID: ltgtruri.1@192.0.2.5\r\n
CSeq: 1 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.5\r\n
Contact: <sip:caller@host5.example.net>\r\n
Content-Type: application/sdp\r\n
Content-Length: 159\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.5\r\n
s=-\r\n
c=IN IP4 192.0.2.5\r\n
t=3149328700 0\r\n
m=audio 49217 RTP/AVP 0 12
m=video 3227 RTP/AVP 31
a=rtpmap:31 LPC
""";

  var lwsdip = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: caller<sip:caller@example.com>;tag=323\r\n
Max-Forwards: 70\r\n
Call-ID: lwsdisp.1234abcd@funky.example.com\r\n
CSeq: 60 OPTIONS\r\n
Via: SIP/2.0/UDP funky.example.com;branch=z9hG4bKkdjuw\r\n
l: 0\r\n
""";

  var lwsruri = r"""
INVITE sip:user@example.com; lr SIP/2.0\r\n
To: sip:user@example.com;tag=3xfe-9921883-z9f\r\n
From: sip:caller@example.net;tag=231413434\r\n
Max-Forwards: 5\r\n
Call-ID: lwsruri.asdfasdoeoi2323-asdfwrn23-asd834rk423\r\n
CSeq: 2130706432 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.1:5060;branch=z9hG4bKkdjuw2395\r\n
Contact: <sip:caller@host1.example.net>\r\n
Content-Type: application/sdp\r\n
Content-Length: 159\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.1\r\n
s=-\r\n
c=IN IP4 192.0.2.1\r\n
t=3149328700 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var lwsstart = r"""
INVITE  sip:user@example.com  SIP/2.0
Max-Forwards: 8
To: sip:user@example.com
From: sip:caller@example.net;tag=8814
Call-ID: lwsstart.dfknq234oi243099adsdfnawe3@example.com
CSeq: 1893884 INVITE
Via: SIP/2.0/UDP host1.example.com;branch=z9hG4bKkdjuw3923
Contact: <sip:caller@host1.example.net>
Content-Type: application/sdp
Content-Length: 150

v=0
o=mhandley 29739 7272939 IN IP4 192.0.2.1
s=-
c=IN IP4 192.0.2.1
t=0 0
m=audio 49217 RTP/AVP 0 12
m=video 3227 RTP/AVP 31
a=rtpmap:31 LPC
""";

  var mcl01 = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
Via: SIP/2.0/UDP host5.example.net;branch=z9hG4bK293423\r\n
To: sip:user@example.com\r\n
From: sip:other@example.net;tag=3923942\r\n
Call-ID: mcl01.fhn2323orihawfdoa3o4r52o3irsdf\r\n
CSeq: 15932 OPTIONS\r\n
Content-Length: 13\r\n
Max-Forwards: 60\r\n
Content-Length: 5\r\n
Content-Type: text/plain\r\n
\r\n
There's no way to know how many octets are supposed to be here.\r\n
""";

  var mismatch01 = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=34525\r\n
Max-Forwards: 6\r\n
Call-ID: mismatch01.dj0234sxdfl3\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP host.example.com;branch=z9hG4bKkdjuw\r\n
l: 0\r\n
""";

  var mismatch02 = r"""
NEWMETHOD sip:user@example.com SIP/2.0\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=34525\r\n
Max-Forwards: 6\r\n
Call-ID: mismatch02.dj0234sxdfl3\r\n
CSeq: 8 INVITE\r\n
Contact: <sip:caller@host.example.net>\r\n
Via: SIP/2.0/UDP host.example.net;branch=z9hG4bKkdjuw\r\n
Content-Type: application/sdp\r\n
l: 138\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.1\r\n
c=IN IP4 192.0.2.1\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var multi01 = r"""
INVITE sip:user@company.com SIP/2.0\r\n
Contact: <sip:caller@host25.example.net>\r\n
Via: SIP/2.0/UDP 192.0.2.25;branch=z9hG4bKkdjuw\r\n
Max-Forwards: 70\r\n
CSeq: 5 INVITE\r\n
Call-ID: multi01.98asdh@192.0.2.1\r\n
CSeq: 59 INVITE\r\n
Call-ID: multi01.98asdh@192.0.2.2\r\n
From: sip:caller@example.com;tag=3413415\r\n
To: sip:user@example.com\r\n
To: sip:other@example.net\r\n
From: sip:caller@example.net;tag=2923420123\r\n
Content-Type: application/sdp\r\n
l: 154\r\n
Contact: <sip:caller@host36.example.net>\r\n
Max-Forwards: 5\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.25\r\n
s=-\r\n
c=IN IP4 192.0.2.25\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var ncldart = r"""
INVITE sip:user@example.com SIP/2.0\r\n
Max-Forwards: 254\r\n
To: sip:j.user@example.com\r\n
From: sip:caller@example.net;tag=32394234\r\n
Call-ID: ncl.0ha0isndaksdj2193423r542w35\r\n
CSeq: 0 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.53;branch=z9hG4bKkdjuw\r\n
Contact: <sip:caller@example53.example.net>\r\n
Content-Type: application/sdp\r\n
Content-Length: -999\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.53\r\n
s=-\r\n
c=IN IP4 192.0.2.53\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var noreason = r"""
SIP/2.0 100 \r\n
Via: SIP/2.0/UDP 192.0.2.105;branch=z9hG4bK2398ndaoe\r\n
Call-ID: noreason.asndj203insdf99223ndf\r\n
CSeq: 35 INVITE\r\n
From: <sip:user@example.com>;tag=39ansfi3\r\n
To: <sip:user@example.edu>;tag=902jndnke3\r\n
Content-Length: 0\r\n
Contact: <sip:user@host105.example.com>\r\n
""";

  var novelsc = r"""
OPTIONS soap.beep://192.0.2.103:3002 SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=384\r\n
Max-Forwards: 3\r\n
Call-ID: novelsc.asdfasser0q239nwsdfasdkl34\r\n
CSeq: 3923423 OPTIONS\r\n
Via: SIP/2.0/TCP host9.example.com;branch=z9hG4bKkdjuw39234\r\n
Content-Length: 0\r\n
""";

  var quotbal = r"""
INVITE sip:user@example.com SIP/2.0\r\n
To: "Mr. J. User <sip:j.user@example.com>\r\n
From: sip:caller@example.net;tag=93334\r\n
Max-Forwards: 10\r\n
Call-ID: quotbal.aksdj\r\n
Contact: <sip:caller@host59.example.net>\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.59:5050;branch=z9hG4bKkdjuw39234\r\n
Content-Type: application/sdp\r\n
Content-Length: 152\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.15\r\n
s=-\r\n
c=IN IP4 192.0.2.15\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var regauth01 = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: sip:j.user@example.com\r\n
From: sip:j.user@example.com;tag=87321hj23128\r\n
Max-Forwards: 8\r\n
Call-ID: regaut01.0ha0isndaksdj\r\n
CSeq: 9338 REGISTER\r\n
Via: SIP/2.0/TCP 192.0.2.253;branch=z9hG4bKkdjuw\r\n
Authorization: NoOneKnowsThisScheme opaque-data=here\r\n
Content-Length:0\r\n
""";

  var regbadct = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:user@example.com;tag=998332\r\n
Max-Forwards: 70\r\n
Call-ID: regbadct.k345asrl3fdbv@10.0.0.1\r\n
CSeq: 1 REGISTER\r\n
Via: SIP/2.0/UDP 135.180.130.133:5060;branch=z9hG4bKkdjuw\r\n
Contact: sip:user@example.com?Route=%3Csip:sip.example.com%3E\r\n
l: 0\r\n
""";

  var regescsrt = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:user@example.com;tag=8\r\n
Max-Forwards: 70\r\n
Call-ID: regescrt.k345asrl3fdbv@192.0.2.1\r\n
CSeq: 14398234 REGISTER\r\n
Via: SIP/2.0/UDP host5.example.com;branch=z9hG4bKkdjuw\r\n
M: <sip:user@example.com?Route=%3Csip:sip.example.com%3E>\r\n
L:0\r\n
""";

  var scalar02 = r"""
REGISTER sip:example.com SIP/2.0\r\n
Via: SIP/2.0/TCP host129.example.com;branch=z9hG4bK342sdfoi3\r\n
To: <sip:user@example.com>\r\n
From: <sip:user@example.com>;tag=239232jh3\r\n
CSeq: 36893488147419103232 REGISTER\r\n
Call-ID: scalar02.23o0pd9vanlq3wnrlnewofjas9ui32\r\n
Max-Forwards: 300\r\n
Expires: 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\r\n
Contact: <sip:user@host129.example.com>\r\n
  ;expires=280297596632815\r\n
Content-Length: 0\r\n
""";

  var scalarg = r"""
SIP/2.0 503 Service Unavailable\r\n
Via: SIP/2.0/TCP host129.example.com;branch=z9hG4bKzzxdiwo34sw;received=192.0.2.129\r\n
To: <sip:user@example.com>\r\n
From: <sip:other@example.net>;tag=2easdjfejw\r\n
CSeq: 9292394834772304023312 OPTIONS\r\n
Call-ID: scalarlg.noase0of0234hn2qofoaf0232aewf2394r\r\n
Retry-After: 949302838503028349304023988\r\n
Warning: 1812 overture "In Progress"\r\n
Content-Length: 0\r\n
""";

  var sdp01 = r"""
INVITE sip:user@example.com SIP/2.0\r\n
To: sip:j_user@example.com\r\n
Contact: <sip:caller@host15.example.net>\r\n
From: sip:caller@example.net;tag=234\r\n
Max-Forwards: 5\r\n
Call-ID: sdp01.ndaksdj9342dasdd\r\n
Accept: text/nobodyKnowsThis\r\n
CSeq: 8 INVITE\r\n
Via: SIP/2.0/UDP 192.0.2.15;branch=z9hG4bKkdjuw\r\n
Content-Length: 150\r\n
Content-Type: application/sdp\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.5\r\n
s=-\r\n
c=IN IP4 192.0.2.5\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var semiuri = r"""
OPTIONS sip:user;par=u%40example.net@example.com SIP/2.0\r\n
To: sip:j_user@example.com\r\n
From: sip:caller@example.org;tag=33242\r\n
Max-Forwards: 3\r\n
Call-ID: semiuri.0ha0isndaksdj\r\n
CSeq: 8 OPTIONS\r\n
Accept: application/sdp, application/pkcs7-mime,
        multipart/mixed, multipart/signed,
        message/sip, message/sipfrag
Via: SIP/2.0/UDP 192.0.2.1;branch=z9hG4bKkdjuw\r\n
l: 0\r\n
""";

  var test2 = r"""
INVITE sip:alan@jasomi.com\r\n
TO : alan@jasomi.com\r\n
From: ralph@example.com\r\n
MaX-fOrWaRdS: 0068\r\n
Call-ID: test.0ha0isndaksdj@192.0.2.1\r\n
Xyzzy-2: this is the number ten : 10\r\n
Xyzzy-3: INVITE\r\n
Xyzzy: 10000000000\r\n
Meaning: foo bar spam\r\n
Foobar roobar\r\n
Content-Length: 18\r\n
Content-Type: application/sdp\r\n
\r\n
v=0\r\n
testing=123\r\n
""";

  var transports = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: <sip:caller@example.com>;tag=323\r\n
Max-Forwards: 70\r\n
Call-ID:  transports.kijh4akdnaqjkwendsasfdj\r\n
Accept: application/sdp\r\n
CSeq: 60 OPTIONS\r\n
Via: SIP/2.0/UDP t1.example.com;branch=z9hG4bKkdjuw\r\n
Via: SIP/2.0/SCTP t2.example.com;branch=z9hG4bKklasjdhf\r\n
Via: SIP/2.0/TLS t3.example.com;branch=z9hG4bK2980unddj\r\n
Via: SIP/2.0/UNKNOWN t4.example.com;branch=z9hG4bKasd0f3en\r\n
Via: SIP/2.0/TCP t5.example.com;branch=z9hG4bK0a9idfnee\r\n
l: 0\r\n
""";

  var trws = r"""
OPTIONS sip:remote-target@example.com SIP/2.0\r\n
Via: SIP/2.0/TCP host1.examle.com;branch=z9hG4bK299342093\r\n
To: <sip:remote-target@example.com>\r\n
From: <sip:local-resource@example.com>;tag=329429089\r\n
Call-ID: trws.oicu34958239neffasdhr2345r\r\n
Accept: application/sdp\r\n
CSeq: 238923 OPTIONS\r\n
Max-Forwards: 70\r\n
Content-Length: 0\r\n
""";

  var unkscm = r"""
OPTIONS nobodyKnowsThisScheme:totallyopaquecontent SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=384\r\n
Max-Forwards: 3\r\n
Call-ID: unkscm.nasdfasser0q239nwsdfasdkl34\r\n
CSeq: 3923423 OPTIONS\r\n
Via: SIP/2.0/TCP host9.example.com;branch=z9hG4bKkdjuw39234\r\n
Content-Length: 0\r\n
""";

  var unksm2 = r"""
REGISTER sip:example.com SIP/2.0\r\n
To: isbn:2983792873\r\n
From: <http://www.example.com>;tag=3234233\r\n
Call-ID: unksm2.daksdj@hyphenated-host.example.com\r\n
CSeq: 234902 REGISTER\r\n
Max-Forwards: 70\r\n
Via: SIP/2.0/UDP 192.0.2.21:5060;branch=z9hG4bKkdjuw\r\n
Contact: <name:John_Smith>\r\n
l: 0\r\n
""";

  var unreason = r"""
SIP/2.0 200 = 2**3 * 5**2 но сто девяносто девять - простое\r\n
Via: SIP/2.0/UDP 192.0.2.198;branch=z9hG4bK1324923\r\n
Call-ID: unreason.1234ksdfak3j2erwedfsASdf\r\n
CSeq: 35 INVITE\r\n
From: sip:user@example.com;tag=11141343\r\n
To: sip:user@example.edu;tag=2229\r\n
Content-Length: 154\r\n
Content-Type: application/sdp\r\n
Contact: <sip:user@host198.example.com>\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.198\r\n
s=-\r\n
c=IN IP4 192.0.2.198\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var wsinv = r"""
INVITE sip:vivekg@chair-dnrc.example.com;unknownparam SIP/2.0\r\n
TO :\r\n
 sip:vivekg@chair-dnrc.example.com ;   tag    = 1918181833n\r\n
from   : "J Rosenberg \\\""       <sip:jdrosen@example.com>\r\n
  ;\r\n
  tag = 98asjd8\r\n
MaX-fOrWaRdS: 0068\r\n
Call-ID: wsinv.ndaksdj@192.0.2.1\r\n
Content-Length   : 150\r\n
cseq: 0009\r\n
  INVITE
Via  : SIP  /   2.0
 /UDP
    192.0.2.2;branch=390skdjuw
s :\r\n
NewFangledHeader:   newfangled value\r\n
 continued newfangled value\r\n
UnknownHeaderWithUnusualValue: ;;,,;;,;\r\n
Content-Type: application/sdp\r\n
Route:\r\n
 <sip:services.example.com;lr;unknownwith=value;unknown-no-value>\r\n
v:  SIP  / 2.0  / TCP     spindle.example.com   ;\r\n
  branch  =   z9hG4bK9ikj8  ,\r\n
 SIP  /    2.0   / UDP  192.168.255.111   ; branch=\r\n
 z9hG4bK30239\r\n
m:"Quoted string \"\"" <sip:jdrosen@example.com> ; newparam =\r\n
      newvalue ;\r\n
  secondparam ; q = 0.33\r\n
\r\n
v=0\r\n
o=mhandley 29739 7272939 IN IP4 192.0.2.3\r\n
s=-\r\n
c=IN IP4 192.0.2.4\r\n
t=0 0\r\n
m=audio 49217 RTP/AVP 0 12\r\n
m=video 3227 RTP/AVP 31\r\n
a=rtpmap:31 LPC\r\n
""";

  var zeromf = r"""
OPTIONS sip:user@example.com SIP/2.0\r\n
To: sip:user@example.com\r\n
From: sip:caller@example.net;tag=3ghsd41\r\n
Call-ID: zeromf.jfasdlfnm2o2l43r5u0asdfas\r\n
CSeq: 39234321 OPTIONS\r\n
Via: SIP/2.0/UDP host1.example.com;branch=z9hG4bKkdjuw2349i\r\n
Max-Forwards: 0\r\n
Content-Length: 0\r\n
""";
}
