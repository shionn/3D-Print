diameter = 225;
width = 15;
hole = 21;
hole_diameter = 5;

notch = true;

difference() {
	if (notch) 
		cylinder(3,diameter/2+hole_diameter/3, diameter/2+hole_diameter/3, true, $fn=64);
	else
		cylinder(3,diameter/2+width, diameter/2+width, true, $fn=64);
	cylinder(4,diameter/2-width, diameter/2-width, true, $fn=64);

	for( r = [0 : 360/hole : 360]) {
		rotate([0,0,r])
			translate([diameter/2,0,0])
				cylinder(4,hole_diameter/2,hole_diameter/2, true, $fn=16);
	}
}