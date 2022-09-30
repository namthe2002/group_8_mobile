import 'package:flutter/material.dart';
import 'package:zoom/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data as dynamic).docs.length,
            itemBuilder: (context, index) {
              if((snapshot.data as dynamic).docs.length == 0) {
                return Center(child: Text('Lịch sử cuộc họp trống'),);
              }
              return Card(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(
                  color: Colors.green.shade300,
              ),
              borderRadius: BorderRadius.circular(15.0),),
                child: ListTile(
                  // shape: Border(
                  //   bottom: BorderSide(),
                  // ),
                  title: Text(
                      'Tên phòng: ${(snapshot.data as dynamic).docs[index]['meetingName']}'),
                  subtitle: Text(
                   'Chủ phòng: ${(snapshot.data as dynamic).docs[index]['hostName']}'
                        '\nTham gia vào lúc: ${(snapshot.data as dynamic).docs[index]['creatAt']}'
                  ),
                ),
              );
            },
          );
        });
  }
}
