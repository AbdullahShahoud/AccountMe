import 'module/departement.dart';

List<String> nameDepartement=[
  'مطابخ فوق',
  'مطابخ تحت',
  'أبواب ',
  'نوافذ',
  'حواجب',
  'ألوان',
];
List<String> image=[
  'assets/images/_20220211_225339.JPG',
  'assets/images/_20220211_225339.JPG',
  'assets/images/_20220211_225339.JPG',
  'assets/images/_20220211_225339.JPG',
  'assets/images/_20220211_225339.JPG',
  'assets/images/_20220211_225339.JPG',
];
 List Main1=List.generate(6, (index) =>
  Departement(index,'assets/images/_20220211_225339.JPG',nameDepartement[index]));