import 'package:tutapp/app/constants.dart';
import 'package:tutapp/app/extensions.dart';
import 'package:tutapp/data/response/responses.dart';
import 'package:tutapp/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id.orEmpty() ?? Constants.empty,
        name: this?.name.orEmpty() ?? Constants.empty,
        numOfNotfications:
            this?.numberOfNotfications.orZero() ?? Constants.zero);
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
        gmail: this?.gmail.orEmpty() ?? Constants.empty,
        link: this?.link.orEmpty() ?? Constants.empty,
        phone: this?.phone.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        contacts: this?.contacts?.toDomain() ??
            Contact(
              gmail: Constants.empty,
              link: Constants.empty,
              phone: Constants.empty,
            ),
        customer: this?.customer?.toDomain() ??
            Customer(
              id: Constants.empty,
              name: Constants.empty,
              numOfNotfications: Constants.zero,
            ));
  }
}
