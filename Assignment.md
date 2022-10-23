


## Descriptive:


**1) Can we nest the Scaffold widget? Why or Why not?**  
In Flutter, the main function calls the runApp function, which accepts widgets only. The Scaffold is a widget that comes with some supportive root widget fetchers, like AppBar, BottomAppBar, FloatingActionButton, Drawer, BottomNavigationBar, and BottomSheet. The nesting scaffold will not cause an error.

The Scaffold was designed to be the single top-level container for a MaterialApp and it's typically not necessary to nest scaffolds. As a general rule of thumb: use only one Scaffold per Route/Screen. Use only one Scaffold with widgets such as TabController or IndexedStack to navigate the content inside the body of a single screen.



**2) How to reduce the rebuilding of the widget?**  
There are two types of widgets in Flutter: StatelessWidget and StatefulWidget. StatefulWidget is responsible for rebuilding widget components with child widgets. Use a StatelessWidget where a StatefulWidget isn't necessary. That will not allow us usually by calling rebuild using setState().

One of the easiest ways to avoid unwanted reBuilds that are caused usually by calling setState() in order to update only a specific Widget and not refreshing the whole page, is to *cut that part of your code and wrap it as an independent Widget in another Stateful class*.



**3) How can I access platform(iOS or Android) specific code from Flutter?**  
Using Method Channel we can access platform-specific code from Flutter.

Method Channel is based on the idea of sending and receiving messages without having to generate any code. The communication is asynchronous and bidirectional. In this communication, the Flutter program (the Dart-based element of the app) represents a client that sends messages to the host (Android or iOS) and waits for a response, either as a success or failure.

When the message is received on the host’s side, we can execute the necessary logic in native code (Java/Kotlin for Android or Objective-C/Swift for iOS) or call any platform-specific APIs and send a response back to the Flutter application through the channel. When channels are created, we need to be mindful of naming conventions. The name of the channel in the Flutter application needs to be the same as the one on the native side.



**4) What is BuildContext? What is its importance?**  
BuildContext is *a locator that is used to track each widget in a tree and locate them and their position in the tree*. The BuildContext of each widget is passed to their build method. Remember that the build method returns the widget tree a widget renders.

The main purpose of BuildContext is *to help provide a method to reach the nearest ancestor widgets*. the framework while searching for the nearest Scaffold for a given BuildContext goes to the nearest ancestor widget by traversing using the BuildContext and uses the context as per the nearest Scaffold found.

## Code:


### 1) In the below code, list1 declared with var, list2 with final and list3 with const. What is the difference between these lists? Will the last two lines compile?
![view](https://github.com/himadridebnath1993/Mobx-Provider/blob/main/images/image_BFJVU1.png)
### var
`var`is a keyword allowing to create a variable without specifying a type. The type of the variable will therefore be determined according to the initial value of this variable.  
Note that the type of the variable will be inferred only if you assign it a value at its declaration:


### final 
-   A variable with the  `final`  keyword will be initialized at  **runtime**  and can only be assigned for a single time.
-   In a class and function, you can define a  `final`  variable.
-   For Flutter specific, when the state is updated, everything in the build method will be initialized again. This includes all the variables with  `final`.

### const
![view](https://github.com/himadridebnath1993/Mobx-Provider/blob/main/images/image_6JLDU1.png)
-   A variable with the  `const`  keyword is initialized at  **compile-time** and is already assigned when at runtime.
-   You can’t define  `const`  inside a class. But you can in a function.
-   For Flutter specific, everything in the build method won’t be initialized again when the state is updated.
-   `const`  can’t be changed during runtime.
##

    var  list1 =['I', '💙', 'Flutter'];
	final  list2=list1;
	list2[2]="Dart";
	const list3=list2; 

1.  The third line can be compiled and executed also because the final list2 takes reference from list1 List datatype which is growable and changeable.
2.  Forth line can’t be compiled using const list3 since initialization occurs at compile time.


### 2. Identify the problem in the following code block and correct it.

If theimplementation of `int` is 32 then max is **0x7FFFFFFF** value (2147483647) that it will not support value 1000000000;
But The default implementation of `int` is 64-bit two's complement integers with operations that wrap to that range on overflow.
So this program will execute and we can seperate this operation from main thread using Future function.
    
    LongOperationMethod().then((e) {
	    print(e);
	});
	
    Future<String> LongOperationMethod() async {
      var counting = 0;
      for (var i = 0; i <= 1000000000; i++) {
	      counting = i;
      }
      return '$counting! times I print the value!';
    }


### 3. What is the main difference between Mobx & Provider? Can we use both together? Write code to demonstrate it.

MobX and Provider both manage **the state of an application.**  
But Mobx allows reactive programming and a provider used for Dependency Injection.
MobX and Provider if we will use together the Provider is _used only for dependency injection with mobx_. It is not used for state changes.

[Implementation Code](https://github.com/himadridebnath1993/Mobx-Provider/lib/main.dart)


