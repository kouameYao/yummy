import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  final String produitId;
  final String libelle;
  final String description;
  final String prix;

  const DetailScreen({
    this.produitId,
    this.libelle,
    this.description,
    this.prix,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic> produit = {};

  DocumentSnapshot documentSnapshot;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                color: Colors.grey,
                child: Image.network(
                  'https://s3.amazonaws.com/rose.vero/wp-content/uploads/2019/03/07092449/GettyImages-louer-robe-mariage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.libelle,
                style: GoogleFonts.pattaya(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                style: GoogleFonts.pattaya(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.prix,
                style: GoogleFonts.pattaya(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(onPressed: () {}, child: Text("J'achete"))
            ],
          ),
        ),
      ),
    );
  }
}
