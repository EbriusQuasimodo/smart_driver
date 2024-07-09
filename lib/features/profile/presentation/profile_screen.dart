import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/data/fake_auth_repository.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});

  //Список сотрудников
  final List<String> employess = [
    'Михаил',
    'Владимир',
    'Павел',
    'Михаил',
    'Михаил',
    'Владимир',
    'Павел',
    'Михаил',
    'Владимир',
    'Павел',
  ];

  //Список сотрудников
  final List<String> branches = [
    'Сосновский район',
    'Курчатовский район',
    'Ленинский район',
    'Центральный район',
    'Советский район',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(fakeAuthRepositoryProvider).logOut();
            },
            icon: const Icon(Icons.exit_to_app),
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide.none),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(15.0)),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('0 ₽', style: TextStyle(color: AppColors.white)),
                    const Spacer(),
                    TextButton(
                      focusNode: FocusNode(),
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            AppColors.pressedYellow),
                      ),
                      child: const Text(
                        'Пополнить',
                        style: TextStyle(color: AppColors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(children: [
                    ExpansionTile(
                      iconColor: AppColors.white,
                      collapsedIconColor: AppColors.white,
                      collapsedBackgroundColor: AppColors.black,
                      backgroundColor: AppColors.black,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      title: const Text(
                        'Список сотрудников',
                        style: TextStyle(color: AppColors.white),
                      ),
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: employess.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                textColor: AppColors.white,
                                onTap: () {},
                                title: Text(
                                  employess[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      iconColor: AppColors.white,
                      collapsedIconColor: AppColors.white,
                      collapsedBackgroundColor: AppColors.black,
                      backgroundColor: AppColors.black,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      title: const Text(
                        'Филиалы',
                        style: TextStyle(color: AppColors.white),
                      ),
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: branches.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                textColor: AppColors.white,
                                onTap: () {},
                                title: Text(
                                  branches[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: const Text(
                          'Название организации:',
                          style: TextStyle(color: AppColors.white),
                        ),
                        subtitle: const Text('ООО "Быстро и вкусно"',
                            style: TextStyle(color: AppColors.white)),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ]),
                )),
          ],
        ),
      ]),
    );
  }
}
