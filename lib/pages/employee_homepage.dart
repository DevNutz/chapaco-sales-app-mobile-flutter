import 'package:chapacosales/pages/order_page.dart';
import 'package:chapacosales/providers/table_provider.dart';
import 'package:chapacosales/widgets/table_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeHomepage extends StatelessWidget {
  const EmployeeHomepage({super.key});

  final String branchName = "Sucursal 2";
  final int columnCount = 3;

  @override
  Widget build(BuildContext context) {
    return Consumer<TableProvider>(
      builder: (context, tableProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
            ),
            title: Text(branchName),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Selecciona una mesa para poder registrar una venta",
                  style: TextStyle(height: 3),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnCount,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: tableProvider.tables.length,
                    itemBuilder: (context, index) {
                      return TableCard(
                        title: tableProvider.tables[index].tableNumber.toString(),
                        tableState: tableProvider.tables[index].state,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderPage(table: tableProvider.tables[index])));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(items: const []),
        );
      },
    );
  }
}
