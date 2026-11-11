# Widget Tree

```text
IAmRichApp (StatelessWidget)
└── MaterialApp
    └── IAmRichScreen (StatelessWidget)
        └── Scaffold
            ├── AppBar
            │   └── Text("I Am Rich")
            └── DecoratedBox (background gradient)
                └── SafeArea
                    └── LayoutBuilder
                        └── Center
                            └── SingleChildScrollView
                                └── ConstrainedBox
                                    └── Column
                                        ├── DiamondDisplay
                                        │   └── Image.asset
                                        ├── RichMessage
                                        │   └── Column
                                        │       ├── Text("A FLUTTER CLASSIC")
                                        │       ├── Text("I AM RICH")
                                        │       └── Text("Confidence is priceless.")
                                        ├── Divider
                                        └── Text("...WEEK 01")
```

Both custom screen widgets are `StatelessWidget`s because this app has no mutable state. This is intentional for a beginner's first Flutter app.
