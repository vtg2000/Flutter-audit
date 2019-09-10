import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatelessWidget {
  final image = 'pac2.jpeg';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('UNO?'),
            bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),


          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
		    floatingActionButton: new Builder(builder: (BuildContext context) {
				return new FloatingActionButton(
          
					onPressed: () {
						Scaffold
							.of(context)
							.showSnackBar(new SnackBar(content: new Text('Lets play UNO!'),
              ));
					},
					child: Icon(Icons.thumb_up), 
					backgroundColor: Colors.pink,
				);
			}),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.colo, this.imag});
  final String title;
  final IconData icon;
  final Color colo;
  final String imag;
}
const image = 'pac2.jpeg';
const List<Choice> choices = const <Choice>[
  const Choice(title: 'SKIP', icon: Icons.not_interested, colo: Colors.red, imag:''),
  const Choice(title: 'REVERSE', icon: Icons.repeat, colo: Colors.blue, imag:''),
  const Choice(title: 'DRAW TWO', icon: Icons.exposure_plus_2 , colo: Colors.orange, imag:''),
  const Choice(title: 'Pacman?', icon: Icons.games ,colo:Colors.green, imag : image),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: choice.colo,
      clipBehavior: Clip.none,
      borderOnForeground: true,
      child: Center(
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: TextStyle(color: Colors.white, fontSize: 30)),
            new Image.asset(choice.imag, width: 200, ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(TabbedAppBarSample());
}