import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations? of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['vi', 'en'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String viText = '',
    String enText = '',
  }) =>
      [viText, enText][languageIndex];
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Homescreen
  {
    'xtvzp2br': {
      'vi': '01',
      'en': '',
    },
    'vg1qhh4d': {
      'vi': 'CHƯƠNG TRÌNH 01',
      'en': '',
    },
    '5h0gn6p3': {
      'vi': 'ĐANG CHẠY',
      'en': '',
    },
    '9j175qc8': {
      'vi': 'Trạng thái hoạt động',
      'en': '',
    },
    'f4j7axbp': {
      'vi': 'THỜI GIAN TIỆT TRÙNG CÒN LẠI:',
      'en': '',
    },
    'ndbq0df0': {
      'vi': '28:30',
      'en': '',
    },
    'mjv90u9f': {
      'vi': 'Thông số cài đặt',
      'en': '',
    },
    't8505fl9': {
      'vi': 'Nhiệt độ tiệt trùng',
      'en': '',
    },
    '4xim040j': {
      'vi': '120',
      'en': '',
    },
    'a6wry0tr': {
      'vi': 'o C',
      'en': '',
    },
    'r00t6wwr': {
      'vi': 'Thời gian tiệt trùng',
      'en': '',
    },
    'v8h8y25o': {
      'vi': '30',
      'en': '',
    },
    '9jks8frz': {
      'vi': 'Phút',
      'en': '',
    },
    '07o8wfs9': {
      'vi': 'Thời gian làm nguội',
      'en': '',
    },
    'sbaqjkpq': {
      'vi': '5',
      'en': '',
    },
    '145qow57': {
      'vi': 'Phút',
      'en': '',
    },
    '8b1m30aw': {
      'vi': '40%',
      'en': '',
    },
    'tpnridt2': {
      'vi': 'Gía trị thực đo được',
      'en': '',
    },
    'jam12w6b': {
      'vi': 'Gía trị nhiệt độ, áp suất đo được và hiển thị liên tục',
      'en': '',
    },
    'p155ic0t': {
      'vi': 'Nhiệt độ buồng hấp',
      'en': '',
    },
    '8js89sln': {
      'vi': '120',
      'en': '',
    },
    'ppgtxchd': {
      'vi': 'o C',
      'en': '',
    },
    'lrig1x8o': {
      'vi': 'Áp suất buồng hấp',
      'en': '',
    },
    'vc4ezo0l': {
      'vi': '1.2',
      'en': '',
    },
    '3aepgmn8': {
      'vi': 'Phút',
      'en': '',
    },
    'cf834wiu': {
      'vi': 'Số mẻ hấp hoàn thành:',
      'en': '',
    },
    'efsd0vc5': {
      'vi': '1000',
      'en': '',
    },
    'dqh30tvz': {
      'vi': 'Ngày/tháng/năm:',
      'en': '',
    },
    '27oirmxe': {
      'vi': '06/06/2020',
      'en': '',
    },
    'gd3kaxbh': {
      'vi': 'Home',
      'en': '',
    },
  },
  // DANGNHAP
  {
    'r1iyr6lt': {
      'vi': 'Trở về',
      'en': '',
    },
    '3q5ib6hm': {
      'vi': 'Lưu ý: Chỉ nhân viên kĩ thuật mới được phép truy cập mục này',
      'en': '',
    },
    'm731ccbc': {
      'vi': 'Tên đăng nhập',
      'en': '',
    },
    'j3e4aupm': {
      'vi': 'Gõ tên đăng nhập của bạn...',
      'en': '',
    },
    'kxe6y3ra': {
      'vi': 'Mật khẩu',
      'en': '',
    },
    '8q2088vl': {
      'vi': 'Gõ mật khẩu của bạn...',
      'en': '',
    },
    'blbm2cmd': {
      'vi': 'Đăng nhập',
      'en': '',
    },
    '93ov5o5h': {
      'vi': 'Home',
      'en': '',
    },
  },
  // Chonchuongtrinh
  {
    'gooegjxz': {
      'vi': 'Tiếp tục',
      'en': '',
    },
    'tfnnm8in': {
      'vi': 'CHƯƠNG TRÌNH 01',
      'en': '',
    },
    '2aiisbeu': {
      'vi': 'CHƯƠNG TRÌNH 02',
      'en': '',
    },
    's8bj3etj': {
      'vi': 'CHƯƠNG TRÌNH 03',
      'en': '',
    },
    's67u2zh1': {
      'vi': 'CHƯƠNG TRÌNH 04',
      'en': '',
    },
    'zqh5lh7v': {
      'vi': 'CHƯƠNG TRÌNH 05',
      'en': '',
    },
    'tocoov10': {
      'vi': 'CHƯƠNG TRÌNH 06',
      'en': '',
    },
    'zys953ht': {
      'vi': 'CHƯƠNG TRÌNH 07',
      'en': '',
    },
    'zz9pg0ta': {
      'vi': 'CHƯƠNG TRÌNH 08',
      'en': '',
    },
    'ongw44f1': {
      'vi': 'CHƯƠNG TRÌNH 09',
      'en': '',
    },
    'd2xclbx1': {
      'vi': 'CHƯƠNG TRÌNH 10',
      'en': '',
    },
    'lupsv2nd': {
      'vi': 'CHƯƠNG TRÌNH 11',
      'en': '',
    },
    'a84r7e1d': {
      'vi': 'CHƯƠNG TRÌNH 12',
      'en': '',
    },
    'iuq6qw3f': {
      'vi': 'CHƯƠNG TRÌNH 13',
      'en': '',
    },
    'u8bbl1vj': {
      'vi': 'CHƯƠNG TRÌNH 14',
      'en': '',
    },
    'cywndjf1': {
      'vi': 'CHƯƠNG TRÌNH 15',
      'en': '',
    },
    'bb14vkgs': {
      'vi': 'CHƯƠNG TRÌNH TÙY CHỌN',
      'en': '',
    },
    'bedityrh': {
      'vi': 'Thông số cài đặt',
      'en': '',
    },
    'czimf2vc': {
      'vi': 'Gía trị nhiệt độ và thời gian của chương trình đã chọn',
      'en': '',
    },
    'j83nii18': {
      'vi': 'Nhiệt độ tiệt trùng',
      'en': '',
    },
    'z70ufzd0': {
      'vi': '120',
      'en': '',
    },
    'a1glfqk1': {
      'vi': 'o C',
      'en': '',
    },
    'nvdv5hg7': {
      'vi': 'Thời gian tiệt trùng',
      'en': '',
    },
    'fjggu4d1': {
      'vi': '30',
      'en': '',
    },
    'ipr3ar9w': {
      'vi': 'Phút',
      'en': '',
    },
    'iu6widye': {
      'vi': 'Thời gian làm nguội',
      'en': '',
    },
    'r0anqfzy': {
      'vi': '5',
      'en': '',
    },
    'qnx6b6ou': {
      'vi': 'Phút',
      'en': '',
    },
    '1i3p3sqy': {
      'vi': 'Shop',
      'en': '',
    },
  },
  // Caidatnhanh
  {
    '5m11vlg1': {
      'vi': 'Bật / Tắt máy in',
      'en': '',
    },
    '2yyjufdo': {
      'vi': 'Tắt máy in khi không sử dụng ',
      'en': '',
    },
    'g1fqh1ud': {
      'vi': 'Cài đặt chu kì in',
      'en': '',
    },
    'xqwff0z6': {
      'vi': 'Khoảng thời gian để in dữ liệu mẻ hấp',
      'en': '',
    },
    'snpn9up0': {
      'vi': '130',
      'en': '',
    },
    'mc99ysr2': {
      'vi': 'giây',
      'en': '',
    },
    's32mcgcc': {
      'vi': 'Cài đặt thời gian hiển thị',
      'en': '',
    },
    'htix6d51': {
      'vi': 'Subtext',
      'en': '',
    },
    'efxt2ihm': {
      'vi': '1',
      'en': '',
    },
    'emzz1ykz': {
      'vi': 'ngày',
      'en': '',
    },
    'w5f3xauo': {
      'vi': '2',
      'en': '',
    },
    'solqhv4j': {
      'vi': 'tháng',
      'en': '',
    },
    '29u0366a': {
      'vi': '2022',
      'en': '',
    },
    'il3425gy': {
      'vi': 'năm',
      'en': '',
    },
    '96c22gx8': {
      'vi': '3',
      'en': '',
    },
    'lilfkox5': {
      'vi': 'giờ',
      'en': '',
    },
    'b4sp2o85': {
      'vi': '2',
      'en': '',
    },
    'g3sxe7m1': {
      'vi': 'phút',
      'en': '',
    },
    'n8c1jmy2': {
      'vi': 'Xuất dữ liệu',
      'en': '',
    },
    'vv05w4ka': {
      'vi': 'Ngôn ngữ',
      'en': '',
    },
    '2tb8zrex': {
      'vi': 'Bấm chọn thay đổi ngôn ngữ',
      'en': '',
    },
    'j3pwffn7': {
      'vi': 'Trở về',
      'en': '',
    },
    'hzrj2upp': {
      'vi': 'Home',
      'en': '',
    },
  },
  // Tuychon
  {
    '8n3q1rqn': {
      'vi': 'Tiếp tục',
      'en': '',
    },
    'xk77m6sx': {
      'vi': 'Nhập giá trị tùy chọn cho mẻ hấp',
      'en': '',
    },
    '4za29qgg': {
      'vi': 'Gía trị nhiệt độ và thời gian của chương trình tùy chọn',
      'en': '',
    },
    'bvbaocuz': {
      'vi': 'Nhiệt độ tiệt trùng',
      'en': '',
    },
    '2dle11ym': {
      'vi': '130',
      'en': '',
    },
    '8wewju2f': {
      'vi': 'o C',
      'en': '',
    },
    'mr16512n': {
      'vi': 'Thời gian tiệt trùng',
      'en': '',
    },
    'sx31rzzq': {
      'vi': '30',
      'en': '',
    },
    'zoxgev18': {
      'vi': 'Phút',
      'en': '',
    },
    '1i12byob': {
      'vi': 'Thời gian làm nguội',
      'en': '',
    },
    'daz3j4i5': {
      'vi': '5',
      'en': '',
    },
    'sufm6aff': {
      'vi': 'Phút',
      'en': '',
    },
    'ousl22ly': {
      'vi': 'Shop',
      'en': '',
    },
  },
  // Caidatchuyensau
  {
    'eo98gs0z': {
      'vi': 'Vận hành thủ công',
      'en': '',
    },
    'np83lqx3': {
      'vi': 'Bật / tắt từng thiết bị riêng trong hệ thống',
      'en': '',
    },
    '4zcqija9': {
      'vi': 'Cài đặt offset',
      'en': '',
    },
    'fm1blmzk': {
      'vi': 'Cài đặt offset giá trị chênh nhiệt độ và áp suất',
      'en': '',
    },
    'dt32inht': {
      'vi': 'Offset nhiệt độ ',
      'en': '',
    },
    'py2towp0': {
      'vi': '0.03',
      'en': '',
    },
    'qrtzmred': {
      'vi': 'o C',
      'en': '',
    },
    'u35o87hw': {
      'vi': 'Offset áp suất',
      'en': '',
    },
    'hyo37jo0': {
      'vi': '0.01',
      'en': '',
    },
    'h6mya024': {
      'vi': 'kgf/cm2',
      'en': '',
    },
    '7y8lvn2w': {
      'vi': 'Cài đặt máy hút chân không',
      'en': '',
    },
    'bsr63j0u': {
      'vi': 'Chỉnh áp suất hút chân không',
      'en': '',
    },
    'dtv351fz': {
      'vi': 'Số lần hút chân không',
      'en': '',
    },
    'pvqqmxx7': {
      'vi': '2',
      'en': '',
    },
    'bpy6w2yl': {
      'vi': 'lần',
      'en': '',
    },
    'np5sajwi': {
      'vi': 'Áp suất hút chân không',
      'en': '',
    },
    'nddpjbdw': {
      'vi': '-8.00',
      'en': '',
    },
    'ne8jdw4z': {
      'vi': 'kgf/cm2',
      'en': '',
    },
    'qyl1tdwv': {
      'vi': 'Trở về',
      'en': '',
    },
    'v117hwfn': {
      'vi': 'Home',
      'en': '',
    },
  },
  // Bangbaoloi
  {
    'f551i02v': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    'azgd21wg': {
      'vi': 'Lỗi quá tải máy hút chân không',
      'en': '',
    },
    '4pa97z8y': {
      'vi': '10:55 am',
      'en': '',
    },
    'ko9ibq8j': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    'nglo6xc9': {
      'vi': 'Lỗi quá thời gian xả hơi',
      'en': '',
    },
    'j92815bv': {
      'vi': '10:50 am',
      'en': '',
    },
    'bhtd67qf': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    'v20u4u8n': {
      'vi': 'Lỗi quá thời gian bơm hơi',
      'en': '',
    },
    'b9yd6d2v': {
      'vi': '10:40 am',
      'en': '',
    },
    'ouf22onn': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    '4yqqtces': {
      'vi': 'Lỗi quá thời gian hút chân không',
      'en': '',
    },
    'y9l7ltzm': {
      'vi': '10:40 am',
      'en': '',
    },
    'rt2a2d4b': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    'p160vjpj': {
      'vi': 'Lỗi thanh đốt',
      'en': '',
    },
    'mz3g2f4h': {
      'vi': '10:40 am',
      'en': '',
    },
    'rci7pakn': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    '7ld45cy8': {
      'vi': 'Lỗi quá thời gian cần bằng áp',
      'en': '',
    },
    'n2wr31ul': {
      'vi': '10:40 am',
      'en': '',
    },
    'iid4os0u': {
      'vi': 'Cảnh báo lỗi',
      'en': '',
    },
    'ydvbyvrx': {
      'vi': 'Lỗi nhiệt độ cao ',
      'en': '',
    },
    'q4podvr0': {
      'vi': '10:40 am',
      'en': '',
    },
    '9ynzujt0': {
      'vi': 'Trở về',
      'en': '',
    },
  },
  // VHbangtay
  {
    'qh9whfdn': {
      'vi': 'MỞ VAN BƠM HƠI',
      'en': '',
    },
    'xgfthjsx': {
      'vi': 'MỞ VAN CẤP NƯỚC MÁT',
      'en': '',
    },
    'b7xcmg0g': {
      'vi': 'BẬT HÚT CHÂN KHÔNG',
      'en': '',
    },
    'lcw31kb4': {
      'vi': 'MỞ VAN XẢ HƠI',
      'en': '',
    },
    '15wcyzh4': {
      'vi': 'MỞ VAN CÂN BẰNG ÁP',
      'en': '',
    },
    's27a2juj': {
      'vi': 'MỞ VAN XẢ ĐÁY',
      'en': '',
    },
    'fvtr9vo6': {
      'vi': 'Gía trị thực đo được',
      'en': '',
    },
    '9zmxxhts': {
      'vi': 'Gía trị nhiệt độ, áp suất đo được và hiển thị liên tục',
      'en': '',
    },
    'pfe1ro1z': {
      'vi': 'Nhiệt độ buồng hấp',
      'en': '',
    },
    'uzbenawj': {
      'vi': '120',
      'en': '',
    },
    '9dcw4qh2': {
      'vi': 'o C',
      'en': '',
    },
    '1ap3ijwy': {
      'vi': 'Áp suất buồng hấp',
      'en': '',
    },
    'v5luiele': {
      'vi': '1.2',
      'en': '',
    },
    'dz54mkpu': {
      'vi': 'Phút',
      'en': '',
    },
    'on2xqc1s': {
      'vi': 'Trở về',
      'en': '',
    },
    'itrps1xo': {
      'vi': 'Shop',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
