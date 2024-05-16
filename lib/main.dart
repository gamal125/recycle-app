import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycle/HomScreen.dart';
import 'package:recycle/shared/local/bloc_observer.dart';
import 'package:recycle/shared/local/cache_helper.dart';
import 'AboutUsScreen.dart';
import 'AppCubit.dart';
import 'AppState.dart';
import 'Componant.dart';
import 'LoginScreen.dart';
import 'OrderScreen.dart';
import 'ProfileScreen.dart';
import 'SignUpScreen.dart';
import 'VisionScreen.dart';
import 'firebase_options.dart';

Future<void> main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        title: 'Recycle Rewards',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var id= CacheHelper.getData(key: 'uId')??'';

@override
void initState(){
  id!=''?AppCubit.get(context).getUser(id, context):null;
  super.initState();


}

  @override
  Widget build(BuildContext context) {
   var c= AppCubit.get(context);
   c.getUser(id,context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
   return BlocConsumer<AppCubit, AppStates>(
       listener: (context, state) {
if(state is LogoutSuccessState){
  AppCubit.get(context).changeIndex(0);
 id= CacheHelper.getData(key: 'uId')??'';
}
if(state is UpdatePatientSuccessState){

  id= CacheHelper.getData(key: 'uId')??'';
  AppCubit.get(context).getUser(id, context);
}
if (state is GetUserSuccessState) {
  AppCubit.get(context).changeIndex(0);
  id= CacheHelper.getData(key: 'uId')??'';
}

   },
    builder: (context, state) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                c.index==0?const Expanded(flex:4, child: HomeScreen()):
                c.index==1? Expanded(
                    flex:4,
                    child: Container(
                    color: Colors.white,
                    child:   Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.2,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/back.jpg'),fit: BoxFit.fill)),
                        ),



                      ],
                    ),
                  )
                ):
                c.index==2?const Expanded(
                  flex:4,
                  child: AboutUsScreen()
                ):
                c.index==3?const Expanded(
                  flex:4,
              child: VisionScreen(),
                ):
                    /////above Done/////////
                c.index==4?Expanded(
                  flex:4,
                  child:id!=null&&id!=''?   OrderScreen(id: id,):LoginScreen()
                ):
                c.index==5?Expanded(
                  flex:4,
                  child: Container(
                    color:  const Color(0xFF008000).withOpacity(0.2),
                    child: LoginScreen()
                  ),
                ):
                c.index==6?Expanded(
                  flex:4,
                  child: Container(
                    color: const Color(0xFF008000).withOpacity(0.2),
                    child:  RegisterScreen()
                  ),
                ):
                Expanded(
                  flex:4,
                  child: Container(
                      color: const Color(0xFF008000).withOpacity(0.2),
                    child:
                     AppCubit.get(context).user!=null?   ProfileScreen(model:  AppCubit.get(context).user, type: '',):LoginScreen()




                  ),
                )
              ,
                Expanded(
                  flex:1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child:  SingleChildScrollView(
                      child: Column(

                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),
                          Container(
                              width:MediaQuery.of(context).size.width*0.20,
                              height: MediaQuery.of(context).size.height*0.2,
                              decoration:  const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage(
                                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PobaFroDa1NDk2PaXuNecbBGf5UvLm7t2qv2NKbsnu5ofIBekgbid8u6VxOqNncib9w&usqp=CAU',),fit: BoxFit.scaleDown)


                              )

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.04),
                          Text('Recycle Rewards',style: TextStyle(color:const Color(0xFF008000),fontWeight: FontWeight.w900, fontSize:  MediaQuery.of(context).size.width*0.015,),),
                                         SizedBox(height: MediaQuery.of(context).size.height*0.015),

                             defaultMaterialButton3(radius: 20,function: (){AppCubit.get(context).changeIndex(0);}, text: 'الصفحة الرئيسية', context: context, )
                          ,   SizedBox(height: MediaQuery.of(context).size.width*0.015),

                          defaultMaterialButton3(radius: 20,function: (){ AppCubit.get(context).changeIndex(1);}, text: 'تواصل مع الاخرين ', context: context, ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01),

                          defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).changeIndex(2);}, text: 'نبذة عنا ', context: context )
                                          ,      SizedBox(height: MediaQuery.of(context).size.width*0.01),

                          defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).changeIndex(3);}, text: 'الرؤية', context: context )
                          ,   SizedBox(height: MediaQuery.of(context).size.width*0.01),

                          defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).changeIndex(4);}, text: 'طلب تدوير', context: context ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01),
                          defaultMaterialButton3(radius: 20,function: (){   id==''?showToast(text: 'should login first', state: ToastStates.warning): AppCubit.get(context).changeIndex(7);}, text: 'الصفحة الشخصية', context: context ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01),


                          id==''?    defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).changeIndex(6);}, text: 'تسجيل جديد', context: context )
                              :defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).signOut(context);}, text: 'تسجيل خروج', context: context )    ,
                          SizedBox(height: MediaQuery.of(context).size.width*0.01),


                       id==''?      defaultMaterialButton3(radius: 20,function: (){  AppCubit.get(context).changeIndex(5);}, text: 'تسجيل دخول', context: context )
                              :const SizedBox()
                          ,  SizedBox(height: MediaQuery.of(context).size.width*0.01),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
   );}
}
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            MaterialButton(
              onPressed: () {
                // Action when Button 1 is tapped
              },
              child: const Text('Button 1'),
            ),
            MaterialButton(
              onPressed: () {
                // Action when Button 2 is tapped
              },
              child: const Text('Button 2'),
            ),
            // Add more MaterialButtons for additional buttons
          ],
        ),

      ),
    );

  }
}
