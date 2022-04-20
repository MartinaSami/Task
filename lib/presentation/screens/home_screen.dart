import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/items_cubit/items_cubit.dart';
import 'package:task/business_logic/items_cubit/items_states.dart';
import 'package:task/presentation/screens/photos_screen.dart';
import 'package:task/presentation/widgets/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (BuildContext context, AppState state) {},
          builder: (BuildContext context, AppState state) {
            AppCubit cubit = AppCubit.get(context);
            cubit.getAllItems();
            var items = cubit.itemsList;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Items"),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          navigateWithoutFinish(
                              context,
                              PhotosScreen(
                                photoId: cubit.itemsList[index].id!,
                              ));
                          id = cubit.itemsList[index].id;
                        },
                        child: Card(
                          elevation: 1,
                          child: SizedBox(
                            height: 50,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    items[index].id.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    items[index].title!,
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                          ),
                        ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}
