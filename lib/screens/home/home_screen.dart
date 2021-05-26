import 'package:flutter/material.dart';
import 'package:yummy/screens/home/detail_screen.dart';
import 'package:yummy/screens/home/ajouter_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  void supprimerProduit(String produitId) {
    FirebaseFirestore.instance.collection('produits').doc(produitId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AjouterScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('produits').snapshots(),
          builder: (ctx, produitSnapshot) {
            if (produitSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final produits = produitSnapshot.data.docs;
            return ListView.builder(
              itemCount: produits.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(produits[index].id),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text(
                              "Voulez-vous vraiment supprimer ce produit ?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("OUI")),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("NON"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (DismissDirection direction) {
                    // supprimerProduit(produits[index].id);
                    print('produit supprimé avec succès');
                  },
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print(produits[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                              produitId: produits[index].id,
                              libelle: produits[index].data()['libelle'],
                              description:
                                  produits[index].data()['description'],
                              prix: produits[index].data()['prix'].toString(),
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://s3.amazonaws.com/rose.vero/wp-content/uploads/2019/03/07092449/GettyImages-louer-robe-mariage.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(produits[index].data()['libelle']),
                        subtitle:
                            Text(produits[index].data()['prix'].toString()),
                        trailing: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            splashColor: Colors.pink,
                            onTap: () {
                              print("Modification");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AjouterScreen(
                                      produitId: produits[index].id,
                                      libelle:
                                          produits[index].data()['libelle'],
                                      description:
                                          produits[index].data()['description'],
                                      prix: produits[index]
                                          .data()['prix']
                                          .toString(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.edit),
                            )),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
