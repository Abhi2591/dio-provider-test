import 'package:dio_test/provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Testing'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Consumer<HomeScreenProvider>(
          builder: (BuildContext context,HomeScreenProvider value,Widget? child) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Button :
                  GestureDetector(
                    onTap: value.getFakeStoreData,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text(
                        'Call API',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  // Data Listing :
                  Expanded(
                      child: value.isAPILoading
                          ?
                          const Center(
                            child: CircularProgressIndicator(color: Colors.blue,),
                          )
                      :
                      ListView.separated(
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    value.dummyList[index]['image'],
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              title: Text(value.dummyList[index]['title']),
                              trailing: Text(
                                '\$${value.dummyList[index]['price']}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(height: 10,color: Colors.black38,);
                          },
                          itemCount: value.dummyList.length ?? 0
                      )
                  )
                ],
              ),
            );
          },
      ),
    );
  }
}
