import 'package:findjobs/features/auth/domain/entities/entities.dart';

import '../../data/models/models.dart';

class UserMapper {
  UserEntity userModelToEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
      // Map other fields as necessary
    );
  }
}
