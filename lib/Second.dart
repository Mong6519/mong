import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // พื้นหลังสีขาว
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // ลบเงาใต้บาร์
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // กดลูกศรเพื่อย้อนกลับ
          },
        ),
        title: const Text(
          "Kullanan_phitpheng",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- ส่วนบน: รูปโปรไฟล์และตัวเลขสถิติ ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // รูปโปรไฟล์แมว (ซ้าย)
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/icon/po.jpg'), // รูปเดียวกับหน้าแรก
                  ),
                  const SizedBox(width: 20),

                  // สถิติ (ขวา)
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem("5", "กำลังติดตาม"),
                        _StatItem("828.1 K", "ผู้ติดตาม"),
                        _StatItem("329.9 K", "ถูกใจ..."),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- ส่วนชื่อและไอดี ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Kullanan_phitpheng",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.verified, color: Colors.blue, size: 20), // ติ๊กถูกสีฟ้า
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "♪ Kullanan",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // --- ปุ่มติดตามสีเหลือง ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFE600), // สีเหลืองแบบในรูป
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "ติดตาม",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),

            // --- ตารางรูปภาพ (Grid) ---
            GridView.builder(
              shrinkWrap: true, // สำคัญมาก: ทำให้ Grid ไม่ error เมื่ออยู่ใน ScrollView
              physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ Grid (ใช้ของหน้าจอหลักแทน)
              itemCount: 6, // จำนวนรูปตัวอย่าง
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // แถวละ 3 รูป
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.8, // สัดส่วนรูป (สูงกว่ากว้างเล็กน้อย)
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  // ใส่รูปแมวตรงนี้ (ใช้รูปเดิมซ้ำๆ เป็นตัวอย่าง)
                  child: Image.asset(
                    'assets/icon/po.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// สร้าง Widget ย่อยสำหรับแสดงตัวเลขสถิติ เพื่อให้โค้ดสะอาด
class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}