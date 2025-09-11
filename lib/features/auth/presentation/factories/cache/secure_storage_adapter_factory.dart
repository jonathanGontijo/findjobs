import 'package:findjobs/features/shared/infrastruture/cache/secure_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(FlutterSecureStorage());
