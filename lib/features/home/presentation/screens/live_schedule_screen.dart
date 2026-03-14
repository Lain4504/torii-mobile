import 'package:flutter/material.dart';

class LiveScheduleScreen extends StatelessWidget {
  const LiveScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lịch học Live', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Week Selector
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildDayItem('T2', '12', false),
                _buildDayItem('T3', '13', false),
                _buildDayItem('T4', '14', true, primaryRed),
                _buildDayItem('T5', '15', false),
                _buildDayItem('T6', '16', false),
                _buildDayItem('T7', '17', false),
                _buildDayItem('CN', '18', false),
              ],
            ),
          ),
          
          const Divider(height: 1),

          // Timeline
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildTimeSlot('08:00', null),
                _buildTimeSlot('09:00', _buildLiveCard(
                  primaryRed,
                  title: 'Tiếng Nhật N5 – Kaiwa cơ bản',
                  sensei: 'Tanaka',
                  time: '09:00 – 10:00',
                  course: 'N5 Basic Communication',
                  status: 'JOIN',
                )),
                _buildTimeSlot('10:00', null),
                _buildTimeSlot('11:00', _buildLiveCard(
                  primaryRed,
                  title: 'Kanji N4 nâng cao',
                  sensei: 'Sato',
                  time: '11:00 – 12:00',
                  course: 'Intermediate Kanji',
                  status: 'LIVE',
                )),
                _buildTimeSlot('12:00', null),
                _buildTimeSlot('13:00', null),
                _buildTimeSlot('14:00', _buildLiveCard(
                  primaryRed,
                  title: 'JLPT N3 Grammar',
                  sensei: 'Yamada',
                  time: '14:00 – 15:30',
                  course: 'N3 Grammar Mastery',
                  status: 'REMIND',
                )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: primaryRed,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Đăng ký lớp live', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildDayItem(String day, String date, bool isSelected, [Color? color]) {
    return Container(
      width: 60,
      margin: const EdgeInsets.right(12),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected ? null : Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 4),
          Text(date, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(String time, Widget? card) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Text(time, style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold, fontSize: 12)),
        ),
        Expanded(
          child: Column(
            children: [
              if (card != null) card else const SizedBox(height: 60),
              const Divider(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLiveCard(Color primaryRed, {
    required String title,
    required String sensei,
    required String time,
    required String course,
    required String status,
  }) {
    bool isLive = status == 'LIVE' || status == 'JOIN';
    bool isReminder = status == 'REMIND';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLive ? primaryRed.withOpacity(0.05) : Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isLive ? primaryRed.withOpacity(0.2) : Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (status == 'LIVE')
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: primaryRed, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Đang LIVE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                )
              else if (status == 'JOIN')
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                  child: const Text('Chuẩn bị bắt đầu', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text('Sensei: $sensei', style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  course,
                  style: TextStyle(color: primaryRed.withOpacity(0.7), fontSize: 12, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isReminder ? Colors.white : primaryRed,
                  foregroundColor: isReminder ? primaryRed : Colors.white,
                  side: isReminder ? const BorderSide(color: primaryRed) : null,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  isReminder ? 'Đặt nhắc nhở' : 'Tham gia lớp',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
