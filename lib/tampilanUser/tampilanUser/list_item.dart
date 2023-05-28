import 'package:flutter/material.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';

class ListItem extends StatelessWidget{
  final EbookData ebook;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  ListItem({
    required this.ebook,
    required this.isDone,
    required this.onCheckboxClick
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            ///beralih ke halaman detail
            // child: InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => EbookDetail(
            //               ebook: ebooks[index],
            //             )));
            //   },
            //   child: Consumer<EbookProvider>(
            //     builder: (context, EbookProvider data, widget){
            //       return ListItem(
            //
            //       )
            //     },
            //   ),
            // ),
            margin: EdgeInsets.only(right: 8),
            height: 125,
            width: 83,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(ebook.cover),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ebook.judul,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'rating : ' + ebook.rating,
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
                      Text(ebook.halaman),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.star_sharp)
                    ],
                  )
                ],
              )
          ),
          Checkbox(
              value: isDone,
              onChanged: onCheckboxClick
          )
          // FavoriteButton()
        ],
      ),
    );
  }
}