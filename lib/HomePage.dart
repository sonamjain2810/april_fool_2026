import 'dart:async';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'AdManager/ad_manager.dart';
import 'Enums/project_routes_enum.dart';
import 'Singleton/project_manager.dart';
import 'data/Messages.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/pass_data_between_screens.dart';
import 'widgets/AppStoreAppsItemWidget1.dart';
import 'widgets/CustomFBTextWidget.dart';
import 'widgets/CustomFeatureCard.dart';
import 'data/Gifs.dart';
import 'data/Images.dart';
import 'data/Quotes.dart';
import 'data/Shayari.dart';
import 'data/Status.dart';
import 'utils/SizeConfig.dart';
import 'MyDrawer.dart';
import 'widgets/CustomBannerWidget.dart';
import 'widgets/CustomTextOnlyWidget.dart';
import 'widgets/DesignerContainer.dart';

// Height = 8.96
// Width = 4.14

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    implements ProjectListener, AdListener {
  String _authStatus = 'Unknown';

  BannerAd? _bannerAd;
  ProjectManager projectManager = ProjectManager.instance;
  AdManager adManager = AdManager.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPlugin();
    });

    projectManager.listener = this;
    adManager.adListener = this;

    projectManager.startApp();
    adManager.loadAdsInAdManager();
    loadBannerAd();
  }

  void loadBannerAd() {
    _bannerAd = adManager.loadBannerAd(
      BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint("Banner Ad Loaded");

          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint("Banner Failed: ${error.message}");
          ad.dispose();
        },
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    debugPrint("Home Page: Dispose Called");
    projectManager.listener = null;
    adManager.adListener = null;
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    setState(() => _authStatus = '$status');
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      setState(() => _authStatus = '$status');
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    debugPrint("UUID: $uuid");
  }

  Future<void> showCustomTrackingDialog(
    BuildContext context,
  ) async => await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: const Text('Dear User'),
      content: Text(
        'We care about your privacy and data security. We keep this app free by showing ads. '
        'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
        'Our partners will collect data and use a unique identifier on your device to show you ads.',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Continue', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              DesignerContainer(
                isLeft: false,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.width(8)),
                  child: Center(
                    child: Text(
                      "Select From Below",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),

              const Divider(),

              // Status Start
              DesignerContainer(
                isLeft: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "April Fool Status Wishes",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            CustomFBTextWidget(
                              size: size,
                              text: Status.statusData[2],
                              color: Colors.lightGreenAccent[200],
                              url: Images.imagesPath[6],
                              isLeft: false,
                              ontap: () {
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.statusList.toString(),
                                );
                              },
                            ),
                            SizedBox(width: SizeConfig.width(8)),
                            CustomFBTextWidget(
                              size: size,
                              text: Status.statusData[3],
                              color: Colors.lightGreenAccent[200],
                              url: Images.imagesPath[6],
                              isLeft: false,
                              ontap: () {
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.statusList.toString(),
                                );
                              },
                            ),
                            SizedBox(width: SizeConfig.width(8)),
                            CustomFBTextWidget(
                              size: size,
                              text: Status.statusData[4],
                              color: Colors.lightGreenAccent[200],
                              url: Images.imagesPath[6],
                              isLeft: false,
                              ontap: () {
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.statusList.toString(),
                                );
                              },
                            ),
                            SizedBox(width: SizeConfig.width(8)),
                            CustomFBTextWidget(
                              size: size,
                              text: Status.statusData[1],
                              color: Colors.lightGreenAccent[200],
                              url: Images.imagesPath[6],
                              isLeft: false,
                              ontap: () {
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.statusList.toString(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Shayari start
              DesignerContainer(
                isLeft: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "April Fool Ideas",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: InkWell(
                        onTap: () {
                          print("Shayari Clicked");
                        },
                        child: Container(
                          width: size.width - SizeConfig.width(16),
                          height: size.width / 2,
                          decoration: BoxDecoration(
                            color:
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Theme.of(context).primaryColorDark
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                SizeConfig.height(20),
                              ),
                              topRight: Radius.circular(SizeConfig.height(20)),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 4,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.format_quote,
                                color: Theme.of(context).primaryIconTheme.color,
                              ),
                              Positioned(
                                top: 20,
                                width: size.width - SizeConfig.width(16),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeConfig.width(8),
                                    ),
                                    child: Text(
                                      Shayari.shayariData[1],
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeConfig.width(8),
                                    ),
                                    child: Text(
                                      "Tap Here to Continue",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Messages Start
              DesignerContainer(
                isLeft: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "Messages",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            CustomTextOnlyWidget(
                              language: "English",
                              size: size,
                              color: Colors.lightGreenAccent[200],
                              text: Messages.englishData[0],
                              onTap: () {
                                print("English Message Clicked");
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.messagesList.toString(),
                                  PassDataBetweenScreens("1", "1"),
                                );
                              },
                            ),
                            SizedBox(width: SizeConfig.width(5)),
                            CustomTextOnlyWidget(
                              size: size,
                              language: "Jokes",
                              text: Messages.hindiData[3],
                              color: Colors.lightGreenAccent[200],
                              onTap: () {
                                print("Hindi Clicked");
                                ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.messagesList.toString(),
                                  PassDataBetweenScreens("4", "1"),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Images Start
              DesignerContainer(
                isLeft: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "April Fool Day Images",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.width(8)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Images.imagesPath[13],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Images.imagesPath[6],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Images.imagesPath[4],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Images.imagesPath[3],
                                ontap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        ProjectManager.instance.clickOnButton(
                          ProjectRoutes.imagesList.toString(),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Quotes Start
              DesignerContainer(
                isLeft: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "April Fool Quotes",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: InkWell(
                        onTap: () {
                          print("Quotes Clicked");
                          ProjectManager.instance.clickOnButton(
                            ProjectRoutes.quotesList.toString(),
                          );
                        },
                        child: Container(
                          width: size.width - SizeConfig.width(16),
                          height: size.width / 2,
                          decoration: BoxDecoration(
                            color:
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Theme.of(context).primaryColorDark
                                : Colors.lightGreenAccent[200],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                SizeConfig.height(20),
                              ),
                              topRight: Radius.circular(SizeConfig.height(20)),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 4,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Icon(
                                Icons.format_quote,
                                color: Theme.of(context).primaryIconTheme.color,
                              ),
                              Positioned(
                                top: 20,
                                width: size.width - SizeConfig.width(16),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeConfig.width(8),
                                    ),
                                    child: Text(
                                      Quotes.quotesData[1],
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeConfig.width(8),
                                    ),
                                    child: Text(
                                      "Tap Here to Continue",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // GIFs Start
              DesignerContainer(
                isLeft: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "April Fool Gifs",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.width(8)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Gifs.gifsPath[5],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Gifs.gifsPath[8],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Gifs.gifsPath[9],
                                ontap: () {},
                              ),
                              CustomFeatureCard(
                                size: size,
                                imageUrl: Gifs.gifsPath[0],
                                ontap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        ProjectManager.instance.clickOnButton(
                          ProjectRoutes.gifsList.toString(),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Meme Generator Start
              DesignerContainer(
                isLeft: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Text(
                        "Generate April Fool Memes",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: CustomBannerWidget(
                        size: MediaQuery.of(context).size,
                        imagePath: Gifs.gifsPath[17],
                        buttonText: "Generate Meme",
                        topText: "Send April Fool",
                        middleText: "Wishes & E-cards",
                        bottomText: "Share it With Your Loved Ones",
                        onTap: () {
                          print("Meme Clicked");
                          ProjectManager.instance.clickOnButton(
                                  ProjectRoutes.memeGenerator.toString(),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              Padding(
                padding: EdgeInsets.all(SizeConfig.width(8)),
                child: Text(
                  "Apps From Developer",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.width(8)),
                  child: Row(
                    children: <Widget>[
                      // Your app columns remain same
                      //Column1
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple117/v4/8f/e7/b5/8fe7b5bc-03eb-808c-2b9e-fc2c12112a45/mzl.jivuavtz.png/292x0w.jpg",
                            appTitle: "Good Morning Images & Messages",
                            appUrl:
                                "https://apps.apple.com/us/app/good-morning-images-messages-to-wish-greet-gm/id1232993917",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/44/e0/fd/44e0fdb5-667b-5468-7b2f-53638cba539e/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/292x0w.jpg",
                            appTitle: "Birthday Status Wishes Quotes",
                            appUrl:
                                "https://apps.apple.com/us/app/birthday-status-wishes-quotes/id1522542709",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/7d/60/69/7d60694e-2e38-9403-80e8-bc3b7c7b5772/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/230x0w.webp",
                            appTitle: "Good Night Gif Image Quote Sm‪s‬",
                            appUrl:
                                "https://apps.apple.com/us/app/good-night-gif-image-quote-sms/id1527002426",
                          ),
                        ],
                      ),
                      SizedBox(width: SizeConfig.width(3)),
                      //Column2
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/e9/96/64/e99664d3-1083-5fac-6a0c-61718ee209fd/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/292x0w.jpg",
                            appTitle: "Weight Loss My Diet Coach Tips",
                            appUrl:
                                "https://apps.apple.com/us/app/weight-loss-my-diet-coach-tips/id1448343218",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is2-ssl.mzstatic.com/image/thumb/Purple127/v4/5f/7c/45/5f7c45c7-fb75-ea39-feaa-a698b0e4b09e/pr_source.jpg/292x0w.jpg",
                            appTitle: "English Speaking Course Grammar",
                            appUrl:
                                "https://apps.apple.com/us/app/english-speaking-course-learn-grammar-vocabulary/id1233093288",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/50/ad/82/50ad82d9-0d82-5007-fcdd-cc47c439bfd0/AppIcon-0-1x_U007emarketing-0-85-220-10.png/292x0w.jpg",
                            appTitle: "English Hindi Language Diction",
                            appUrl:
                                "https://apps.apple.com/us/app/english-hindi-language-diction/id1441243874",
                          ),
                        ],
                      ),
                      SizedBox(width: SizeConfig.width(3)),

                      //Column3
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is3-ssl.mzstatic.com/image/thumb/Purple114/v4/b6/3d/cd/b63dcde0-b4db-d05b-7025-e879a338049a/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/230x0w.webp",
                            appTitle: "Sorry Forgive Card Status Gif‪s",
                            appUrl:
                                "https://apps.apple.com/us/app/sorry-forgive-card-status-gifs/id1549696526",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/79/1e/61/791e61de-500c-6c97-3947-8abbc6b887e3/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/292x0w.jpg",
                            appTitle: "Bangladesh Passport Visa Biman",
                            appUrl:
                                "https://apps.apple.com/us/app/bangladesh-passport-visa-biman/id1443074171",
                          ),
                          Divider(),
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/dd/34/c3/dd34c3e8-5c9f-51aa-a3eb-3a203f5fd49b/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-10.png/292x0w.jpg",
                            appTitle: "Complete Spoken English Course",
                            appUrl:
                                "https://apps.apple.com/us/app/complete-spoken-english-course/id1440118617",
                          ),
                        ],
                      ),
                      SizedBox(width: SizeConfig.width(3)),

                      //Column4
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/9a/52/7a/9a527a0e-ca83-ecba-5f1b-336057d7a48b/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/230x0w.webp",
                            appTitle: "Anniversary Wishes Gif Image‪s",
                            appUrl:
                                "https://apps.apple.com/us/app/anniversary-wishes-gif-images/id1527002955",
                          ),
                          Divider(),

                          AppStoreAppsItemWidget1(
                            imageUrl:
                                "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/89/1b/44/891b44e5-bbb3-a530-0f97-011c226d79e1/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/230x0w.webp",
                            appTitle: "Thank You Greetings Card Make‪r‬",
                            appUrl:
                                "https://apps.apple.com/us/app/thank-you-greetings-card-maker/id1552601152",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.height(20)),

              SizedBox(height: SizeConfig.height(20)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
            child: _bannerAd != null
                ? SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  )
                : Container(),
          ),
    );
  }

  @override
  void moveToScreen(String s, [PassDataBetweenScreens? object]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      Navigator.of(context).pushNamed(s, arguments: object);
    });
  }

  @override
  void moveToScreenAfterAd(String s, [PassDataBetweenScreens? object]) {
    Navigator.of(context).pushNamed(s, arguments: object);
  }

  @override
  void showAd(String s, [PassDataBetweenScreens? object]) {
    AdManager.instance.showInterstitialAd(s, object);
  }
}
