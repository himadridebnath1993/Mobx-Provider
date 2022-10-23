# Mobx with Provider implementation

  

If Flutter is running under FVM use add `fvm` before the below commands to create or update an auto-generated file.

    flutter pub get 
    flutter packages pub run build_runner build

For observing changes and auto-generating or upgrading simultaneously, use this command

    flutter pub run build_runner watch --delete-conflicting-outputs

  

This application was created with `Flutter 3.3.4`.

    environment:
      sdk: ">=2.12.0 <3.0.0"
      
    dependencies:
      flutter_mobx: ^2.0.6+4
      provider: ^6.0.4

    dev_dependencies:
      build_runner: ^2.3.2
      mobx_codegen: ^2.0.7+3

![Application Preview](https://github.com/himadridebnath1993/Mobx-Provider/blob/main/images/app_view.gif)