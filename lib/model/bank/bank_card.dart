import 'package:swap_sell/model/bank/bank.dart';

class BankCard {
  int id;
  Bank bank;
  int userId;
  int cardTypeId;
  String cardType;
  DateTime expDate;
  String cardNumber;
  int status;

  BankCard({
    this.id,
    this.bank,
    this.userId,
    this.cardTypeId,
    this.cardType,
    this.expDate,
    this.cardNumber,
    this.status,
  });

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getUserId => userId;

  set setUserId(int userId) => this.userId = userId;

  Bank get getBank => bank;

  set setBank(Bank bank) => this.bank = bank;

  int get getCardTypeId => cardTypeId;

  set setCardTypeId(int cardTypeId) => this.cardTypeId = cardTypeId;

  String get getCardType => cardType;

  set setCardType(String cardType) => this.cardType = cardType;

  DateTime get getExpDate => expDate;

  set setExpDate(DateTime expDate) => this.expDate = expDate;

  String get getCardNumber => cardNumber;

  set setCardNumber(String cardNumber) => this.cardNumber = cardNumber;

  int get getStatus => status;

  set setStatus(int status) => this.status = status;
}
