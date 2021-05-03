import 'package:flutter/material.dart';
import 'package:flutter_car_app/constants.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final int count = 9;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(height: Get.size.height),
          _buildPageView(), // 넘어가는 페이지뷰
          _buildDotList(), // 점 버튼 리스트
          _buildMenuCard(), // 메뉴 카드
        ],
      ),
    );
  }

  Positioned _buildMenuCard() {
    return Positioned(
      top: (Get.size.height * 0.6) - 80,
      left: Get.size.width * 0.05, // 최대 길이 0.9의 나머지인 1.0의 반
      child: Container(
        height: 160,
        width: Get.size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIconMenu(Icons.qr_code, '구매 상담'),
          ],
        ),
      ),
    );
  }

  Widget _buildIconMenu(IconData iconData, String text){
    return Row(
      children: [
        Icon(iconData),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }

  Positioned _buildDotList() {
    return Positioned(
      top: Get.size.height * 0.45,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count + 1, (index) {
          if (index == count) return _buildPauseButton();
          return _buildDot(index);
        }),
      ),
    );
  }

  Widget _buildPauseButton() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.pause,
        color: Colors.white,
        size: 10,
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 15),
      width: currentIndex == index ? 30 : 8,
      height: 8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        color: currentIndex == index ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  SizedBox _buildPageView() {
    return SizedBox(
      height: Get.size.height * 0.6,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: count,
        itemBuilder: (context, index) => _buildPageViewItem(),
      ),
    );
  }

  Widget _buildPageViewItem() {
    return Stack(
      children: [
        _buildBg(), // 배경 사진
        _buildTextAndButton(), // 텍스트와 버튼
      ],
    );
  }

  Positioned _buildTextAndButton() {
    return Positioned(
      top: Get.size.height * 0.07,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            '하이엔드 라이프의 시작',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            width: 170,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '카니발 하이리무진',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildBg() {
    return Container(
      height: Get.size.height * 0.6,
      width: double.infinity,
      color: kPrimaryColor,
    );
  }
}
