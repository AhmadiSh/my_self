
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_self/core/resource/assets/assets.dart';
import 'package:my_self/madules/main/ui/pages/main_page.dart';

import 'package:my_self/madules/setting/bloc/theme_bloc.dart';
import 'package:my_self/madules/setting/data/models/them_model.dart';
import 'package:provider/provider.dart';

enum Fonts {
// ignore: constant_identifier_names
  anjoman,
  dana,
  dastnevis,
  negar
}

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  List<String> background = [
    Assets.airplanepink,
    Assets.bigsur,
    Assets.dark1,
    Assets.dark2,
    Assets.earthygradient,
    Assets.flowershadownew,
    Assets.inclouds,
    Assets.onecloud,
    Assets.purplebridge,
    Assets.roadmark,
    Assets.snowfield,
    Assets.softsunset,
    Assets.treeshadow,
    Assets.waterfall,
  ];
  List fontsizez = [12, 20, 50, 68, 70];
  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    bool selected = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // ignore: prefer_const_constructors
            Align(


              
              alignment: Alignment.bottomRight,
              // ignore: prefer_const_constructors
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    textAlign: TextAlign.end,
                    'از این بخش میتونی به سلیقه خودت عکس پس زمینه و فونت ها رو تغییر بدی',
                    style: TextStyle(fontFamily: 'Anjoman'),
                  )),
            ),

// ignore: prefer_const_constructors
            Align(
              alignment: Alignment.topRight,
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'فونت',
                  style: TextStyle(fontFamily: 'Anjoman'),
                ),
              ),
            ),

            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<ThemeBloc>(builder: (context, bloc, child) {
                return ListView.builder(
                  
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: Fonts.values.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              bloc.setTheme(ThemeModel(
                                  font: Fonts.values[index].name,
                                  background: bloc.backgrounds,
                                  fontSize: bloc.fontsizes));
                            },
                            child: Container(
                            

                                // ignore: sort_child_properties_last
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child:
                                      Text('${Fonts.values[index].name}'),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: bloc.fontanames ==
                                            Fonts.values[index].name
                                        ? const Color(0xfff55f40)
                                        : const Color(0xff505050),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ) //)),

                                ),
                          ));
                    }));
              }),
            ),

            // ignore: prefer_const_constructors
            Align(
              alignment: Alignment.bottomRight,
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  ' فونت سایز',
                  style: TextStyle(fontFamily: 'Anjoman'),
                ),
              ),
            ),

            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<ThemeBloc>(builder: (context, bloc, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: bloc.fontsize.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              bloc.setTheme(ThemeModel(
                                  font: bloc.fontanames,
                                  background: bloc.backgrounds,
                                  fontSize: bloc.fontsize[index]));
                            },
                            child: Container(
                                // ignore: sort_child_properties_last
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text('${bloc.fontsize[index]}'),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        bloc.fontsizes == bloc.fontsize[index]
                                            ? const Color(0xfff55f40)
                                            : const Color(0xff505050),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ) //)),

                                ),
                          ));
                    }));
              }),
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Consumer<ThemeBloc>(builder: (context, bloc, child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        itemBuilder: (context, index) {
                          return Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                bloc.setTheme(ThemeModel(
                                    background: [background[index]],
                                    fontSize: bloc.fontsizes,
                                    font: bloc.fontanames));

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  MainPage()),
                                );
                                selected = true;
                              },
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: context.select<ThemeBloc, bool>(
                                                (bloc) =>
                                                    // ignore: unrelated_type_equality_checks
                                                    bloc.backgrounds?[0] ==
                                                    background[index])
                                            ? const Color(0xfff55f40)
                                            : const Color(0xffffffff)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(background[index]),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                ),
                                Icon(context.select<ThemeBloc, bool>((bloc) =>
                                        bloc.backgrounds?[0] ==
                                        background[index])
                                    ? Icons.check
                                    : null)
                              ]),
                            );
                          });
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 120,
                                childAspectRatio: 3 / 5,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        itemCount: 14,
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
