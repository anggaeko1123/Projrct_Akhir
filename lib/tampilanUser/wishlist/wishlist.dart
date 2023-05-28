import 'package:flutter/material.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';
import 'package:myflutterapp/provider/list_provider.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget{
  Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final List myList =
        Provider.of<ListProvider>(
          context,
          listen: false,
        ).myList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Wishlist'),
      ),


      body: ListView.builder(
        itemBuilder: (context, index){
          final EbookData data = myList[index];
          return Container(
            width: 122,
            margin: EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: InkWell(
                    onTap: (){

                    },
                  ),
                  width: 121.66,
                  height: 180.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(myList[index].cover),
                          fit: BoxFit.cover
                      )
                  ),
                ),

                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myList[index].judul,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'rating : ' + myList[index].rating,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.content_copy),
                            Text(myList[index].halaman),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.star_sharp)
                          ],
                        )
                      ],
                    )
                ),
                TextButton(
                  child: Text(
                    'hapus',
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                  onPressed: (){
                    context.read<ListProvider>().removeFromList(data);
                  },
                )
              ],
            ),
          );
        },
        itemCount: myList.length,
      ),
    );
  }
}