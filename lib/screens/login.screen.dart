import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_child_viewer/components/SVInput.dart';
import 'package:smart_child_viewer/models/post.model.dart';
import 'package:smart_child_viewer/providers/data.provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SVInputEditingController emailController = SVInputEditingController(validation: (String value, Function printErrorMessage){
    if(value.isEmpty) {
      return printErrorMessage('Էլ․ հասցեն պարտադիր դաշտ է');
    }

    if(value.length != 12) {
      return printErrorMessage('Հեռախոսահամարը սխալ է');
    }

    return true;
  });
  SVInputEditingController passwordController = SVInputEditingController(validation: (String value, Function printErrorMessage){
    if(value.isEmpty) {
      return printErrorMessage('Գաղտնաբառը պարտադիր դաշտ է');
    }

    if(value.length < 6) {
      return printErrorMessage('Գաղտնաբառը սխալ է');
    }

    return true;
  });
  final DataProvider _dataProvider = DataProvider();

  @override
  void initState() {
    super.initState();
    // _dataProvider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(),
    );
  }

  // Widget getBody() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 30.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               'Smart',
  //               style: Theme.of(context).textTheme.headline1.copyWith(
  //                   fontWeight: FontWeight.normal,
  //                   // fontStyle: FontStyle.italic,
  //                   fontSize: 25.0,
  //                   letterSpacing: 2.0
  //               ),
  //             ),
  //             SizedBox(width: 5),
  //             Text(
  //               'Viewer',
  //               style: Theme.of(context).textTheme.headline1.copyWith(
  //                   fontSize: 35.0,
  //                   fontFamily: 'IndieFlower'
  //               ),
  //             ),
  //           ],
  //         ),
  //         Expanded(
  //           child: Image.asset(
  //               'assets/images/login-bg.png'
  //           ),
  //         ),
  //         Column(
  //           children: [
  //             SVInput(
  //               controller: emailController,
  //               prefixIcon: FontAwesomeIcons.solidEnvelope,
  //               hintText: 'Էլ. հասցե',
  //             ),
  //             SizedBox(height: 15),
  //             SVInput(
  //               controller: passwordController,
  //               secureText: true,
  //               prefixIcon: FontAwesomeIcons.lock,
  //               hintText: 'Գաղտնաբառ',
  //             ),
  //             SizedBox(height: 25),
  //             SizedBox(
  //               width: double.infinity,
  //               child: RaisedButton(
  //                 onPressed: () {},
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Icon(FontAwesomeIcons.signInAlt),
  //                     SizedBox(width: 10,),
  //                     Text('Մուտք'),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget getBody() {
    return StreamBuilder<List<PostModel>>(
      stream: _dataProvider.posts$,
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if(![ConnectionState.done, ConnectionState.active].contains(snapshot.connectionState)) {
          return Center(child: CircularProgressIndicator());
        }

        print(snapshot.data.length);

        if(snapshot.data.length == 0) {
          return Center(
            child: Text('There are no any posts yet'),
          );
        }

        return ListView(
          children: snapshot.data.map((PostModel p) => Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(p.title),
                  subtitle: Text(p.body),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      child: Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          )).toList(),
        );
      }
    );
  }
}
