import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // نحتاج هذه المكتبة لأيقونات السوشيال ميديا

// بيانات الشركة والروابط
const String companyName = 'IZO Future Vision';
const String companySlogan = "Software's & Hardware's Solutions";
const String companyLogoUrl = 'assets/images/logo8.png'; // Placeholder for the company logo
const String mainImageUrl = 'assets/images/imag1.png'; // Placeholder for the main image/video

// الألوان - التركيز على الأبيض والرمادي الفاتح
const Color primaryColor = Colors.black; // لون النص الرئيسي
const Color secondaryColor = Color(0xFFE94E77); // لون ثانوي يمكن استخدامه للتمييز
const Color backgroundColor = Color(0xFFF0F0F0); // خلفية فاتحة جداً
const Color cardColor = Colors.white;
// الروابط
const String contactUrl = 'https://izo.ae/contact';
const String productsUrl = 'https://izo.ae/products';
const String websiteUrl = 'https://izo.ae';
const String whatsAppNumber = '+971501770199';
const String locationUrl = 'https://www.google.com/maps/place/IZO+-+FUTURE+VISION+TR+LLC+-+%D8%B1%D8%A4%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D9%82%D8%A8%D9%84+%D8%B0+%D9%85+%D9%85%E2%80%AD/@25.3383315,55.4081303,17z/data=!3m1!4b1!4m6!3m5!1s0x3e5f590341cf20c7:0x17605e395f34a663!8m2!3d25.3383267!4d55.4055607!16s%2Fg%2F11y2p8wfd0?authuser=0&entry=ttu&g_ep=EgoyMDI1MTAyMi4wIKXMDSoASAFQAw%3D%3D';
const String facebookUrl = 'https://www.facebook.com/izo.mena/';
const String instagramUrl = 'https://www.instagram.com/izo.mena/';
const String tiktokUrl = 'https://www.tiktok.com/@izo.mena?_t=ZS-8zWnYQT4lvM&_r=1';

// دالة لفتح الروابط
Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    // في حالة فشل الفتح، يمكن طباعة خطأ أو إظهار رسالة للمستخدم
    print('Could not launch $url');
  }
}

// دالة لفتح الواتساب
Future<void> _launchWhatsApp() async {
  // يتم استخدام wa.me لفتح الواتساب مباشرة
  const String url = 'https://wa.me/$whatsAppNumber';
  await _launchUrl(url);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 600), // تحديد عرض أقصى لتقليد شاشة الهاتف
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // الأيقونات العلوية (Placeholder)
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Icon(Icons.star_border, color: Colors.grey),
                //     Icon(Icons.upload_outlined, color: Colors.grey),
                //   ],
                // ),
                const SizedBox(height: 20),

                // 1. صورة الشركة (الشعار)
                _buildCircularLogo(),
                const SizedBox(height: 15),

                // 2. اسم الشركة والوصف
                // const Text(
                //   companyName,
                //   style: TextStyle(
                //     fontSize: 22,
                //     fontWeight: FontWeight.bold,
                //     color: primaryColor,
                //   ),
                // ),
                // const SizedBox(height: 5),
                const Text(
                  companySlogan,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),

                // 3. أيقونات السوشيال ميديا (مدمجة)
                _buildSocialMediaIcons(),
                const SizedBox(height: 25),

                // 4. الصورة/الفيديو الرئيسية
                // _buildMainImage(),
                // const SizedBox(height: 10),

                // 5. أزرار الروابط (Link-in-bio style)
                // const _LinkCard(
                //   label: 'WhatsApp',
                //   onPressed: _launchWhatsApp,
                //   showIcon: false,
                // ),
                // _LinkCard(
                //   label: 'Instagram',
                //   onPressed: () => _launchUrl(instagramUrl),
                //   showIcon: false,
                // ),



                // _LinkCard(
                //   label: 'Facebook',
                //   onPressed: () => _launchUrl(facebookUrl),
                //   showIcon: false,
                // ),
                // _LinkCard(
                //   label: 'TikTok',
                //   onPressed: () => _launchUrl(tiktokUrl),
                //   showIcon: false,
                // ),
                // روابط الموقع
                _LinkCard(
                  label: 'Website',
                  onPressed: () => _launchUrl(websiteUrl),
                  showIcon: false,
                ),
                _LinkCard(
                  label: 'Product',
                  onPressed: () => _launchUrl(productsUrl),
                  showIcon: false,
                ),
                _LinkCard(
                  label: 'Contact',
                  onPressed: () =>
                      _launchUrl(contactUrl), // استخدم نفس الرابط للمنتجات
                  showIcon: false,
                ),
                // رابط الموقع على الخريطة
                _LinkCard(
                  label: "Location",
                  onPressed: () => _launchUrl(locationUrl),
                  showIcon: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularLogo() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          companyLogoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[100],
              child: const Icon(Icons.business, size: 50, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(FontAwesomeIcons.whatsapp, _launchWhatsApp),
        _buildIcon(FontAwesomeIcons.instagram, () => _launchUrl(instagramUrl)),
        _buildIcon(FontAwesomeIcons.facebookF, () => _launchUrl(facebookUrl)),
        _buildIcon(FontAwesomeIcons.tiktok, () => _launchUrl(tiktokUrl)),
      ],
    );
  }

  Widget _buildIcon(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: FaIcon(icon, color: primaryColor, size: 24),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildMainImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        mainImageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Placeholder for Main Image/Video',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ويدجت لبطاقة الرابط (Link-in-bio Card)
class _LinkCard extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool showIcon;
  final bool isMap;

  const _LinkCard({
    required this.label,
    required this.onPressed,
    this.showIcon = false,
    this.isMap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        color: cardColor,
        elevation: 0, // إزالة الظل لتقليد التصميم
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                if (isMap)
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.map, size: 20, color: Colors.grey),
                  ),
                if (isMap) const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    textAlign: isMap ? TextAlign.start : TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showIcon) const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
