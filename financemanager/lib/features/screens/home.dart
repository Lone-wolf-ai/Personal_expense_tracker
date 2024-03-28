import 'package:financemanager/features/constant/images.dart';
import 'package:financemanager/features/constant/listdata.dart';
import 'package:financemanager/features/models/hive.dart';
import 'package:financemanager/features/screens/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var history;
    final box = Hive.box<Add_data>('data');

    return Scaffold(
      body: SafeArea(
          top: false,
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 320, child: Topwidget()),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text(
                          "Transactions History",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        history = box.values.toList()[index];
                        return getList(history, index);
                      }, childCount: box.length),
                    )
                  ],
                );
              })),
    );
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: getlist(index, history));
  }

  ListTile getlist(int index, Add_data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset('assets/${history.name}.png'),
      ),
      title: Text(
        history.name,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}",
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        history.amount,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: (history.IN == 'Income') ? Colors.green : Colors.red),
      ),
    );
  }
}
