import 'package:dio/dio.dart';
import 'package:my_self/core/constants/remot_routes.dart';
import 'package:my_self/core/network/api_response_model.dart';

import 'package:my_self/madules/auth/data/models/response_user.dart';
import 'package:my_self/madules/main/data/model/request_like.dart';
import 'package:my_self/madules/main/data/model/response_post.dart';
import 'package:retrofit/http.dart';
import '../constants/constants.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET(RemoteRoutes.getusernew)
  Future<ApiResponseModel<ResponseUser>> newUser();

  @GET(RemoteRoutes.getloginstall)
  Future<void> logInstall();

  @GET(RemoteRoutes.getloglaunch)
  Future<void> logLunch();

  @GET("${RemoteRoutes.getpost}/{id}")
  Future<ResponsePost> getPosts(@Path() String id);

  @POST(RemoteRoutes.sendlike)
  Future<void> likePost(
 @Body() LikeRequest likeRequest,

  );
}
