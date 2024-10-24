import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: GoogleFonts.manrope(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Chats',
              style: GoogleFonts.manrope(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Menampilkan daftar pesan dengan chat-card style
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return _messageItem(
                    senderName: "Dr. Hewan $index", // Nama pengirim
                    lastMessage: "Pesan terakhir di sini...", // Pesan terakhir
                    time: "12:45 PM", // Waktu pesan
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5, // Sesuaikan dengan jumlah pesan
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _messageItem({required String senderName, required String lastMessage, required String time}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: const Color(0xFF818AF9),
        child: const Icon(
          FeatherIcons.messageCircle,
          color: Colors.white,
        ),
      ),
      title: Text(
        senderName,
        style: GoogleFonts.manrope(
            fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        lastMessage,
        style: GoogleFonts.manrope(fontSize: 14),
      ),
      trailing: Text(
        time,
        style: GoogleFonts.manrope(
            fontSize: 12, color: Colors.grey),
      ),
      onTap: () {
        // Tambahkan aksi ketika pesan diklik, bisa membuka chat detail
      },
    );
  }
}
