import 'package:flutter/material.dart';

class Favorite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SlideImagePage(),
    );
  }
}

class SlideImagePage extends StatefulWidget {
  @override
  _SlideImagePageState createState() => _SlideImagePageState();
}

class _SlideImagePageState extends State<SlideImagePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'image': 'assets/img/zelda.jpg',
      'text': [
        '1. 젤다의 전설 게임',
        '설명 : 젤다의 전설 게임 시리즈를 매우 좋아합니다!\n초등학교 4학년 때 처음 접하였고 그 덕에 게임 개발자라는 꿈을 키우게 되었습니다.\n나아가 프로그래밍을 시작하게된 계기이자 지금의 저를 만든 게임입니다.'
      ]
    },
    {
      'image': 'assets/img/queen.webp',
      'text': [ 
        '2. Queen 음악',
        '설명 : Queen음악을 매우 좋아합니다.\n가장 좋아하는 곡은 \'Bohemian Rhapsody\'입니다.\n어릴 때 부터 즐겨들었고 그 덕에 일렉기타를 취미로 가지고 있습니다.\n좋아하는 이유는 다른 락 밴드와는 다른 독특하고 창의적이기 때문입니다.'
      ]
    },
    {
      'image': 'assets/img/food.jpg',
      'text': [ 
        '3. 요리',
        '설명 : 요리하는 걸 좋아합니다.\n요리 유튜브를 보고 따라하는 걸 매우 좋아합니다.\n요리는 프로그래밍과 매우 비슷하다고 생각합니다.\n그래서 더 좋아하는 것 같기도 합니다.\n사진은 직접만든 수비드 안심 버거 입니다.'
      ]
    },
    {
      'image': 'assets/img/programming.jpg',
      'text': [ 
        '4. 프로그래밍',
        '설명 : 프로그래밍을 매우 좋아합니다!\n대학교오면 코딩을 많이 할 줄 알았는데 이론만 엄청 배워서 매우 아쉽습니다.\n특히 알고리즘 푸는 걸 좋아하고 백준 랭크는 현재 골드 1 입니다.\n주력 언어는 C++ 입니다!'
      ]
    },
    {
      'image': 'assets/img/jungjo.webp',
      'text': [ 
        '5. 정조와 역사',
        '설명 : 역사를 매우 좋아합니다.\n가장 좋아하는 인물은 \'정조\'입니다.\n\'리더라면 정조 처럼\'이라는 책을 읽고 정조를 매우 좋아하게 되었습니다.\n정조의 리더쉽과 삶을 보며 배울 점이 참 많다고 생각합니다.\n우리나라의 역사를 매우 좋아하고 우리나라의 문화도 매우 좋아합니다.\n우리나라의 역사와 문화를 담은 게임을 만들어서 성공하는 것이 저의 목표입니다.'
      ]
    },
    {
      'image': 'assets/img/alchol.jpg',
      'text': [ 
        '6. 술',
        '설명 : 술은 정말 매우 좋아합니다!\n특히 칵테일과 위스키를 매우 좋아해서 집에서 만들기도하고 바도 자주 다닙니다.\n가장 좋아하는 술은 Wild Turkey 101입니다.\n칵테일은 마티니 입니다.\n사진은 직접만든 버번 하이볼입니다.'
      ]
    },
    {
      'image': 'assets/img/guren.webp',
      'text': [ 
        '7. 애니메이션',
        '설명 : 애니메이션을 매우 좋아합니다.\n애니를 통해서 동기부여를 하기도 하고 감성도 채우고 있습니다.\n다른 사람들은 오타쿠라고 놀릴지 모르지만 저는 상당히 좋은 문화라고 생각합니다.\n만화 주인공 처럼 열혈로 사는 것도 멋지다고 생각합니다.'
      ]
    },
  ];

  void _nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % _pages.length;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          _pages[index]['text'][0],
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                        for(String paragraph in _pages[index]['text'].skip(1))
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              paragraph,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ]
                    ),
                    Image.asset(_pages[index]['image']!,
                                  width : 400,
                                  height : 400),
                  ],
                );
              },
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              child: Text('Next Data'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}