class AddClientRequest {
  String phone;
  String email;
  String firstName;
  String lastName;
  String lat;
  String lng;
  int status;
  String password;
  String passwordConfirmation;
  String verify_type;


  AddClientRequest(
      {this.phone,
      this.email,
      this.firstName,
      this.lastName,
      this.lat,
      this.lng,
      this.status,
      this.password,
      this.passwordConfirmation,
      this.verify_type});

  static AddClientRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddClientRequest addClientRequestBean = AddClientRequest();
    addClientRequestBean.phone = map['phone'];
    addClientRequestBean.email = map['email'];
    addClientRequestBean.firstName = map['first_name'];
    addClientRequestBean.lastName = map['last_name'];
    addClientRequestBean.lat = map['lat'];
    addClientRequestBean.lng = map['lng'];
    addClientRequestBean.status = map['status'];
    addClientRequestBean.password = map['password'];
    addClientRequestBean.passwordConfirmation = map['password_confirmation'];
    addClientRequestBean.verify_type = map['verify_type'];
    return addClientRequestBean;
  }

  Map toJson() => {
    "phone": phone,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "lat": lat,
    "lng": lng,
    "status": status,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "verify_type": verify_type,
  };
}