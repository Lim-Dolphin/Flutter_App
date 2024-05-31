import 'package:flutter/material.dart';

class Dislike extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dislike',
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
      'image': 'assets/img/mugituck.jpg',
      'text': [
        '1. 부정적이고 의욕없는\n태도를 가진 사람',
        '설명 : 부정적이고 의욕없는 태도를 가진 사람을 매우 싫어합니다.\n자신이 이런 모습이 되는 것도 매우 싫어해 스스로를 채찍질 할 때가 많습니다.\n사람은 도전하고자 하는 의지가 삶을 살아가는 것이라고 생각합니다.'
      ]
    },
    {
      'image': 'assets/img/scary.jpg',
      'text': [ 
        '2. 무서운 영화',
        '설명 : 공포 영화는....잘 보지 못합니다...\n갑툭튀에 약한 편이라 잘 놀랍니다.'
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
        title: Text('Dislike'),
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