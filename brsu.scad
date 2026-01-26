
w = 240;
h = 150;

r = 15;

color("black")
	cube([240,150,2], center=true);

color("white")
	translate([0,h/2-10,1])
		linear_extrude(1)
			text("BRSU", 40, halign="center", valign="top");

color("grey")
	translate([0,h/2-55,1])
		linear_extrude(1)
			text("(Bureau des Réclamations Super Urgentes)", 8,"Deja Serif", halign="center", valign="top");

color("grey")
	translate([0,0,1])
		linear_extrude(1)
			text("↙", 20,"FontAwesome", halign="center", valign="top");
			
translate([w/2-r-5,-h/2+2*r+3,1]) {
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
