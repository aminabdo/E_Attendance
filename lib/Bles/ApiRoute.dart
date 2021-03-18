
import 'package:qimma/utils/app_utils.dart';

class ApiRoutes {

  static String generalGet(String urlExtention) {
    return urlExtention;
  }


  // auth
  static String login(){
    return "Auth_general/rep_login";
  }

  static String signup(){
    return "Auth_general/register";
  }

  static String login_social(){
    return "Auth_general/login_social";
  }

  static String add_representative(){
    return "Auth_general/add_representative";
  }



  // orders

  static String all_p_d_Order(){
    return "Order/all_p_d_Order";
  }

  static String filter_P_d_orders_by_DM(int type){
    return "filter_P_d_orders_by_DMY?type=$type";
  }
  static String filter_P_d_orders_by_date(String from,String to){
    return "filter_P_d_orders_by_date?from=$from&to=$to";
    // return "filter_P_d_orders_by_date?from=2021-02-20&to=2021-02-28";
  }
  static String single_P_d_order(int orderID){
    return "Order/single_P_d_order/$orderID";
  }

  // forget password

  // reset password

  // add order

  static String add_P_d_order() {
    return "Order/add_P_d_order";
  }

  static String edit_P_d_order(int orderID){
    return "Order/edit_P_d_order/$orderID";
  }

  static String delete_P_d_order(int orderID){
    return "Order/delete_P_d_order/$orderID";
  }

  static String add_product_to_P_d_order(int orderID){
    return "Order/add_product_to_P_d_order/$orderID";
  }

  static String make_bill(int orderID , int discount_type, double discount , int tax1_type , int tax1 ,int tax2_type, int tax2 , double paid){
    return "Order/make_bill/$orderID?discount_type=$discount_type&discount=$discount&tax1_type=$tax1_type&tax1=$tax1&tax2_type=$tax2_type&tax2=$tax2&paid=$paid";
  }




  // add location

  static String add_address(){
    return "Auth_private/add_address";
  }


  // products (get - search)

  static String filter_website(int catID){
    return "Home/filter_website?cat_id=$catID";
  }

  static String search_by_name(String name){
    return "Home/search_by_name?name=$name";
  }

  static String filter(String from,String to , String type , {String catID}){
    return "Home/filter?from=$from&to=$to&type=$type&lat=1.2545484&lng=1.2541844";
  }

  static String get_products(int type){
    return "Product/get_products?type=$type";
  }

  static String getAllUsers(){
    return "Order/all_users";
  }

  static String getAllProducts(){
    return "Order/all_Product_details";
  }


  // home

  static String home(){
    return "Home/home";
  }
  static String get_main_cat(){
    return "Home/get_main_cat";
  }
  // static String filter_website(int cat_id){
  //   return "Home/filter_website?cat_id=$cat_id";
  // }
  // static String search_by_name(String name){
  //   return "Home/search_by_name?name=$name";
  // }
  // static String filter(String from,String to , String type ,String cat_id){
  //   return "Home/filter?from=$from&to=$to&type=$type&lat=1.2545484&lng=1.2541844&cat_id=$cat_id";
  // }
  //
  // // add adress
  // static String add_address(){
  //   return "api/Auth_private/add_address";
  // }
  //
  // // Login
  // static String login(){
  //   return "Auth_general/login";
  // }
  //
  // static String login_social(String eamil){
  //   return "Auth_general/login_social";
  // }


  // my cart
  static String my_cart(){
    return "Auth_private/my_cart";
  }
  static String count_of_cart(){
    return "Auth_private/count_of_cart";
  }
  static String delete_from_cart(int productID){
    return "Product/delete_from_cart/$productID";
  }
  static String update_cart(){
    return "Product/update_cart";
  }

  // product details
  // static String get_products(int type){
  //   return "Product/get_products?type=1";
  // }
  static String get_single_product(int productID){
    return "Product/product_details/$productID";
  }



  // edit profile
  static String edit_profile(){
    return "Auth_private/edit_profile";
  }
  static String change_image(){
    return "Auth_private/save_image";
  }


  // notification
  static String get_notification(){
    return "Auth_private/get_notification";
  }


  // forget_password
  static String forget_password(int type){
    return "Auth_general/forget_password";
  }

  // show_profile
  static String my_info(){
    return "Auth_private/my_wishlist";
  }
  static String my_order(int page){
    return "Auth_private/my_order?page=$page";
  }
  static String my_wishlist(){
    return "Auth_private/my_wishlist";
  }
  static String user_address(){
    return "Order/user_address";
  }
  static String logout(int page){
    return "Auth_private/logout";
  }

  // reset_password
  static String reset_password(){
    return "Auth_general/reset_password";
  }
  // products
  static String products_by_category({int catID , int page}){
    return "Product/products_by_category/$catID?page=$page";
  }
  // messages
  static String send_message(){
    return "message/send_message";
  }
  static String get_message(){
    return "message/get_message";
  }

  // registration
  static String register(){
    return "Auth_general/register";
  }
  static String register_social(){
    return "uth_general/register_social";
  }

  // add to cart
  static String add_to_cart(String productID){
    return "Product/add_to_cart/$productID";
  }


  // rep_users

  static String all_users(){
    return "Order/all_users";
  }
}

class ApiRoutesUpdate {
  static String baseUrl = "https://qimmaapi.codecaique.com/api/";

  getLink(String url) {
    print("url ------>>>>   " + baseUrl + url);
    return baseUrl + url;
  }

}
