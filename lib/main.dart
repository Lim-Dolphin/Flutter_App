import 'package:flutter/material.dart';
import 'package:self_introduce_app/custom_icon_icons.dart';
import 'package:self_introduce_app/Home.dart';
import 'package:self_introduce_app/Favorite.dart';
import 'package:self_introduce_app/Dislike.dart';
import 'package:self_introduce_app/Tech_Stack.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer player = AudioPlayer();

  @override
  void initState(){
    super.initState();
    _playMusic();
  }
  void _playMusic() async {
    await player.setSource(AssetSource('audios/Zelda_OST.wav'));
    await player.setReleaseMode(ReleaseMode.loop);
    await player.resume();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch(selectedIndex){
      case 0:
        page = Home();
        break;
      case 1:
        page = Favorite();
        break;
      case 2:
        page = Dislike();
        break;
      case 3:
        page = Tech_Stack();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    //커스텀 아이콘으로 메뉴바 생성
                    NavigationRailDestination(              
                      icon: Icon(CustomIcon.triforce),
                      label: Text('Personal Data'),
                      ),
                    NavigationRailDestination(
                        icon: Icon(CustomIcon.nestedhearts),
                        label: Text('Favorites'),
                      ),
                    NavigationRailDestination(
                        icon: Icon(CustomIcon.maskedspider),
                        label: Text('Dislike'),
                      ),
                    NavigationRailDestination(
                        icon: Icon(CustomIcon.broadsword),
                        label: Text('Tech_Stack'),
                      ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color : Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
