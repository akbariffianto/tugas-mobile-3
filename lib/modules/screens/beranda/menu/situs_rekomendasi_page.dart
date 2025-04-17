import 'package:flutter/material.dart';
import 'package:tugas_tpm_3/modules/data/data_rekomendasi.dart';
import 'package:tugas_tpm_3/modules/model/model_rekomendasi.dart';
import 'package:url_launcher/url_launcher.dart';

class SitusRekomendasiPage extends StatefulWidget {
  const SitusRekomendasiPage({super.key});

  @override
  State<SitusRekomendasiPage> createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Situs Rekomendasi Game Playstore"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Rekomendasi"),
            Tab(text: "Favorit"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRekomendasiList(),
          _buildFavoritList(),
        ],
      ),
    );
  }

  Widget _buildRekomendasiList() {
    return ListView.builder(
      itemCount: DataRekomendasi.games.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final game = DataRekomendasi.games[index];
        return _buildGameCard(game);
      },
    );
  }

  Widget _buildFavoritList() {
    final favoritGames = DataRekomendasi.games.where((game) => game.favorite).toList();
    return favoritGames.isEmpty
        ? const Center(
            child: Text(
              "Belum ada game favorit",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: favoritGames.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return _buildGameCard(favoritGames[index]);
            },
          );
  }

  Widget _buildGameCard(ModelRekomendasi game) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(game.link)),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 188, 192, 255),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  game.gambar,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 50);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                game.nama,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                game.deskripsi,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.grey[700],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            game.favorite = !game.favorite;
                            if (game.favorite) {
                              game.likes++;
                            } else {
                              game.likes--;
                            }
                          });
                        },
                        icon: Icon(
                          game.favorite ? Icons.favorite : Icons.favorite_border,
                          color: game.favorite ? Colors.red : null,
                        ),
                      ),
                      Text(
                        "${game.likes} Likes",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    game.harga == 0.0 ? 'Gratis' : 'Rp. ${game.harga}',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
