import 'package:flutter/material.dart';

class Tech_Stack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech_Stack',
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
      'image': ['assets/img/like.jpg'],
      'text': [
        '약력',
        '20.03 단국대학교 소프트웨어학과 입학',
        '22.11 대한민국 육군 특수전사령부 예하 11공수 특전여단 병장 전역',
        '22.12 단국대학교 소프트웨어학과 진 학생회 코딩대회 1등',
        '23.01 단국대학교 SW융합대학 이음 학생회 코딩대회 3등',
        '23.01~24.2 컴세바 코딩학원 강사',
        '24.03~ 단국대학교 SWAG 알고리즘 동아리 회장'
      ]
    },
    {
      'image': ['assets/img/C++.png', 'assets/img/C.png', 'assets/img/cc.png', 'assets/img/java.png', 'assets/img/python.png'],
      'text': [ 
        '1. 사용가능 언어',
        'C++을 주력으로 C 개열 언어가 주력이며 서브는 java, python입니다.'
      ]
    },
    {
     'image': ['assets/img/NEXON-LOGO.png'],
     'text': [ 
       '2. 진로희망 및 희망 개발',
       '-진로희망 : 게임 클라이언트 개발자'
      ]
    },
    {
     'image': ['assets/img/unreal.png','assets/img/unity.png'],
     'text': [ 
       '3. 성장 중인 기술 스택',
       '현재 학습 중 입니다.'
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
        title: Text('Tech_Stack'),
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
                    Column(
                        children: [
                          for(String paragraph in _pages[index]['image'])
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child:
                                Image.asset(paragraph,
                                      width : 400,
                                      height : 400),
                            )
                          )
                        ]
                      )
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