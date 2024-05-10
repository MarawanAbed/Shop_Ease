import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/ecommerce/profile/presentation/widgets/profile_items.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var light = theme.brightness == Brightness.light;
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          ProfileItems(
            title: lang.my_account,
            light: light,
            icon: Icons.person,
            routes: Routes.myAccount,
          ),
          const Spacer(),
          ProfileItems(
            title: lang.about_us,
            light: light,
            icon: Icons.info,
            routes: Routes.aboutUs,
          ),
          const Spacer(),
          ProfileItems(
            title: lang.settings,
            light: light,
            icon: Icons.settings,
            routes: Routes.settings,
          ),
          const Spacer(),
          ProfileItems(
            light: light,
            title: lang.logout,
            icon: Icons.logout_outlined,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
