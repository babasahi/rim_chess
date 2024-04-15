import 'package:flutter/material.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/models/models.dart';
import 'package:rim_chess/services/database/database.dart';
import 'package:rim_chess/views/components/common_components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: screenPadding(context),
          child: Column(
            children: [
              FutureBuilder<Player?>(
                future: player(1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.active) {
                    return const Center(
                      child: AppLoader(),
                    );
                  } else {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Text(snapshot.data!.name);
                    } else {
                      return Center(
                        child: Text(
                          'pleaseCheckInternetConnection',
                          style: kNormalTextStyle.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
