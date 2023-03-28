// Formats amount to friendly form.
String formatCurrency(amount) {
  if (amount > 999 && amount < 99999) {
    return "${(amount / 1000).toStringAsFixed(1)} K";
  } else if (amount > 99999 && amount < 999999) {
    return "${(amount / 1000).toStringAsFixed(0)} K";
  } else if (amount > 999999 && amount < 999999999) {
    return "${(amount / 1000000).toStringAsFixed(1)} M";
  } else if (amount > 999999999) {
    return "${(amount / 1000000000).toStringAsFixed(1)} B";
  } else {
    return amount.toString();
  }
}
