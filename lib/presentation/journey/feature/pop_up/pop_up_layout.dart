
import 'package:dsvm_app/common/bloc/loading_bloc/loading_state.dart';
import 'package:dsvm_app/common/constants/images_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/bloc/loading_bloc/loading_bloc.dart';


class LoadingContainer extends StatelessWidget {
  final Widget child;
  const LoadingContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          Stack(
            children: [
              BlocBuilder<LoadingBloc, PopUpState>(
                  bloc: BlocProvider.of(context),
                  buildWhen: (pre, state) {
                    return state is Loading || state is Loaded;
                  },
                  builder: (context, state) {
                    return Visibility(
                        visible: state.loading ?? true,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                ImageConstant.loading,
                                width: 80.w,
                                height: 80.w,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ));
                  })
            ],
          )
        ],
      ),
    );
  }
}