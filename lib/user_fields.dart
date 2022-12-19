import 'dart:core';

class UserFields {
  static final String SlNo = "Sl. No. ";
  static final String Odometer = "Odometer (km)";
  static final String LitresFilled = "Liters Filled (L)";
  static final String PetrolCost = "Petrol (₹)";
  static final String Odo_diff = "Odo Diff (km)";
  static final String Mileage = "Mileage (kmpl)";
  static final String MoneySpent = "Money Spent (₹)";

  static List<String> getFields() =>
      [SlNo, Odometer, LitresFilled, PetrolCost, Odo_diff, Mileage, MoneySpent];
}
