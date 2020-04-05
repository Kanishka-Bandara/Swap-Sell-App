class SavedSearch {
  int id;
  String query;
  DateTime serachedAt;
  DateTime savedAt;
  int status;

  SavedSearch({
    this.id,
    this.query,
    this.serachedAt,
    this.savedAt,
    this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getQuery => query;

  set setQuery(String query) => this.query = query;

  DateTime get getSearchedAt => this.serachedAt;

  set setDearchedAt(DateTime searchedAt) => this.serachedAt = searchedAt;

  DateTime get getSavedAt => this.savedAt;

  set setSavedAt(DateTime savedAt) => this.savedAt = savedAt;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
