
w = 250;
h = 250 / sqrt(5);
e = 4;
r = 15;

difference() {
	minkowski() {
		cube([w-15*2,h-15*2,e-1], center = true);
		cylinder(1,r,r,center = true,$fn=32);
	}
	translate([105,0,0]) 
		screew_hole();
	translate([-105,0,0]) 
		screew_hole();
}

translate([0,0,e/2])
	linear_extrude(2)
		text("V18", 80, "DejaVu Sans:style=Condensed Bold",halign="center", valign="center" );


module screew_hole() {
	cylinder(10,2,2,center = true, $fn = 16);
	cylinder(10,2,12, $fn = 16);
}