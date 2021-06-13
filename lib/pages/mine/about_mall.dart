import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AboutMallPage extends StatefulWidget {
  int id;

  String url;
  String title;

  AboutMallPage({Key key, this.url, this.title, this.id});

  @override
  createState() => _PageState(url: url, title: title);
}

class _PageState extends State<AboutMallPage> {
  _PageState({Key key, this.url, this.title});

  String url;
  String title;
  FlutterWebviewPlugin _webViewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  initState() {
    super.initState();
    _webViewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: _setTitle(context),
      url: widget.url,
      mediaPlaybackRequiresUserGesture: false,
      withZoom: false,
      withLocalStorage: true,
      hidden: true,
    );
  }

  _progressBar(double progress, BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.blue,
        value: progress == 1.0 ? 0 : progress,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
      height: 2,
    );
  }

  _setTitle(context) {
    return AppBar(
      title: Text(title),
      elevation: 1,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      bottom: PreferredSize(
        child: _progressBar(lineProgress, context),
        preferredSize: Size.fromHeight(0.5),
      ),
    );
  }

  @override
  void dispose() {
    _webViewPlugin.dispose();
    super.dispose();
  }
}
