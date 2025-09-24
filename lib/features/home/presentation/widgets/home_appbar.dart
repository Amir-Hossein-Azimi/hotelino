import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:Hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, color: Colors.grey),
                  ),

                  Consumer<ProfileProvider>(
                    builder: (context, profileProvider, child) {
                      return profileProvider.profile?.notifications != null &&
                              profileProvider.profile!.notifications > 0
                          ? Positioned(
                            right: 12,
                            top: 14,
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: () {themeProvider.toggleTheme();},
                icon: Icon(
                  themeProvider.brightness == Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Consumer<ProfileProvider>(
            builder: (context, ProfileProvider, child) {
              return Row(
                children: [
                  Text("${ProfileProvider.profile?.name} " ?? " کاربر", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      ProfileProvider.profile?.avatarUrl ?? "https://picsum.photos/200/300",
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
