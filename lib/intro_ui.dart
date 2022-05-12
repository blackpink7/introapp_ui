import 'package:flutter/material.dart';
import 'package:introapp_ui/home_page.dart';

import 'Strings.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
static final String id="intro_page";
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int currenindex=0;


  @override
  void initState() {
    // TODO: implement initState
    _pageController=PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
                PageView(
                  onPageChanged: (int page){
                    setState(() {
                      currenindex=page;
                    });
                  },
                  controller: _pageController,
                  children: [
                    makeImage(
                      title: Strings.stepOneTitle,
                      content: Strings.stepOneContent,
                      image: "assets/images/image_1.png"
                    ),
                    makeImage(
                      title: Strings.stepTwoTitle,
                      content: Strings.stepTwoContent,
                      image: "assets/images/image_2.png"
                    )
                  ],
                ),
             Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._buildIndicator(),

                ]
            ),
          ),
             Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(currenindex==1)...{
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Skip",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.w400),),
                    ),
                  )
                }
              ],
            ),
          ),


        ],
      ),
    );
  }
  Widget makeImage({title,content,image,reverse=false}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 120,horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 34,),
              Text(title,style: TextStyle(color: Colors.red,fontSize: 30),),
              SizedBox(height: 10,),
              Text(content,textAlign: TextAlign.center,   style: TextStyle(color: Colors.grey,fontSize: 20) ,),
              Padding(
                  padding: EdgeInsets.all(50),
                child: Image.asset(image),
              )
            ],
          )
        ],
      ),
    );
  }


  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
    );
  }
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 2; i++) {
      if (currenindex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}
