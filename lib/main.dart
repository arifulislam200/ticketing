import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ট্রেন টিকিট',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006BBF)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'ট্রেন টিকিট',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF006BBF),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'বাংলাদেশে ট্রেন যাত্রা বুক করুন',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 50),
                Text(
                  'লগইন করুন',
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailInput,
                  decoration: InputDecoration(
                    labelText: 'ইমেইল',
                    hintText: 'আপনার ইমেইল লিখুন',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordInput,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: 'পাসওয়ার্ড',
                    hintText: 'আপনার পাসওয়ার্ড লিখুন',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006BBF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'লগইন',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'নতুন? রেজিস্ট্রেশন করুন',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabIndex == 0 ? TrainsPage() : MyBookingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'ট্রেন',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'বুকিং',
          ),
        ],
      ),
    );
  }
}

class TrainsPage extends StatelessWidget {
  TrainsPage({Key? key}) : super(key: key);

  final trainsList = [
    {
      'name': 'তূরাগ এক্সপ্রেস',
      'from': 'ঢাকা',
      'to': 'চট্টগ্রাম',
      'price': 650,
      'image': 'assets/train_images/turag_express.png',
      'time': '১০:৩০ পূর্বাহ্ন',
      'seats': 80,
    },
    {
      'name': 'রূপালী এক্সপ্রেস',
      'from': 'ঢাকা',
      'to': 'সিলেট',
      'price': 850,
      'image': 'assets/train_images/rupali_express.png',
      'time': '০৬:০০ সকাল',
      'seats': 100,
    },
    {
      'name': 'মহানন্দা এক্সপ্রেস',
      'from': 'ঢাকা',
      'to': 'খুলনা',
      'price': 750,
     
      'image': 'assets/train_images/mahananda_express.png',
      'time': '০৮:১৫ সকাল',
      'seats': 120,
    },
    {
      'name': 'পদ্মা এক্সপ্রেস',
      'from': 'ঢাকা',
      'to': 'বরিশাল',
      'price': 550,
      'image': 'assets/train_images/padma_express.png',
      'time': '১২:০০ দুপুর',
      'seats': 90,
    },
    {
      'name': 'উড়িয়সা এক্সপ্রেস',
      'from': 'ঢাকা',
      'to': 'রাজশাহী',
      'price': 900,
      'image': 'assets/train_images/odisha_express.png',
      'time': '১৫:৪৫ অপরাহ্ন',
      'seats': 110,
    },
    {
      'name': 'নীলসাগর এক্সপ্রেস',
      'from': 'চট্টগ্রাম',
      'to': 'কক্সবাজার',
      'price': 500,
      'image': 'assets/train_images/nilsagar_express.png',
      'time': '০৭:৩০ সকাল',
      'seats': 75,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ট্রেন টিকিট বুক করুন', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF006BBF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: trainsList.length,
        itemBuilder: (context, index) {
          final train = trainsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainDetailPage(trainData: train),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  children: [
                    Image.asset(
                      train['image'] as String,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 140,
                          color: Colors.grey[300],
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            train['name'] as String,
                            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.route, size: 12, color: Colors.grey),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${train['from']} → ${train['to']}',
                                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '৳${train['price']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF006BBF),
                                ),
                              ),
                              Text(
                                train['time'] as String,
                                style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TrainDetailPage extends StatefulWidget {
  final Map<String, dynamic> trainData;

  const TrainDetailPage({Key? key, required this.trainData}) : super(key: key);

  @override
  State<TrainDetailPage> createState() => _TrainDetailPageState();
}

class _TrainDetailPageState extends State<TrainDetailPage> {
  int selectedTickets = 1;

  @override
  Widget build(BuildContext context) {
    final train = widget.trainData;
    int totalPrice = (train['price'] as int) * selectedTickets;

    return Scaffold(
      appBar: AppBar(
        title: Text('ট্রেনের বিস্তারিত', style: GoogleFonts.poppins()),
        backgroundColor: const Color(0xFF006BBF),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              train['image'] as String,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    train['name'] as String,
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.route, color: Colors.grey, size: 16),
                      SizedBox(width: 8),
                      Text(
                        '${train['from']} থেকে ${train['to']}',
                        style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.grey, size: 16),
                      SizedBox(width: 8),
                      Text(
                        train['time'] as String,
                        style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.event_seat, color: Colors.grey, size: 16),
                      SizedBox(width: 8),
                      Text(
                        '${train['seats']} সিট উপলব্ধ',
                        style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'কতটি টিকিট চান?',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: selectedTickets > 1
                              ? () {
                                  setState(() {
                                    selectedTickets--;
                                  });
                                }
                              : null,
                          icon: Icon(Icons.remove),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '$selectedTickets',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedTickets++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBF5FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'মোট মূল্য',
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '৳$totalPrice',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF006BBF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('বুকিং সফল!', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ট্রেন: ${train['name']}',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'টিকিট: $selectedTickets',
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'মোট: ৳$totalPrice',
                                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF006BBF)),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'আপনার বুকিং সম্পন্ন হয়েছে',
                                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('ঠিক আছে', style: GoogleFonts.poppins()),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006BBF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        'এখনই বুক করুন',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBookingsPage extends StatelessWidget {
  MyBookingsPage({Key? key}) : super(key: key);

  final myBookings = [
    {
      'trainName': 'তূরাগ এক্সপ্রেস',
      'route': 'ঢাকা → চট্টগ্রাম',
      'date': '২৮ মার্চ ২০২৪',
      'tickets': 2,
      'cost': 1300,
      'ref': 'TRN-001234',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('আমার বুকিং', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF006BBF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: myBookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 64, color: Colors.grey[300]),
                  SizedBox(height: 16),
                  Text(
                    'কোন বুকিং নেই',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: myBookings.length,
              itemBuilder: (context, index) {
                final booking = myBookings[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking['trainName'] as String,
                                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'রেফ: ${booking['ref']}',
                                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFD4EDDA),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'নিশ্চিত',
                              style: GoogleFonts.poppins(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        booking['route'] as String,
                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('তারিখ', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                              Text(
                                booking['date'] as String,
                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('টিকিট', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                              Text(
                                '${booking['tickets']}',
                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('মূল্য', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                              Text(
                                '৳${booking['cost']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF006BBF),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('বুকিং বাতিল করা হয়েছে')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[100],
                            foregroundColor: Colors.red,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Text(
                            'বাতিল করুন',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
