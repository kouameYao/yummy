import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AjouterScreen extends StatefulWidget {
  final String produitId;
  final String libelle;
  final String description;
  final String prix;

  AjouterScreen({this.produitId, this.libelle, this.description, this.prix});

  @override
  _AjouterScreenState createState() => _AjouterScreenState();
}

class _AjouterScreenState extends State<AjouterScreen> {
  bool get isEditing => widget.produitId != null;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  String errorMessage;
  // Note note;

  TextEditingController _libelleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  bool _isLoading = false;

  void _pickImage() async {
    final pickedImageFile = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    setState(() {
      _imageFile = pickedImageFile;
    });
  }

  void _ajoutProduit() async {
    // La ligne suivante permet de dismiss le keyboard
    FocusScope.of(context).unfocus();
    // final user  = FirebaseAuth.instance.currentUser;
    // La ligne suivante permet de recuperer les informations sur l'user depuis la collection users
    // final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    FirebaseFirestore.instance.collection('produits').add({
      // 'createdAt': Timestamp.now(),
      'libelle': _libelleController.text,
      'description': _descriptionController.text,
      'prix': _prixController.text,
    }).then((doc) => {print(doc.id)});

    _libelleController.clear();
    _descriptionController.clear();
    _prixController.clear();
  }

  void modifierProduit() {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance
        .collection('produits')
        .doc(widget.produitId)
        .set({
      'libelle': _libelleController.text,
      'description': _descriptionController.text,
      'prix': _prixController.text,
    });

    _libelleController.clear();
    _descriptionController.clear();
    _prixController.clear();
  }

  @override
  void initState() {
    getProduit();
    super.initState();
  }

  getProduit() {
    _libelleController.text = widget.libelle;
    _descriptionController.text = widget.description;
    _prixController.text = widget.prix;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: new Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
        ),
        title: Text(isEditing ? 'Modifier Produit' : 'Créer Produit',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isEditing && _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                      controller: _libelleController,
                      decoration: InputDecoration(hintText: 'Libelle')),
                  SizedBox(height: 12),
                  TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(hintText: 'description')),
                  SizedBox(height: 12),
                  TextField(
                      controller: _prixController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'prix')),
                  SizedBox(height: 12),
                  SizedBox(height: 12),
                  // Container(
                  //   width: size.width,
                  //   height: size.height * 0.3,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey,
                  //     borderRadius: BorderRadius.circular(10),
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //         'https://s3.amazonaws.com/rose.vero/wp-content/uploads/2019/03/07092449/GettyImages-louer-robe-mariage.jpg',
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: GestureDetector(
                  //       onTap: () {},
                  //       child: Icon(
                  //         Icons.camera,
                  //         size: 40,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isEditing ? modifierProduit : _ajoutProduit,
                      child: Text(
                        isEditing ? "Modifier" : "Enregistrer",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
