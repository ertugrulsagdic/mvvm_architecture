import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_architecture_3/view/_product/_model/query/friend_query.dart';
import 'package:mvvm_architecture_3/view/home/social/viewmodel/social_view_model.dart';
import 'package:vexana/vexana.dart';

import 'social_service_mock.dart';

class SocialBuildContext extends Mock implements BuildContext {}

class SocialViewModelMock extends Mock implements SocialViewModel {
  SocialViewModelMock(SocialServiceMock? socialServiceMock);
}

void main() {
  BuildContext context;
  SocialServiceMock? socialServiceMock;
  INetworkManager? networkManager;
  SocialViewModelMock? socialViewModelMock;

  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager(options: BaseOptions());
    socialServiceMock = SocialServiceMock(networkManager!, null);

    socialViewModelMock = SocialViewModelMock(socialServiceMock);
  });
  test('Loading Test', () async {
    final response = await socialViewModelMock!.fetchAllUserLazy(0);
    verify(socialViewModelMock!.isLoadingLazy);
  });
  test('Fetch User Id', () async {
    final response = await socialServiceMock!.fetchUser(10);
    expect(response, isNotNull);
  });

  test('Fetch Users', () async {
    final response = await socialServiceMock!.fetchUserList(FriendQuery());
    print(response);
    expect(response, isNotEmpty);
  });
}
