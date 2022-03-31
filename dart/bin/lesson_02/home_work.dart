/// Нобходимо написать реализацию двух функций
///
/// 1-я функция numeral, принимает два аргумента
/// - число count — количество сущностей
/// - List<String> варианты склонений (например: комментарий, комментария, комментариев)
///
/// нужно написать логику, которая будет возвращать строку с указанием числа и нужного склонения существительного
/// IN: 3, ['день', 'дня', 'дней']
/// OUT: '3 дня'

String getNumWord(int count, List<String> variants) {
  final int lastTwoSymbol = count % 100;
  if (lastTwoSymbol > 10 && lastTwoSymbol < 20) return variants[2];
  final int lastSymbol = count % 10;
  if (lastSymbol > 1 && lastSymbol < 5) return variants[1];
  if (lastSymbol == 1) return variants[0];
  return variants[2];
}

String numeral(int count, List<String> variants) {
  // ваш код
  return '${count.toString()} ${getNumWord(count, variants)}';
}

/// 2-я функция ago, принимает 1 аргумент
/// - DateTime date — метка даты и времени
///
/// нужно написать логику, которая будет возвращать строку с указанием сколько прошло
/// (минут, часов, дней (до 7), недель (до 4) или месяцев) с переданной даты
/// При этом не нужно выводить только самое большое измерение прошедшего времени
/// Если события было более месяца назад, то только месяцы (3 месяца назад)
/// Если событие совсем недавнее, то либо минуты, либо часы (5 минут назад или 6 часов назад)
/// IN: DateTime.parse('2016-02-27 13:27:00')
/// OUT: 'N месяцев назад'
///
/// IN: DateTime.now().subtract(Duration(minutes: 10)
/// OUT: '10 минут назад'

const int secInMin = 60;
const int secInHour = 3600;
const int secInDay = 86400;
const int secInWeek = 604800;
const int secInMonth = 1814400; // 4 week
const int secInYear = 31557600;

String getAgoTimeWord(int difTime, int sampling, List<String> variants) {
  final double count = difTime / sampling;
  return '${numeral(count.floor(), variants)} назад';
}

String ago(DateTime date) {
  // Ваш код
  final dateNow = DateTime.now();
  final dif = dateNow.difference(date);
  final int difSec = dif.inSeconds;
  if (difSec >= secInYear) {
    return getAgoTimeWord(difSec, secInYear, ['год', 'года', 'лет']);
  }
  if (difSec >= secInMonth) {
    return getAgoTimeWord(difSec, secInMonth, ['месяц', 'месяца', 'месяцев']);
  }
  if (difSec >= secInWeek) {
    return getAgoTimeWord(difSec, secInWeek, ['неделю', 'недели', 'недель']);
  }
  if (difSec >= secInDay) {
    return getAgoTimeWord(difSec, secInDay, ['день', 'дня', 'дней']);
  }
  if (difSec >= secInHour) {
    return getAgoTimeWord(difSec, secInHour, ['час', 'часа', 'часов']);
  }
  if (difSec >= secInMin) {
    return getAgoTimeWord(difSec, secInMin, ['минуту', 'минуты', 'минут']);
  }
  return getAgoTimeWord(difSec, 1, ['секунду', 'секунды', 'секунд']);
}

void main(List<String> arguments) {
  print(numeral(19, ['день', 'дня', 'дней']));
  print(numeral(5, ['неделя', 'недели', 'недель']));

  print(ago(DateTime.parse('2016-02-27 13:27:00')));
  print(ago(DateTime.parse('2022-03-15 14:00:00')));
  print(ago(DateTime.parse('2022-03-20 19:00:00')));
}
