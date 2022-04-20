import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/photo_cubit/photo_cubit.dart';
import 'package:task/business_logic/photo_cubit/photo_states.dart';
import 'package:task/presentation/screens/take_photo_screen.dart';
import 'package:task/presentation/widgets/components.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key, required int photoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PhotoCubit(),
      child: BlocConsumer<PhotoCubit, PhotoState>(
          listener: (BuildContext context, PhotoState state) {},
          builder: (BuildContext context, PhotoState state) {
            PhotoCubit cubit = PhotoCubit.get(context);

            cubit.getAllPhotos();
            return Scaffold(
              appBar: AppBar(
                title: const Text("Photos"),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: cubit.photoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          navigateWithoutFinish(
                              context, const TakePhotoScreen());
                        },
                        child: SizedBox(
                          child: Card(
                            elevation: 1,
                            // child: Text(cubit.photoList[index].title!),
                            child: Image.network(
                              cubit.photoList[index].thumbnailUrl!,
                            ),
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
