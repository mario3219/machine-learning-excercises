model FurutaPendulum "Furuta pendulum"
    
    parameter Real pendulumA_start = -Modelica.Constants.pi;
    
    model ControllerLQR
      Modelica.Blocks.Interfaces.RealInput phi, dphi, theta1, dtheta1, theta2, dtheta2;
      Modelica.Blocks.Interfaces.RealOutput u(start=0);
      Real x[6];
    equation
      x = {phi+3.14/2, dphi, theta1+3.14, dtheta1, theta2+3.14, dtheta2};
      L = {99.99999999916298, 9.657218192584693, 103.07438353976295, -1.4000099064048754, 87.4010637192324, -3.8891839816113105};
      u = -L*x;
    end ControllerLQR;
    
    inner Modelica.Mechanics.MultiBody.World world(
      axisLength(displayUnit="mm"),
      axisDiameter(displayUnit="mm"),
      nominalLength(displayUnit="mm") = 0.1)
                                annotation (Placement(transformation(extent={{-62.0,-26.0},{-42.0,-6.0}},   rotation=0.0,origin = {0.0,0.0})));
    
    Modelica.Mechanics.MultiBody.Joints.Revolute rotor(
      a(fixed=false),
      w(fixed=true),
      cylinderLength(displayUnit="mm") = 0.015,
      cylinderColor={0,0,0},
      cylinderDiameter(displayUnit="mm") = 0.0605,
      useAxisFlange=true,
      n={0,1,0},
      phi(fixed=true, start=-1.5707963267949)) annotation (Placement(
          transformation(
          origin={0,32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.MultiBody.Joints.Revolute pendulumAxis(
      a(fixed=false),
      w(fixed=true),
      cylinderLength(displayUnit="mm") = 0.005,
      cylinderDiameter(displayUnit="mm") = 0.005,
      cylinderColor={200,200,200},
      useAxisFlange=true,
      n={-1,0,0},
      phi(
        fixed=true,
        start=3.14159265358978999667,
        displayUnit="rad")) annotation (Placement(transformation(extent={{38,56},
              {58,76}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder base(
      r(displayUnit="mm") = {0,0.1,0},
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.06,
      color={155,155,155},
      r_0(displayUnit="mm", fixed=true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-26})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumArm(
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.005,
      color={200,200,200},
      r(displayUnit="mm") = {0,0.075,0},
      density=3700) annotation (Placement(transformation(
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=270.0,
          origin={70.0,2.0})));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(
      length=0,
      width=0,
      height=0,
      r(displayUnit="mm") = {0,-0.025,-0.1})
      annotation (Placement(transformation(extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=90.0,
          origin={0.0,-56.0})));
    Modelica.Mechanics.Rotational.Components.Damper pendulumDamper(d(fixed = true)=0.000005)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={48,86})));
    Modelica.Mechanics.Rotational.Components.Damper rotorDamper(d=0.02) annotation (
        Placement(transformation(
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=180.0,
          origin={-24.0,42.0})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumAttachment(
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.005,
      color={155,155,155},
      r(displayUnit="mm") = {0.043,0,0},
      density=3700,animation = true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={14,66})));

    Modelica.Mechanics.Rotational.Sensors.AngleSensor pendulumA
      annotation (Placement(transformation(extent={{78,64},{92,78}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor pendulumW
      annotation (Placement(transformation(extent={{78,80},{92,94}})));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor rotorA
      annotation (Placement(transformation(extent={{-20,-12},{-6,2}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor rotorW
      annotation (Placement(transformation(extent={{-20,2},{-6,16}})));
    Modelica.Blocks.Sources.Pulse pulse[3](
      startTime={1,1,1},
      width={1,1,1},
      period={10,10,10},
      amplitude={1,0,0})   annotation (Placement(transformation(
          extent={{36.0,-56.1698948848108},{48.0,-43.8301051151892}},
          rotation=0.0,
          origin={0.0,0.0})));
    Modelica.Mechanics.MultiBody.Forces.WorldForce disturbance
      annotation (Placement(transformation(extent={{50,-40},{66,-24}})));
    .Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumArm2(density = 3700,r(displayUnit = "mm") = {0,0.075,0},color = {200,200,200},diameter(displayUnit = "mm") = 0.005,r_shape(displayUnit = "mm") = {0,0,0},length = 0.03) annotation(Placement(transformation(extent = {{10.45651622606833,-11.274003795974274},{-10.45651622606833,11.274003795974274}},rotation = 90.0,origin = {-118.9110056939614,-0.9505229421045343})));
    .Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumAttachment2(density = 3700,r(displayUnit = "mm") = {0.043,0,0},color = {155,155,155},diameter(displayUnit = "mm") = 0.005,r_shape(displayUnit = "mm") = {0,0,0},length = 0.043,angles_start = {0,0,0}) annotation(Placement(transformation(extent = {{-44.50258064053121,55.51466467866446},{-67.05058823247977,76.42769713080112}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Mechanics.Rotational.Sensors.AngleSensor pendulumA2 annotation(Placement(transformation(extent = {{-127.93020873074083,63.87987765951912},{-143.7138140451048,78.51900037601479}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Mechanics.Rotational.Sensors.SpeedSensor pendulumW2 annotation(Placement(transformation(extent = {{-127.93020873074083,80.61030362122844},{-143.7138140451048,95.24942633772412}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Mechanics.MultiBody.Joints.Revolute pendulumAxis3(phi(fixed = true,start = 3.14159265358978999667,displayUnit = "rad"),n = {-1,0,0},useAxisFlange = true,cylinderColor = {200,200,200},cylinderDiameter(displayUnit = "mm") = 0.005,cylinderLength(displayUnit = "mm") = 0.005,w(fixed = true),a(fixed = false)) annotation(Placement(transformation(extent = {{-82.83419354684371,55.51466467866446},{-105.38220113879227,76.42769713080112}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Mechanics.Rotational.Components.Damper pendulumDamper2(d(fixed = true) = 0.000005) annotation(Placement(transformation(extent = {{11.27400379597428,-10.45651622606833},{-11.27400379597428,10.45651622606833}},rotation = -180.0,origin = {-94.10819734281799,86.88421335686945})));
    .Modelica.Mechanics.MultiBody.Forces.WorldForce force annotation(Placement(transformation(extent = {{-80.34920489462235,-90.6945333228027},{-99.65079510537765,-73.3054666771973}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{-72.0,22.0},{-52.0,42.0}},origin = {0.0,0.0},rotation = 0.0)));
    equation
    connect(pendulumAxis.frame_b, pendulumArm.frame_a) annotation (Line(
        points={{58,66},{70,66},{70,12}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(base.frame_b, rotor.frame_a) annotation (Line(
        points={{0,-16},{0,0},{-6.66134e-16,0},{-6.66134e-16,22}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(base.frame_a, fixed.frame_b) annotation (Line(
        points={{0,-36},{0,-46},{2.220446049250313e-15,-46}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumDamper.flange_b, pendulumAxis.support) annotation (Line(
        points={{38,86},{30,86},{30,76},{42,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumDamper.flange_a, pendulumAxis.axis) annotation (Line(
        points={{58,86},{66,86},{66,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorDamper.flange_a, rotor.axis) annotation (Line(
        points={{-14,42},{-10,42},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorDamper.flange_b, rotor.support) annotation (Line(
        points={{-34,42},{-40,42},{-40,26},{-10,26}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumAttachment.frame_b, pendulumAxis.frame_a) annotation (Line(
        points={{24,66},{38,66}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumAttachment.frame_a, rotor.frame_b) annotation (Line(
        points={{4,66},{0,66},{0,42},{4.44089e-16,42}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumW.flange, pendulumAxis.axis) annotation (Line(
        points={{78,87},{74,87},{74,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumA.flange, pendulumAxis.axis) annotation (Line(
        points={{78,71},{74,71},{74,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorW.flange, rotor.axis) annotation (Line(
        points={{-20,9},{-24,9},{-24,32},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorA.flange, rotor.axis) annotation (Line(
        points={{-20,-5},{-24,-5},{-24,32},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pulse.y,disturbance. force) annotation (Line(
        points={{48.6,-50},{48.6,-32},{48.4,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(disturbance.frame_b, pendulumArm.frame_b) annotation (Line(
        points={{66,-32},{70,-32},{70,-8}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumDamper2.flange_b,pendulumAxis3.support) annotation(Line(points = {{-82.83419354684372,86.88421335686945},{-73.81499051006432,86.88421335686945},{-73.81499051006432,76.4276971308011},{-87.34379506523342,76.4276971308011}},color = {0,0,0}));
    connect(pendulumDamper2.flange_a,pendulumAxis3.axis) annotation(Line(points = {{-105.38220113879228,86.88421335686945},{-114.40140417557168,86.88421335686945},{-114.40140417557168,76.4276971308011},{-94.108197342818,76.4276971308011}},color = {0,0,0}));
    connect(pendulumW2.flange,pendulumAxis3.axis) annotation(Line(points = {{-127.93020873074083,87.92986497947629},{-123.4206072123511,87.92986497947629},{-123.4206072123511,76.4276971308011},{-94.108197342818,76.4276971308011}},color = {0,0,0}));
    connect(pendulumA2.flange,pendulumAxis3.axis) annotation(Line(points = {{-127.93020873074083,71.19943901776696},{-123.4206072123511,71.19943901776696},{-123.4206072123511,76.4276971308011},{-94.108197342818,76.4276971308011}},color = {0,0,0}));
    connect(pendulumAttachment2.frame_b,pendulumAxis3.frame_a) annotation(Line(points = {{-67.05058823247974,65.97118090473279},{-82.83419354684372,65.97118090473279}},color = {95,95,95}));
    connect(pendulumAxis3.frame_b,pendulumArm2.frame_a) annotation(Line(points = {{-105.38220113879228,65.97118090473279},{-118.91100569396141,65.97118090473279},{-118.91100569396141,9.505993283963797}},color = {95,95,95}));
    connect(force.frame_b,pendulumArm2.frame_b) annotation(Line(points = {{-99.65079510537765,-82},{-118.9110056939614,-82},{-118.9110056939614,-11.407039168172858}},color = {95,95,95}));
    connect(force.force,pulse.y) annotation(Line(points = {{-78.41904587354682,-82},{48.6,-82},{48.6,-50}},color = {0,0,127}));
    connect(pendulumAttachment2.frame_a,rotor.frame_b) annotation(Line(points = {{-44.50258064053121,65.97118090473279},{2.220446049250313e-15,65.97118090473279},{2.220446049250313e-15,42}},color = {95,95,95}));
    connect(torque.flange,rotor.axis) annotation(Line(points = {{-52,32},{-10,32}},color = {0,0,0}));
    
    
    
    annotation (
      versionDate="2014-02-04",
      Commands(file="Furuta.mos" "Simulate Furuta pendulum", file="Animate.mos"
          "Animate Furuta pendulum"),
      experiment(NumberOfIntervals=5000, StopTime=10),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),     graphics),uses(Modelica(version = "4.0.0")));
end FurutaPendulum;
