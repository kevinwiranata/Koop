import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import '../providers/StockProvider.dart';
import '../widgets/StockList.dart';
import '../widgets/FabMenu.dart';
import '../widgets/TabBar.dart' as TabBars;

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final _stockController = TextEditingController(); //stock ticker
    final stockProvider = Provider.of<StockProvider>(context);
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: Text(
            'Koop',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 200,
                child: TextField(
                  controller: _stockController,
                  decoration: InputDecoration(labelText: 'Stock Ticker'),
                  keyboardType: TextInputType.text,
                ),
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 36,
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await stockProvider.makeGetRequest(
                            _stockController.text, context);
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _isLoading = false;
                        });
                      },
                    ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StockList(),
          ),
        ],
      ),
    );
  }
}
