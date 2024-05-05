import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangeProfileImage extends StatefulWidget {
  const ChangeProfileImage({super.key, this.image, required this.viewOnly});

  final bool viewOnly;
  final String? image;

  @override
  State<ChangeProfileImage> createState() => _ChangeProfileImageState();
}

class _ChangeProfileImageState extends State<ChangeProfileImage> {
  late String? _initialImage;
  late File? _pickedImage;

  @override
  void initState() {
    var cubit = context.read<UpdateUserDataCubit>();
    _pickedImage = cubit.profileImage;
    _initialImage = widget.image;
    super.initState();
  }

  pickedImage() async {
    try {
      var cubit = context.read<UpdateUserDataCubit>();
      File? newProfileImage = await HelperMethod.getImageFromGallery();
      setState(() {
        _pickedImage = newProfileImage;
      });
      cubit.profileImage = newProfileImage;
    } catch (e) {
      HelperMethod.showErrorToast('Please Select Image',
          gravity: ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await pickedImage();
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage: _pickedImage != null
                ? FileImage(_pickedImage!) as ImageProvider<Object>
                : (_initialImage != null
                ? CachedNetworkImageProvider(_initialImage!) as ImageProvider<Object>
                : null),
          ),
          !widget.viewOnly
              ? const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 17,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
