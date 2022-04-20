import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/take_photo_cubit/take_photo_cubit.dart';
import 'package:task/business_logic/take_photo_cubit/take_photo_states.dart';

class TakePhotoScreen extends StatelessWidget {
  const TakePhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TakePhotoCubit(),
      child: BlocConsumer<TakePhotoCubit, TakePhotoState>(
          listener: (BuildContext context, TakePhotoState state) {},
          builder: (BuildContext context, TakePhotoState state) {
            TakePhotoCubit cubit = TakePhotoCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("Take Photo"),
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
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: [
                  const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.camera,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Choose From Gallery"),
                        IconButton(
                            onPressed: () {
                              cubit.openImagePicker();
                            },
                            icon: const Icon(Icons.browse_gallery))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Choose From Camera"),
                        IconButton(
                            onPressed: () {
                              cubit.openCamera();
                            },
                            icon: const Icon(Icons.camera))
                      ],
                    ),
                  )
                ]),
              ),
            );
          }),
    );
  }
}
