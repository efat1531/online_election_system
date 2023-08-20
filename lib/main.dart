import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oes/constants/color_constants.dart';
import 'package:oes/providers/nid_databse_provider.dart';
import 'package:provider/provider.dart';
import './screens/loginScreen/login_screen.dart';
import './providers/auth_provider.dart';
import './screens/registrationScreen/registration_screen.dart';
import './providers/user_provider.dart';
import './screens/nidAddScreen/nidaddScreen.dart';
import './screens/homeScreen/homeScreen.dart';
import './providers/electionListProvider.dart';
import './screens/voteDetails/finishedVoteDetailScreen.dart';
import './screens/liveElection/liveElectionView.dart';
import './screens/addElectionScreen/addElection.dart';
import './screens/finishedElectionListScreen/finishedElectionList.dart';
import './screens/liveElectionScreen/liveElectionListView.dart';
import './screens/upcomingElection/upcomingElectionList.dart';
import './screens/upcomingElection/upcomingElectionDetails.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ElectionList(),
        ),
        ChangeNotifierProvider(
          create: (context) => NidListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Election System',
        theme: ThemeData(
          primaryColor: kMainColor,
        ),
        home: LoginScreen(),
        routes: {
          /**
           * Login Screen Route
           */
          LoginScreen.routeName: (context) => LoginScreen(),
          /**
           * Registration Screen Route
           */
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
          /**
           * NID Add Screen Route (Only for Admin of the app)
           */
          NidAddScreen.routeName: (context) => NidAddScreen(),
          /**
           * Home Screen Route
           */
          HomeScreen.routeName: (context) => HomeScreen(),
          /**
           * Finished Vote Detail Screen Route
           */
          FinishedVoteDetailsScreen.routeName: (context) =>
              FinishedVoteDetailsScreen(),
          /**
           * Live Election View Route
           */
          LiveElectionViewer.routeName: (context) => LiveElectionViewer(),
          /**
           * Add Election Route
           */
          AddElection.routeName: (context) => AddElection(),
          /**
           * Finished Election List route
           */
          FinishedElectionScreen.routename: (context) =>
              FinishedElectionScreen(),
          /**
           * Live Election List Route
           */
          LiveElectionListViewScreen.routename: (context) =>
              LiveElectionListViewScreen(),
          /**
           * Upcoming election ListView Route
           */
          UpcomingElectionListView.routename: (context) =>
              UpcomingElectionListView(),
          /**
           * Upcoming Election Details Route
           */
          UpcomingElectionDetails.routename: (context) =>
              UpcomingElectionDetails(),
        },
        /**
         * If any route is not properly loaded.
         */
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        },
        /**
         * If any route is missing then this will bring to Login
         */
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        },
      ),
    );
  }
}
