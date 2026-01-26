
w = 240;
h = 150;

r = 15;

color("black")
	minkowski() {
		translate([0,0,-0.5])
			cube([w-20,h-20,1], center=true);
		cylinder(1,10,10, $fn=32);
	}


color("red")
	translate([0,h/2-10,0])
		minkowski() {
			linear_extrude(1)
				text("BRSU", 40, "DejaVu Sans:style=Condensed Bold",halign="center", valign="top", spacing = 1);
			cylinder(1,2,2, $fn=8);
		}

color("white")
	translate([0,h/2-10,2])
		linear_extrude(1)
			text("BRSU", 40, "DejaVu Sans:style=Condensed Bold", halign="center", valign="top", spacing = 1);

color("white")
	translate([0,h/2-60,1])
		linear_extrude(1)
			text("(Bureau des Réclamations Super Urgentes)", 8,"Deja Serif", halign="center", valign="top");

color("green")
	translate([-w/2+10,-h/2+10,0])
		minkowski() {
			linear_extrude(1)
				text("↩", 25,"DejaVu Sans", halign="left", valign="baseline");
			cylinder(1,1,1, $fn=8);
		}
color("white")
	translate([-w/2+10,-h/2+10,2])
		linear_extrude(1)
			text("↩", 25,"DejaVu Sans", halign="left", valign="baseline");
			
translate([w/2-r-5,-h/2+2*r+3,1.5]) {
	color("white") 
		cylinder(1, r, r, $fn=6, center=true);
	color("green") 
	  translate([0,r*2,0])
		cylinder(1, r, r, $fn=6, center=true);
	color("green") 
		rotate([0,0,120])
			translate([0,r*2,0])
				cylinder(1, r, r, $fn=6, center=true);
}
