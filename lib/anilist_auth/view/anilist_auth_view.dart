import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/anilist_auth/mixins/anilist_auth_mixin.dart';
import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';

enum AnilistMenuItem {
  auth,
  logout,
}

class AnilistAuthView extends StatefulWidget {
  const AnilistAuthView({super.key});

  @override
  State<AnilistAuthView> createState() => _AnilistAuthViewState();
}

class _AnilistAuthViewState extends State<AnilistAuthView>
    with ProtocolListener, AnilistAuthMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
      builder: (context, state) {
        Query$Viewer$Viewer? user;

        if (state.runtimeType == AnilistAuthSuccess) {
          user = (state as AnilistAuthSuccess).me;
        }

        return Material(
          color: Colors.transparent,
          child: PopupMenuButton(
            onSelected: (value) async {
              if (value == AnilistMenuItem.auth) login(context);
              if (value == AnilistMenuItem.logout) logout(context);
            },
            tooltip: user == null
                ? 'Anilist'
                : 'Connected to Anilist as ${user.name}',
            icon: user == null
                ? const Icon(
                    SimpleIcons.anilist,
                    color: Color(0xFF02A9FF),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar!.medium!),
                  ),
            itemBuilder: (context) {
              switch (state.runtimeType) {
                case AnilistAuthLoggedOut:
                case AnilistAuthPending:
                case AnilistAuthError:
                  return [
                    PopupMenuItem<AnilistMenuItem>(
                      value: AnilistMenuItem.auth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('Log in'),
                          ),
                          Icon(Icons.open_in_new),
                        ],
                      ),
                    )
                  ];

                case AnilistAuthSuccess:
                  return [
                    PopupMenuItem<AnilistMenuItem>(
                      value: AnilistMenuItem.logout,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
                  ];

                default:
                  return [];
              }
            },
          ),
        );
      },
    );
  }
}
