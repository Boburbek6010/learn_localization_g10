import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioPlayer player = AudioPlayer();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Easy Localization"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text("greeting").tr(),

            const SizedBox(height: 20,),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: ListWheelScrollView(
                itemExtent: 40,
                overAndUnderCenterOpacity: 0.2,
                useMagnifier: true,
                magnification: 1.2,
                squeeze: 1,
                // offAxisFraction: -0.5,
                physics: const BouncingScrollPhysics(),
                onSelectedItemChanged: (index)async{
                  if(index == 0){
                    await player.play(AssetSource("audios/mouse.mp3"));
                    context.setLocale(const Locale("en", "US"));
                    Vibration.vibrate(
                      duration: 100
                    );
                  }else if(index == 1){
                    await player.play(AssetSource("audios/mouse.mp3"));
                    context.setLocale(const Locale("uz", "UZ"));
                    Vibration.vibrate(
                        duration: 100
                    );
                  }else{
                    await player.play(AssetSource("audios/mouse.mp3"));
                    context.setLocale(const Locale("ru", "RU"));
                    Vibration.vibrate(
                        duration: 100
                    );
                  }
                },
                children: [
                  eachText("English"),
                  eachText("Uzbek"),
                  eachText("Russian"),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}


Widget eachText(String text){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Center(
      child: Text(text, style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),),
    ),
  );
}
