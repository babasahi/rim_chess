import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              SizedBox(height: screenHeight(context) * 0.03),
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
                      Player currentPlayer = snapshot.data!;
                      return Column(
                        children: [
                          ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl:
                                  avatarUrl + currentPlayer.playerId.toString(),
                              errorWidget: (context, url, error) {
                                return const Icon(FontAwesomeIcons.warning);
                              },
                            ),
                          ),
                          Text(
                            currentPlayer.name,
                            style: kNormalTextStyle,
                          ),
                          Text(
                            currentPlayer.phoneNumber,
                            style: kNormalTextStyle,
                          )
                        ],
                      );
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
