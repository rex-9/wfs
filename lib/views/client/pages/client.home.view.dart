import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/helpers/components.dart';
import 'package:wfs/views/client/find_cleaner/client.find_cleaner.view.dart';
import 'package:wfs/views/client/find_driver/client.pick_location.view.dart';

class ClientHomeView extends GetView {
  const ClientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    goToPickLocationView() => Get.to(() => const ClientPickLocationView());
    goToFindCleanerView() => Get.to(() => const ClientFindCleanerView());

    return defaultLayoutScaffold(
      body: Center(
        child: OverflowBox(
          minWidth: 0.0,
          maxWidth: Get.width,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFE2DBFC),
                  Colors.white,
                ], // Specify your gradient colors
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/7/79/DmC_box_art.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace? stackTrace,
                        ) {
                          return const Text('Failed to load image');
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'David',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: Get.width * 0.45 - 20,
                                child: const Text(
                                  '1901 Thornridge Cir. Shiloh region',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'What are you looking for?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        primaryBtn(
                          func: goToFindCleanerView,
                          label: 'Find A Cleaner',
                        ),
                        primaryBtn(
                          func: goToPickLocationView,
                          label: 'Find A Driver',
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: Get.width,
                  height: Get.height * 0.55,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: Get.width * 0.9,
                        child: const Text(
                          'Several Cleaning Packages',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: ThemeData().primaryColor,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  '1 Month',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('start from'),
                                Text(
                                  '1 SAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: ThemeData().primaryColor,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  '1 Month',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('start from'),
                                Text(
                                  '1 SAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: ThemeData().primaryColor,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  '1 Month',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('start from'),
                                Text(
                                  '1 SAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
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
