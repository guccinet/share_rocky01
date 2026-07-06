import 'package:flutter/material.dart';
import '../model/Activity.dart';
import '../service/ActivityDBHelper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActivityListScreen extends StatelessWidget {
  const ActivityListScreen({super.key});

  // void updateActivity(BuildContext context, String docId) {
  // }

  // void deleteActivity(BuildContext context, String docId) async {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Activities'),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<Activity>>(
        stream: ActivityDBHelper.getActivitiesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Data not found'));
          }

          final actlist = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: actlist.length,
            itemBuilder: (context, index) {
              final act_item = actlist[index];

            return Slidable(
  // Specify a key if the Slidable is dismissible.
  key: const ValueKey(0),

  // The start action pane is the one at the left or the top side.
  endActionPane: ActionPane(
    motion: const ScrollMotion(),
    children: [
      SlidableAction(
        flex: 2,
        onPressed: (BuildContext context) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item archived'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: const Color(0xFF7BC043),
        foregroundColor: Colors.white,
        icon: Icons.archive,
        label: 'Archive',
      ),
      SlidableAction(
        onPressed: (BuildContext context) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item Saved'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: const Color(0xFF0392CF),
        foregroundColor: Colors.white,
        icon: Icons.save,
        label: 'Save',
      ),
    ],
  ),

        child: Card(

              // return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(
                    act_item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    act_item.desc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey,
                  ),

                  // onTap: () {
                  //   // TODO: Navigator.push to view participate
                  // },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Placeholder(),
                      ),
                    );
                  }, //onTab
                ),
              ),
             ); //card
            },
          );
        },
      ),
    );
  }
}
