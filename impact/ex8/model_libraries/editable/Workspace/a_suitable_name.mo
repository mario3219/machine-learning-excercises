within Workspace;
model a_suitable_name "Hello World!"
   parameter Real c = 2;
   Real y(start=1);
equation 
   der(y) + y = c;
   //annotation(...);
end a_suitable_name;
