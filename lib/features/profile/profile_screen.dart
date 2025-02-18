import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool isToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Hello World", style: TextStyle(fontSize: 30)),
            isToggle
                ? SizedBox(
                  height: 100, // กำหนดความสูงของ ListView
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal, // ให้ ListView เป็นแนวนอน
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(), // ทำให้เลื่อนสไลด์ได้
                    itemBuilder: (context, index) {
                      return Icon(
                        Icons.home_outlined,
                        size: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.red,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10); // ใช้ width แทน height
                    },
                    itemCount: 20,
                  ),
                )
                : Text("MSL"),
            // isToggle
            //     ? ListView.separated(
            //       scrollDirection: Axis.vertical, // ให้ ListView เป็นแนวนอน
            //       shrinkWrap: true,
            //       physics: BouncingScrollPhysics(), // ทำให้เลื่อนสไลด์ได้
            //       itemBuilder: (context, index) {
            //         return Icon(
            //           Icons.home_outlined,
            //           size: MediaQuery.of(context).size.width * 0.1,
            //           color: Colors.red,
            //         );
            //       },
            //       separatorBuilder: (context, index) {
            //         return SizedBox(width: 10); // ใช้ width แทน height
            //       },
            //       itemCount: 20,
            //     )
            //     : Text("MSL"),
          ],
        ),
      ),
    );
  }
}
