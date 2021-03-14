class EditProfileRequest {
  String phone;
  String email;
  String firstName;
  String lastName;
  String lat;
  String lng;
  String image;


  EditProfileRequest(
      {this.phone,
      this.email,
      this.firstName,
      this.lastName,
      this.lat,
      this.lng,
      this.image = null});

  static EditProfileRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    EditProfileRequest editProfileRequestBean = EditProfileRequest();
    editProfileRequestBean.phone = map['phone'];
    editProfileRequestBean.email = map['email'];
    editProfileRequestBean.firstName = map['first_name'];
    editProfileRequestBean.lastName = map['last_name'];
    editProfileRequestBean.lat = map['lat'];
    editProfileRequestBean.lng = map['lng'];
    editProfileRequestBean.image = map['image'];
    return editProfileRequestBean;
  }

  Map toJson() => {
    "phone": phone,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "lat": lat,
    "lng": lng,
    "image": image,
  };
}