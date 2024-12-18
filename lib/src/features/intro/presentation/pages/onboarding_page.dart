import 'package:destinaku/src/core/helper/helper.dart';
import 'package:destinaku/src/core/helper/ui_theme_extention.dart';
import 'package:destinaku/src/core/router/app_routes.dart';
import 'package:destinaku/src/core/utils/constant/app_constants.dart';
import 'package:destinaku/src/shared/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _onActive = 0;

  List<({String title, String description})> textOnboarding = [
    (
      title: 'Selalu Update,\nSelalu Siap!',
      description: 'Bingung soal harga tiket yang berubah-ubah?\nDestinaKu punya info terpercaya!'
    ),
    (
      title: 'Akses ke Destinasi,\nUdah Gak Lagi Sulit',
      description: 'Nyari jalan ke surga yang jarang diketahui?\nDestinaKu punya rute alternatifnya!'
    ),
    (
      title: 'Rencana Jalan-Jalan\nTanpa Ribet',
      description: 'DestinaKu bantu atur semuanya biar kamu\ngak perlu pusing lagi soal dana dan waktu.'
    ),
    (
      title: 'Jalan Bareng, Seru\nBareng',
      description: 'Di sini, kamu bisa temuin traveler lain yang\nsiap bareng nikmatin petualangan seru!'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: MediaQuery.paddingOf(context).top,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  SkipButton(
                    onPressed: () {
                      setState(() {
                        _onActive++;
                      });
                    },
                  ),
                  ColoredBox(
                    color: Colors.transparent,
                    child: Row(
                      children: List.generate(
                        4,
                        (counter) => Container(
                          height: 10,
                          width: 50,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: counter - 1 < _onActive ? Colors.white : Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 24),
              Text(
                textOnboarding[_onActive].title,
                style: context.onBoardingTitle.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                textOnboarding[_onActive].description,
                style: context.regular.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
            ]),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: SvgPicture.asset(
            '${assets}onboarding/onboarding_${_onActive + 1}.svg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 24,
          right: 16,
          left: 16,
          child: AppButton(
            onSubmit: () {
              if (_onActive == 3) {
                Helper.setHaveSeenOnboarding(true);
                context.pushReplacement(AppRoute.register);
              } else {
                setState(() {
                  _onActive++;
                });
              }
            },
            text: _onActive == 3 ? 'Mulai' : 'Selanjutnya',
          ),
        )
      ]),
    );
  }
}

class SkipButton extends StatelessWidget {
  final void Function()? onPressed;
  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange, // Warna background oranye
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Membuat bentuk tombol melengkung
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Mengatur ukuran tombol
        ),
        child: const Text(
          'Lewati',
          style: TextStyle(
            color: Colors.white, // Warna teks putih
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
