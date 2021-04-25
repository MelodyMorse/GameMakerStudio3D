var pos = [position[0], position[1]];
//draw_self();

draw_set_color(c_red);
DrawVector(pos, right);

draw_set_color(c_aqua);
DrawVector(pos, forward);

draw_set_color(c_white);
var dot = [2, 1];

var dotWorld = LocalToWorldSpace(dot, self);
//var worldDot = [mutiplyVector(right, dot[0]), forward * dot[1]]
DrawCircle(dotWorld, 10, false);