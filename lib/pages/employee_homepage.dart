import 'package:chapacosales/widgets/table_card.dart';
import 'package:flutter/material.dart';

class EmployeeHomepage extends StatelessWidget {
  EmployeeHomepage({super.key});

  final String branchName = "Sucursal 2";
  final int columnCount = 3;

  final List<CardVariant> tableLayout = [
    CardVariant.reserved,
    CardVariant.available,
    CardVariant.reserved,
    CardVariant.occupied,
    CardVariant.occupied,
    CardVariant.occupied,
    CardVariant.disabled,
    CardVariant.available,
    CardVariant.occupied,
    CardVariant.available,
    CardVariant.occupied,
    CardVariant.available,
    CardVariant.notAvailable,
    CardVariant.available,
    CardVariant.disabled,
    CardVariant.disabled,
    CardVariant.available,
    CardVariant.available,
  ];

  @override
  Widget build(BuildContext context) {
    int tableNumber = 0;

    return (Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
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
                itemCount: tableLayout.length,
                itemBuilder: (context, index) {
                  if (tableLayout[index] != CardVariant.disabled) {
                    tableNumber++;
                  }
                  return TableCard(
                    title: tableNumber.toString(),
                    variant: tableLayout[index],
                    // Navigate to CreateSale to implement
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: const []),
    ));
  }
}
