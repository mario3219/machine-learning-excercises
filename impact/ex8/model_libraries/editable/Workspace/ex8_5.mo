within Workspace;
model ex8_5
    inner .Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(extent = {{-32.0,12.0},{-12.0,32.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(Placement(transformation(extent = {{8.0,12.0},{28.0,32.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox(r = {1,0,0}) annotation(Placement(transformation(extent = {{58.0,12.0},{78.0,32.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(world.frame_b,revolute.frame_a) annotation(Line(points = {{-12,22},{8,22}},color = {95,95,95}));
    connect(revolute.frame_b,bodyBox.frame_a) annotation(Line(points = {{28,22},{58,22}},color = {95,95,95}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ex8_5;
