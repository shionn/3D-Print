
size = 37;
font_size = 5;
hole_size = 2.5+.1;

difference() {
	cube([7*size, 4*size+20, 3]);
	for( x = [0:size:6*size]) 
		for( y = [0:size:3*size]) 
			translate([x+2,y+2,-10])
				cube(size-2*2);
	translate([size/2, size*4+20/2,-1])
		cylinder(3,hole_size,hole_size, $fn=16);
	translate([size/2+size*6, size*4+20/2,-1])
		cylinder(3,hole_size,hole_size, $fn=16);
}

color("red") {
	translate([size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Lundi", font_size,halign="center", valign="center");
	translate([size+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Mardi", font_size,halign="center", valign="center");
	translate([size*2+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Mercredi", font_size,halign="center", valign="center");
	translate([size*3+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Jeudi", font_size,halign="center", valign="center");
	translate([size*4+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Vendredi", font_size,halign="center", valign="center");
	translate([size*5+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Samedi", font_size,halign="center", valign="center");
	translate([size*6+size/2,4*size+20/2,3])
		linear_extrude(1)
			text("Dimanche", font_size,halign="center", valign="center");
}

