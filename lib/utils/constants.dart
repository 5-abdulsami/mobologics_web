import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, String>> portfolioItems = [
  {
    'title': 'Ai Grammar Checker & \nAi Writer',
    'description':
        'Effortlessly correct grammar and create AI-powered content.',
    'image': 'assets/images/app_icons/grammar.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.ai_grammarcheckker_grammarcorrector_articlewriterai&gl=pk',
  },
  {
    'title': 'Ai Math Solver',
    'description': 'Solve complex math problems with AI-powered precision.',
    'image': 'assets/images/app_icons/math_solver.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.ai_math_solver_ai_mathphoto_solver.aistudycompanion&gl=pk',
  },
  {
    'title': 'Ai English Dictionary',
    'description': 'Instantly find meanings and usage with AI-enhanced search.',
    'image': 'assets/images/app_icons/dictionary.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.easyfastdictionary.appsonicxdictionary&gl=pk',
  },
  {
    'title': 'Live MAPS & GPS Navigation',
    'description': 'Navigate in real-time with accurate maps and GPS tools.',
    'image': 'assets/images/app_icons/gps.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.gpsnavigationmaps.routefinder&gl=pk',
  },
  {
    'title': 'Live Video Chat & Ai Friend',
    'description': 'Connect and interact live with AI-powered companions.',
    'image': 'assets/images/app_icons/live_video.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.livetalk.randomvideochat&gl=pk',
  },
  {
    'title': 'Al Quran MP3 - القرآن الكريم',
    'description': 'Access the Holy Quran with translations and recitations.',
    'image': 'assets/images/app_icons/quran.png',
    'link':
        'https://play.google.com/store/apps/details?id=com.islamicworld.qurankareem',
  },
];

Future<void> launchURL(BuildContext context, String url) async {
  try {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank', // Opens in a new tab for web
    )) {
      log('Could not launch $url');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to open the link.')),
      );
    }
  } catch (e) {
    log('Error launching URL: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

final List<Map<String, String>> teamMembers = [
  {
    'name': 'Mudasir Ahmed',
    'designation': 'CEO',
    'image': 'assets/images/team/mudasir_ahmed.png',
  },
  {
    'name': 'Faizan Khan',
    'designation': 'CEO',
    'image': 'assets/images/team/faizan_khan.png',
  },
  {
    'name': 'Zikria Farooqui',
    'designation': 'Sr. UI UX Designer & Product Manager',
    'image': 'assets/images/team/zikria_farooqui.png',
  },
  {
    'name': 'Abdullah Abbasi',
    'designation': 'Sr. Flutter Developer',
    'image': 'assets/images/team/abdullah_abbasi.png',
  },
  {
    'name': 'Umair Abbasi',
    'designation': 'Sr. Flutter Developer',
    'image': 'assets/images/team/umair_abbasi.png',
  },
  {
    'name': 'Abdullah Shahzad',
    'designation': 'Flutter Developer',
    'image': 'assets/images/team/abdullah_shahzad.png',
  },
  {
    'name': 'Muhammad Aban',
    'designation': 'Android Developer',
    'image': 'assets/images/team/muhammad_aban.png',
  },
  {
    'name': 'Abdul Sami',
    'designation': 'Flutter Developer Intern',
    'image': 'assets/images/team/abdul_sami.png',
  },
  {
    'name': 'Umer Javed',
    'designation': 'Flutter Developer Intern',
    'image': 'assets/images/team/umer_javed.png',
  },
  {
    'name': 'Saboor',
    'designation': 'Site Supervisor',
    'image': 'assets/images/team/saboor_javed.png',
  },
];

// services
final List<Map<String, String>> services = [
  {
    'title': 'Mobile Apps',
    'description':
        'Empowering businesses with cutting-edge mobile solutions, we create user-friendly, high-performance mobile applications. From native to cross-platform development, our apps are tailored to meet your unique requirements and ensure a seamless user experience.',
    'image': 'assets/images/mobile_app_development.png',
  },
  {
    'title': 'Web Apps',
    'description':
        'Delivering top-notch web applications, we specialize in building responsive, scalable, and secure solutions. Our web apps are designed to streamline your business processes and provide an engaging experience for your users across all devices.',
    'image': 'assets/images/web_app_development.png',
  },
  {
    'title': 'Digital Marketing',
    'description':
        'Maximize your online presence with our data-driven digital marketing strategies. From SEO and social media marketing to PPC campaigns, we help your brand connect with the right audience, enhance visibility, and drive measurable and targeted results.',
    'image': 'assets/images/digital_marketing.png',
  },
  {
    'title': 'Graphics Design',
    'description':
        'Transform your brand’s identity with our visually compelling graphic designs. We craft innovative designs that resonate with your target audience, including logos, brochures, banners, and other creative assets to leave a lasting impression for the viewers.',
    'image': 'assets/images/graphics_designing.png',
  }
];
