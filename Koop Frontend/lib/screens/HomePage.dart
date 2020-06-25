import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/StockProvider.dart';
import '../widgets/StockList.dart';
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
    final _stockController = TextEditingController();  //stock ticker
    final stockProvider = Provider.of<StockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
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
