import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_auth_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_marketplace_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_pagination_example_repository%20copy.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/get_paginated_example_uc.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/pagination_example_datasource.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/cart_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/custom_loader_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/marketplace_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paginated_example_uc.dart';
import 'package:loomi_flutter_boilerplate/src/external/datasources/marketplace_datasource.dart';

import '../../domain/repositories/i_example_repository.dart';
import '../../domain/usecases/get_example_uc.dart';
import '../../external/datasources/auth_datasource.dart';
import '../../external/datasources/cart_datasource.dart';
import '../../external/datasources/example_datasource.dart';
import '../../presentation/stores/example_store.dart';
import '../../presentation/usecases/i_get_example_uc.dart';
import '../dio_config.dart';

void setupGetIt() {
  //Stores
  GetIt.I.registerSingleton<ExampleStore>(ExampleStore());
  GetIt.I.registerSingleton<MarketPlaceStore>(MarketPlaceStore());
  GetIt.I.registerSingleton<CartStore>(CartStore());
  GetIt.I.registerSingleton<CustomLoaderStore>(CustomLoaderStore());
  GetIt.I.registerSingleton<AuthStore>(AuthStore());

  //Datasources
  GetIt.I.registerSingleton<IExampleRepository>(
    ExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IPaginationExampleRepository>(
    PaginationExampleDatasource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IMarketplaceRepository>(
    MarketplaceDataSource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<ICartRepository>(
    CartDataSource(DioConfig().dio),
  );
  GetIt.I.registerSingleton<IAuthRepository>(
    AuthDataSource(DioConfig().dio),
  );

  //Usecases
  GetIt.I.registerSingleton<IGetExampleUseCase>(GetExampleUseCase());
  GetIt.I.registerSingleton<IGetPaginationExampleUC>(GetPaginationExampleUC());
}
