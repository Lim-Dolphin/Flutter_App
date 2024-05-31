import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Data',
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
      'image': 'assets/img/info.png',
      'text': [
        '이름 : 임백규',
        '자기 소개 : 안녕하세요! 임백규라고 합니다!\n게임 개발자를 희망하고 있습니다!\n게임으로 더 좋은 세상을 만들기 위해 노력하겠습니다!'
      ]
    },
    {
      'image': 'assets/img/SIHEUNG.png',
      'text': [ 
        '사는 곳 : 경기도 시흥시',
        '설명 : 태어난 곳은 수원이지만 가장 오래 산 곳은 시흥입니다.\n시흥에서 초중고 모두 나왔습니다.'
      ]
    },
    {
      'image': 'assets/img/Reseda_Odorata.jpg',
      'text': [ 
        '생일 : 2001.06.12',
        '설명 : 01년생이라 나이를 세기 정말 쉽습니다!\n항상 생일이 시험기간이라..언젠간 생일날 놀고싶네요\n사진은 탄생화 Reseda Odorata입니다.\n 꽃말은 \'매력\''
      ]
    },
    {
      'image': 'assets/img/Dankoook.png',
      'text': [ 
        '전공 : 단국대학교\n소프트웨어학과',
        '설명 : 20년도 단국대학교 소프트웨어학과에 SW인재전형으로 합격하였습니다.\n단국대학생인게 너무 좋고 전공이 잘맞아서 매우 재밌게 학교생활하고 있습니다.'
      ]
    },
    {
      'image': 'assets/img/ENTJ.jpg',
      'text': [ 
        'MBTI : ENTJ',
        '설명 : 순도 99.9999% ENTJ 입니다.\n감정 있습니다...\n물론 일이 더 소중하긴해요....'
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
        title: Text('Personal Data'),
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