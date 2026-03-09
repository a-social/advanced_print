import 'dart:io';

class DebugPrinter {
  static const String _defaultTag = 'ERDAL';
  static const String _erdalLoveTag = 'Erdal\'ın Printi ❤️';

  /// [message] – yazdırılacak metin
  /// [isImportant] – true ⇒ pembe, false/null ⇒ turuncu
  /// [tag] – Konsolda gözükecek etiket
  static void log(dynamic message, {bool isImportant = false, String? tag}) {
    // Server tarafında genelde çevre değişkenine bakılır
    // İstersen buraya AppConfig'deki mod kontrolünü de bağlayabilirsin

    final effectiveTag = tag ?? _defaultTag;

    // Renk kodları: Pembe (35), Turuncu/Sarı (33), Reset (0)
    final colorCode = isImportant ? '\x1B[35m' : '\x1B[33m';
    final resetCode = '\x1B[0m';

    final time = DateTime.now().toString().split(' ').last.substring(0, 8);
    stdout.writeln('$colorCode[$time] [$effectiveTag]: $message$resetCode');
  }

  /// Yeşil renkli özel bir print metodu.
  static void success(dynamic message, {bool withLove = true, String? tag}) {
    final effectiveTag = tag ?? (withLove ? _erdalLoveTag : _defaultTag);
    final colorCode = '\x1B[32m'; // Yeşil (32)
    final resetCode = '\x1B[0m';

    final time = DateTime.now().toString().split(' ').last.substring(0, 8);
    stdout.writeln('$colorCode[$time] [$effectiveTag]: $message$resetCode');
  }

  /// Hata durumları için Kırmızı print
  static void error(dynamic message, {String? tag}) {
    final effectiveTag = tag ?? 'HATA';
    final colorCode = '\x1B[31m'; // Kırmızı (31)
    final resetCode = '\x1B[0m';

    final time = DateTime.now().toString().split(' ').last.substring(0, 8);
    stderr.writeln('$colorCode[$time] [$effectiveTag]: $message$resetCode');
  }
}
