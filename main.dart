void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  _MyApp createState() = _MyApp();
}

class _MyApp extends State<MyApp> with ViewProgress {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setBusy(context);
              Future.delayed(Duration(seconds: 5,), () {
                setIdle(context);
                });
            },
            child: Text("Show progress")
          )
        ),
      );
  }
}
