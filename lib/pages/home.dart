import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/home_widgets/continue_button.dart';
import '../components/home_widgets/manage_button.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(

          elevation: 0,
          backgroundColor: const Color(0xFFC7EDF1 ),
        ),//BFEBF0
        backgroundColor: const Color(0xFFC7EDF1),
        body: Column(
          children: [
            Container(

              height: MediaQuery.of(context).size.height / 7,

              child: const Center(
                child: Text(
                  'WORKOUTS',
                  style: TextStyle(
                      fontFamily: 'Caveat', color: Colors.black, fontSize: 30),
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Lottie.asset('assets/img/53837-jumping-jack.json'),
                )),

            continue_button(),
            setup_button()
          ],
        )
      // CustomScrollView(slivers: <Widget>[
      //   const SliverAppBar(
      //     title: MainAppBar(),
      //     backgroundColor: Color(0xFFBFEBF0),
      //     pinned: true,
      //     expandedHeight: 200,
      //     shape: ContinuousRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(100),
      //             bottomRight: Radius.circular(100))),
      //   ),
      //   SliverList(
      //       delegate: SliverChildListDelegate(
      //           <Widget>[continue_button(), setup_button()]))
      // ]),
    );
  }
}
