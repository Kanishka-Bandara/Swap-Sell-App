import 'package:flutter/material.dart';

class KStepper extends Stepper {
  int currentStep = 0;
  KStepper({
    Key key,
    @required List<Step> steps,
    StepperType type = StepperType.vertical,
    this.currentStep = 0,
  }) : super(
            key: key,
            steps: steps,
            type: type,
            currentStep: currentStep,
            // onStepTapped: _onStepTapped(),
            );

  // _onStepTapped() {}
}
