import 'package:flutter/material.dart';

class ProcessTimeline extends StatelessWidget {
  const ProcessTimeline({super.key});

  final List<_StepData> _steps = const [
    _StepData("Prospect", Icons.search, isCompleted: true),
    _StepData("Tour", Icons.tour, isCompleted: true),
    _StepData("Offer", Icons.local_offer, isCompleted: true),
    _StepData("Contract", Icons.description, isCompleted: false),
    _StepData("Settled", Icons.home, isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _steps.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final step = _steps[index];
          final isFirst = index == 0;
          final isLast = index == _steps.length - 1;
          final isCurrent = step.isCompleted == false &&
              (index == 0 || _steps[index - 1].isCompleted);

          Color getColor() {
            if (step.isCompleted) return Colors.green;
            if (isCurrent) return Colors.orange;
            return Colors.grey.shade300;
          }

          return Row(
            children: [
              if (!isFirst)
                Container(
                  width: 26,
                  height: 4,
                  color: _steps[index - 1].isCompleted
                      ? Colors.green
                      : Colors.grey.shade300,
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: getColor(),
                    child: Icon(step.icon, color: Colors.white, size: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: step.isCompleted
                          ? Colors.green
                          : isCurrent
                              ? Colors.orange
                              : Colors.black54,
                    ),
                  ),
                ],
              ),
              if (isLast) const SizedBox(width: 16),
            ],
          );
        },
      ),
    );
  }
}

class _StepData {
  final String title;
  final IconData icon;
  final bool isCompleted;

  const _StepData(this.title, this.icon, {this.isCompleted = false});
}
