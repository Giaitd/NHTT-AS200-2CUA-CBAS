enum ModeUrl { develop, product }

// final mode = ModeUrl.develop;
final mode = ModeUrl.product;

final protocalDevelop = 'http://';
final protocalProduct = 'https://';

final hostDevelop = '192.168.2.111';
final hostProduction = 'egt.vn';

final portDevelop = '8600';
final portProduction = '8600';

final companyId = 1;
final host = mode == ModeUrl.develop
    ? protocalDevelop + hostDevelop + ":" + portDevelop
    : protocalProduct + hostProduction + ":" + portProduction;

final baseUrl = host + '/dkcc';

String urlLocal = 'http://192.168.0.120:8606/hongphat';
String urlServer = 'https://hongphat41.egt.vn:8612/hongphat';

String urlGetUserId = urlServer + '/getUserIdFromDevice';
String urlLayDuLieuMeHap = urlServer + '/layDuLieuHapSay';
String urlThemDuLieuMeHap = urlServer + '/themDuLieuHapSay';
