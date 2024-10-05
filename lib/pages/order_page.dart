import 'package:chapacosales/models/product.dart';
import 'package:chapacosales/models/table.dart';
import 'package:chapacosales/models/table_state.dart';
import 'package:chapacosales/providers/product_provider.dart';
import 'package:chapacosales/providers/table_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final CustomerTable table;

  const OrderPage({super.key, required this.table});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Product? selectedProduct;
  final searchProductController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TableProvider, ProductProvider>(
        builder: (context, tableProvider, productProvider, child) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mesa ${widget.table.tableNumber}",
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Estado de la mesa",
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: TableState.values
                        .where((state) => state != TableState.disabled)
                        .map((state) {
                      return ChoiceChip(
                        showCheckmark: false,
                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        label: Text(state.name),
                        selected: widget.table.state == state,
                        onSelected: (value) {
                          setState(() {
                            tableProvider.updateTableState(
                                widget.table.id, state);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  DropdownMenu<Product>(
                    controller: searchProductController,
                    enableSearch: true,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    width: MediaQuery.of(context).size.width,
                    label: const Text("Nombre del Producto"),
                    onSelected: (Product? value) {
                      setState(() {
                        selectedProduct = value;
                      });
                    },
                    dropdownMenuEntries:
                        productProvider.products.map((product) {
                      return DropdownMenuEntry<Product>(
                        value: product,
                        label: product.name,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 240,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text("Cantidad"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF6D5E0F)),
                              foregroundColor: const Color(0xFF6D5E0F),
                              minimumSize: const Size(160, 48)),
                          child: const Text("Agregar"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF6D5E0F)),
                        foregroundColor: const Color(0xFF6D5E0F),
                        minimumSize: const Size(160, 48)),
                    child: const Text("Descartar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6D5E0F),
                        foregroundColor: Theme.of(context).colorScheme.surface,
                        minimumSize: const Size(160, 48)),
                    child: const Text("Confirmar"),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
