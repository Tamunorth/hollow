import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '_widgets.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              ActionIcon(),
              ActionIcon(
                imagePath: Assets.imagesConvert,
                label: 'Convert',
              ),
              ActionIcon(
                imagePath: Assets.imagesAirtime,
                label: 'Airtime & Data',
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              ActionIcon(
                imagePath: Assets.imagesVirtualAcc,
                label: 'Virtual Acc',
              ),
              ActionIcon(
                imagePath: Assets.imagesTickets,
                label: 'Tickets & Events',
              ),
              ActionIcon(
                imagePath: Assets.imagesMore,
                label: 'More',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
