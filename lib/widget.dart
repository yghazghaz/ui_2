import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.image,
    required this.name,
    required this.prics,
    required this.rate,
    required this.countRate,
    required this.onTap,
    required this.onTapdelete,
    required this.count,
  });
  final String image;
  final String name;
  final String prics;
  final String rate;
  final String countRate;
  final Function() onTap;
  final Function() onTapdelete;
  final int count;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      shadowColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Stack(
            children: [
              Container(
                width: 160,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF6F6F6),
                ),
                child: Image.asset(widget.image),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child:
                    (widget.count > 0) 
                    ? Container(
                        width: 85,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap:
                                  widget.onTapdelete,
                              child: Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${widget.count}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ), 
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: widget.onTap, 
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: Icon(Icons.add, color: Colors.black),
                        ),
                      ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ), 
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/icons/star.svg"),
                    Text(
                      ' ${widget.rate}  (${widget.countRate})',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ), 
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  " ${widget.prics}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
