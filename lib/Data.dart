class data {
  int id;
  String title;
  DateTime date = DateTime.now();
  bool isdoen = false;
  data({
    required this.title,
    required this.id
  });
}

List<data> DataList = [];
