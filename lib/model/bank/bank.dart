class Bank {
  int id;
  String bankName;

  Bank({
    this.id,
    this.bankName,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getBankName => bankName;

  set setBankName(String bankName) => this.bankName = bankName;
}
