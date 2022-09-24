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
              return ListTile(
                title: Text(
                    'Tên phòng: ${(snapshot.data as dynamic).docs[index]['meetingName']}'),
                subtitle: Text(
                  'Tham gia vào lúc: ${(snapshot.data as dynamic).docs[index]['creatAt']}'
                ),
              );
            },
          );
        });
  }
}
