class Applink {
  static const String localhost = '192.168.1.6';
  static const String server = 'http://$localhost/ecommerce/delivery';
  //============================================ Auth ============================================//
  static const String loginLink = '$server/Auth/login.php';
  //============================================ orders ============================================//
  static const String pendingOrders = '$server/orders/pending.php';
  static const String acceptedOrders = '$server/orders/accepted.php';
  static const String archiveOrders = '$server/orders/archive.php';
  static const String detailseOrder = '$server/orders/details.php';
  static const String approveOrder = '$server/orders/approved.php';
  static const String doneOrder = '$server/orders/done.php';
}
