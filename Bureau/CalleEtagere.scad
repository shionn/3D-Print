
p1 = 12;
h1 = 10;
p2 = 15;
h2 = 10;
l = 100;

cube([l, h1, p1]);
translate([0,h1,0])
	cube([l, h2, p2]);
