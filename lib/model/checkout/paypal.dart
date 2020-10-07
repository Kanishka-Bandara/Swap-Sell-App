class PayPal {
  String totalAmount;
  String subTotalAmount;
  String shippingCost;
  int shippingDiscountCost;
  String userFirstName;
  String userLastName;
  String addressCity;
  String addressStreet;
  String addressZipCode;
  String addressCountry;
  String addressState;
  String addressPhoneNumber;

  PayPal({
    this.totalAmount,
    this.subTotalAmount,
    this.shippingCost,
    this.shippingDiscountCost,
    this.userFirstName,
    this.userLastName,
    this.addressCity,
    this.addressStreet,
    this.addressZipCode,
    this.addressCountry,
    this.addressState,
    this.addressPhoneNumber,
  });
  String get getTotalAmount => totalAmount;

  set setTotalAmount(String totalAmount) => this.totalAmount = totalAmount;

  String get getSubTotalAmount => subTotalAmount;

  set setSubTotalAmount(String subTotalAmount) =>
      this.subTotalAmount = subTotalAmount;

  String get getShippingCost => shippingCost;

  set setShippingCost(String shippingCost) => this.shippingCost = shippingCost;

  int get getShippingDiscountCost => shippingDiscountCost;

  set setShippingDiscountCost(int shippingDiscountCost) =>
      this.shippingDiscountCost = shippingDiscountCost;

  String get getUserFirstName => userFirstName;

  set setUserFirstName(String userFirstName) =>
      this.userFirstName = userFirstName;

  String get getUserLastName => userLastName;

  set setUserLastName(String userLastName) => this.userLastName = userLastName;

  String get getAddressCity => addressCity;

  set setAddressCity(String addressCity) => this.addressCity = addressCity;

  String get getAddressStreet => addressStreet;

  set setAddressStreet(String addressStreet) =>
      this.addressStreet = addressStreet;

  String get getAddressZipCode => addressZipCode;

  set setAddressZipCode(String addressZipCode) =>
      this.addressZipCode = addressZipCode;

  String get getAddressCountry => addressCountry;

  set setAddressCountry(String addressCountry) =>
      this.addressCountry = addressCountry;

  String get getAddressState => addressState;

  set setAddressState(String addressState) => this.addressState = addressState;

  String get getAddressPhoneNumber => addressPhoneNumber;

  set setAddressPhoneNumber(String addressPhoneNumber) =>
      this.addressPhoneNumber = addressPhoneNumber;
}
