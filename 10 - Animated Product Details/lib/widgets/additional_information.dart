import 'package:flutter/material.dart';

/// AnimatedOpacity gradually reveals content; AnimatedSize animates layout.
/// The text remains in the tree so fade-out can actually be seen.
class AdditionalInformation extends StatefulWidget {
  const AdditionalInformation({super.key});
  @override
  State<AdditionalInformation> createState() => _AdditionalInformationState();
}

class _AdditionalInformationState extends State<AdditionalInformation> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Why you will love it',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800)),
              TextButton.icon(
                key: const Key('more_information_toggle'),
                onPressed: () => setState(() => _visible = !_visible),
                icon: Icon(_visible ? Icons.visibility_off : Icons.visibility),
                label: Text(_visible ? 'Hide more information' : 'Show more information'),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 370),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: ClipRect(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _visible ? 1 : 0,
                    child: Align(
                      heightFactor: _visible ? 1 : 0,
                      alignment: Alignment.topCenter,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Experience comfortable ear cushions, adaptive noise '
                          'cancellation and reliable wireless listening. '
                          'The controls are designed for everyday use.',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
