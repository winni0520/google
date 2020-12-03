import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth/Screens/Main/main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_auth/Screens/Authentication/components/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// class Body extends StatefulWidget{
//   @override
//   _BodyState createState() => _BodyState();

// }

// class Body extends StatelessWidget{
//   final Function callback;
//   Body(this.callback);

//   @override
//   Widget build(BuildContext context){
//     Size size = MediaQuery.of(context).size;
//   }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async{
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if(user !=null){
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      return '$user';
    }
    return null;
  }
  Future<void> signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Signed Out");
  }
// }


// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes:[
//     'profile',
//     'email'
//   ]
// );
// void main() => runApp(MaterialApp(
//   title: 'Google Sign in',
//   //home: MainScreen(),
//   home: Body(),
// ));

/*
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  GoogleSignInAccount _currentUser;
  @override
  void initState(){
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      setState((){
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign in'),
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    if(_currentUser!=null){
      return Column(
        children: <Widget> [
          ListTile(
            leading: GoogleUserCircleAvatar(identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(onPressed: _handleSignOut, child:Text('Sign out'),
          )
        ],
      );
    }
    else{
      return Column(children: <Widget>[
        Text('You are not signed in'),
        RaisedButton(
          onPressed: _handleSignIn,
          child: Text('Sign In'),
        )
      ],
      );
    }
  }
  Future<void> _handleSignIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(error){
      print(error);
    }
  }
  Future<void> _handleSignOut() async{
    _googleSignIn.disconnect();
  }
}
*/
//
/*
class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();

}

class _BodyState extends State<Body>{
  final UserDetails detailsUser = new UserDetails(detailsUser.);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async{
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
      ));
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser userDetails = await _firebaseAuth.signInWithCredential(credential);
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerDeta = new List<ProviderDetails>();
    ProviderData.add(providerInfo);
    UserDetails details = new UserDetails(userDetails.providerId, userDetails.displayName,
    userDetails.photoUrl,
    userDetails.email,
    providerDeta);

    Navigator.push(context, new MaterialPageRoute(
      builder: (context) => new ProfileScreen(detailsUser: details),

    )
    );
    return userDetails;
    });
  }
}
// class UserDetails{
//   final String providerDetails;
//   final String userName;
//   final String photoUrl;
//   final String userEmail;
//   final List<ProviderDetails> providerData;
//   UserDetails(this.providerDetails, this.userName, this.photoUrl, this.userEmail, this.providerData);
// }
// class ProviderDetails{
//   ProviderDetails(this.providerDetails);
//   final String providerDetails;
// }
*/
