class SavedSearch {
  int _id;
  String _query;
  DateTime _serachedAt;
  DateTime _savedAt;
  int _status;

  SavedSearch(
    this._query,
    this._serachedAt, [
    this._savedAt,
    this._status,
  ]);

  SavedSearch.withId(
    this._id,
    this._query,
    this._serachedAt,
    this._savedAt,
    this._status,
  );

  int get getId => _id;

  set setId(int _id) => this._id = _id;

  String get getQuery => _query;

  set setQuery(String _query) => this._query = _query;

  DateTime get getSearchedAt => this._serachedAt;

  set setDearchedAt(DateTime searchedAt) => this._serachedAt = searchedAt;

  DateTime get getSavedAt => this._savedAt;

  set setSavedAt(DateTime _savedAt) => this._savedAt = _savedAt;

  int get getStatus => _status;

  set setStatus(int _status) => this._status = _status;
}
