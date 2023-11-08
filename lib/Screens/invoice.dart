// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:invoice_generator/util.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// import 'package:flutter/services.dart';
// import 'dart:typed_data';
// import 'package:printing/printing.dart';

class InvoiceTemplate extends StatelessWidget {
  final int total;
  final int tax = 5;
  late final double finalTotal;
  final pdf = pw.Document(title: "Invoice");

  // Uint8List? data;

  InvoiceTemplate({Key? key, required this.total}) : super(key: key) {
    finalTotal = total + (total * tax / 100);
  }

  // void image() async {
  //   data = (await rootBundle.load('assets/img/Z.png')).buffer.asUint8List();
  // }

  void initState() async {
    // image();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.ListView(
            children: [
              // pw.Image(pw.MemoryImage(data!), height: 100, width: 100),
              pw.Padding(
                padding: pw.EdgeInsets.all(16.0),
                child: pw.Column(
                  children: [
                    // Invoice header
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Invoice',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 28),
                        ),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text(
                              'Your Customer',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 16),
                            ),
                            pw.Text(
                              'Bravo Street S\njakarta, indonesia 2850',
                              style: pw.TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 50),

                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                          width: 70,
                        ),
                        // Container(),
                        pw.Expanded(
                          child: pw.Column(
                            children: [
                              pw.Row(
                                children: [
                                  pw.Text(
                                    'INVOICE      2023-123',
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ],
                              ),
                              pw.Divider(
                                thickness: 2,
                                color: PdfColor.fromInt(0xFF000000),
                              ),
                              pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text(
                                    'Item',
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.Text(
                                    'Qty',
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.Text(
                                    'Description',
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.Text(
                                    'Total',
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ],
                              ),
                              pw.Divider(
                                thickness: 2,
                                color: const PdfColor.fromInt(0xFF000000),
                              ),
                              for (var i = 1; i <= cartList.length; i++)
                                pdfRow(
                                    formatNumber(i),
                                    cartList.elementAt(i - 1)["name"],
                                    "${cartList.elementAt(i - 1)["price"]} \$"),
                              pw.SizedBox(
                                height: 70,
                              ),
                              pw.Divider(
                                thickness: 2,
                                color: const PdfColor.fromInt(0xFF000000),
                              ),
                              pw.Row(
                                children: [
                                  pw.SizedBox(
                                    width: 90,
                                  ),
                                  pw.Expanded(
                                    child: pw.Table(
                                      children: [
                                        pw.TableRow(children: [
                                          pw.Text(
                                            'Sub-total',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Text(
                                            total.toString(),
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                        ]),
                                        pw.TableRow(children: [
                                          pw.Text(
                                            'Tax',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Text(
                                            "$tax%",
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                        ]),
                                        pw.TableRow(children: [
                                          pw.Text(
                                            'Amount due',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                          pw.Text(
                                            finalTotal.toString(),
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold),
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    pw.Row(
                      children: [
                        pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(
                              height: 32,
                            ),
                            pw.Text(
                              'Order from Zomato',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 16),
                            ),
                            pw.SizedBox(
                              height: 16,
                            ),
                            pw.Text(
                              'Bravo Street S\njakarta, indonesia,\n2850',
                              style: pw.TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () async {
                  initState();

                  final pdfFile = await pdf.save();

                  final directory = await getDownloadsDirectory();
                  final filePath = '${directory?.path}/invoice.pdf';

                  final pdfFileFile = File(filePath);
                  await pdfFileFile.writeAsBytes(pdfFile);

                  var res = await OpenFile.open(filePath);
                  // res.type;
                  print(res.message);
                },
                child: const Text('Generate PDF')),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Printing.layoutPdf(
      //       onLayout: (format) {
      //         return pdf.save();
      //       },
      //     );
      //   },
      //   child: Icon(Icons.print),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  child: Image.asset('assets/img/Z.png'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Invoice header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Your Customer',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'Bravo Street S\njakarta, indonesia 2850',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                        ]),
                  ],
                ),
                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 70,
                    ),
                    // Container(),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                'INVOICE      2023-123',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(thickness: 2, color: Colors.black),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Qty',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(thickness: 2, color: Colors.black),
                          for (var i = 1; i <= cartList.length; i++)
                            RowItem(
                                itemNumber: formatNumber(i),
                                itemName: cartList.elementAt(i - 1)["name"],
                                itemPrice:
                                    "${cartList.elementAt(i - 1)["price"]} \$"),
                          const SizedBox(
                            height: 70,
                          ),
                          const Divider(thickness: 2, color: Colors.black),
                          Row(
                            children: [
                              const SizedBox(
                                width: 90,
                              ),
                              Expanded(
                                child: Table(
                                  children: [
                                    TableRow(children: [
                                      const Text(
                                        'Sub-total',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        total.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Text(
                                        'Tax',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "$tax%",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Text(
                                        'Amount due',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        finalTotal.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          'Order from Zomato',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Bravo Street S\njakarta, indonesia,\n2850',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Row(
                          children: [
                            Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Q4hcU4RO5X6uAYlqB6X-kit4tOIAmqYG7gJHZFg5gIyFcRbgGRN5fZt5JeGuBdgn52I&usqp=CAU",
                                height: 25),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'twitter',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png",
                                height: 25),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'instagram',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/640px-Facebook_icon_2013.svg.png",
                                height: 25),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'facebook',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String itemNumber;
  final String itemName;
  final String itemPrice;

  const RowItem(
      {super.key,
      required this.itemNumber,
      required this.itemName,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemNumber,
          style: const TextStyle(fontSize: 16),
        ),
        const Text(
          "01",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          itemName,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          itemPrice,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

pw.Row pdfRow(String itemNumber, String itemName, String itemPrice) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text(
        itemNumber,
        style: const pw.TextStyle(fontSize: 16),
      ),
      pw.Text(
        "01",
        style: const pw.TextStyle(fontSize: 16),
      ),
      pw.Text(
        itemName,
        style: const pw.TextStyle(fontSize: 16),
      ),
      pw.Text(
        itemPrice,
        style: const pw.TextStyle(fontSize: 16),
      ),
    ],
  );
}
