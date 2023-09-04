import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/data_provider.dart';
import '../consts/app_texts.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    final bookData = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitleText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bookData.getBook != null
                      ? '$autherNameTxt : ${bookData.getBook!.auther!.firstname} ${bookData.getBook!.auther!.lastname}'
                      : '',
                ),
              ),
            ),
            bookData.getBook != null
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        pageContentText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: bookData.getBook != null
                  ? ListView.builder(
                      itemCount: bookData.getBook!.data!.dataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '${bookData.getBook!.data!.dataList[index].firstName} ${bookData.getBook!.data!.dataList[index].lastName}'),
                        );
                      },
                    )
                  : const SizedBox(),
            ))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _loadBookData,
            child: const Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: _deleteData,
              child: const Icon(
                Icons.delete,
                size: 22,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _loadBookData() async {
    await ctx.read<DataProvider>().getData();
  }

  void _deleteData() {
    ctx.read<DataProvider>().deleteHiveData();
  }
}
