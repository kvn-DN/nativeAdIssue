import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String iosNativeTestId = 'ca-app-pub-3940256099942544/3986624511';
  String androidNativeTestId = 'ca-app-pub-3940256099942544/2247696110';

  late NativeAd nativeAd;

  @override
  void initState() {
    super.initState();
    setNativeAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Ad should come here and the size should be same as below'),
            const SizedBox(
              height: 20,
            ),
            if (nativeAd.responseInfo != null)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.3,
                child: AdWidget(ad: nativeAd),
              )
          ],
        ),
      ),
    );
  }

  Future<NativeAd> setNativeAd() async {
    NativeAdListener nativeAdListener = NativeAdListener(
      onAdWillDismissScreen: (ad) {
        ad.dispose();
      },
      onAdClosed: (ad) {
        ad.dispose();
      },
      onAdLoaded: (ad) {
        setState(() {});

        log('done');
      },
      onAdFailedToLoad: (ad, error) {
        log(error.toString());
      },
    );
    nativeAd = NativeAd(
        factoryId: 'listTile',
        adUnitId: Platform.isAndroid ? androidNativeTestId : iosNativeTestId,
        listener: nativeAdListener,
        request: const AdRequest());
    await nativeAd.load();
    return nativeAd;
  }
}
