



import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geminiappchat/presontation/pages/home_page.dart';
import 'package:get/get.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF79FCC8),
              Colors.black
            ]
          )
        ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Gap(100),
            const Text('Welcome At Wildflu', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400, color: Colors.white54),textAlign: TextAlign.center,),
            const Gap(10),
            const Text('Register With you favorite Way', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white54), textAlign: TextAlign.center,),
            const Gap(80),
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xFF79FCC8).withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xFF79FCC8).withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    hintText: 'Sucret',
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: const Color(0xFF79FCC8).withOpacity(0.5),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
            const Gap(50),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: const Color.fromARGB(255, 87, 201, 155)
                  ),
                  onPressed: ()=> Get.off(()=> const HomePage()), child: const Text('Register', style: TextStyle(color: Colors.white),))
              ],
            ),
            const Gap(50),
            const Text('Or register with', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white24), textAlign: TextAlign.center,),
            const Gap(50),
            Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color(0xFF79FCC8)),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Google', style: TextStyle(color: Color(0xFF79FCC8)),)
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color(0xFF79FCC8)),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Github', style: TextStyle(color: Color(0xFF79FCC8)))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
