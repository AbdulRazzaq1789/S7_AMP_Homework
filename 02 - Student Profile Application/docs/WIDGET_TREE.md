# Simplified Widget Tree (Week 02)

```text
StudentProfileApp (StatefulWidget)
└── MaterialApp  [global ThemeData: AppTheme.light/dark]
    └── StudentProfileScreen (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   └── IconButton [light/dark theme switch]
            └── SafeArea
                └── LayoutBuilder
                    └── SingleChildScrollView
                        └── Center → ConstrainedBox → Column
                            ├── ProfileHeader (StatelessWidget)
                            │   └── LayoutBuilder → Container → Row/Column
                            │       └── FilledButton [save state]
                            ├── SectionHeading (StatelessWidget)
                            ├── Wrap → MetricCard × 3 (StatelessWidget)
                            ├── AcademicProgressCard (StatelessWidget)
                            │   └── LinearProgressIndicator
                            ├── BiographyCard (StatefulWidget)
                            │   └── Card → AnimatedSize → TextButton [setState]
                            ├── StudentInformationCard (StatelessWidget)
                            │   └── Text [formatted using intl DateFormat]
                            ├── InterestChips (StatelessWidget)
                            ├── LocalThemeCard (StatefulWidget)
                            │   └── Theme [local ThemeData override]
                            │       └── Card → FilledButton [setState]
                            └── HotReloadDemoCard (StatefulWidget)
                                └── Card → OutlinedButton [setState]
```

A **Widget Tree** describes the immutable widget configurations; their corresponding Elements provide persistent positions in the active UI hierarchy. Stateful widgets also own separate State objects that typically survive Hot Reload.
