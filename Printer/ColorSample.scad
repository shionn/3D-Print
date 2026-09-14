

l=25;
p=35;
h=2;
r=2;

translate([  0,40,0]) token("Creality", "Hyper", "Ultram.", "Green");
translate([ 30,40,0]) token("Creality", "Hyper", "Violet", "Tulip");
translate([-30,40,0]) token("Creality", "Hyper", "Red", "");
translate([-60,40,0]) token("Creality", "Hyper", "Purple", "");

translate([  0,0,0]) token("Creality", "Ender", "Yellow", "");
translate([ 30,0,0]) token("Creality", "Ender", "Blue", "");
translate([ 60,0,0]) token("Creality", "Ender", "Red", "");
translate([-30,0,0]) token("Creality", "Ender", "Black", "");
translate([-60,0,0]) token("Creality", "Ender", "White", "");
translate([-90,0,0]) token("Creality", "Ender", "Grey", "");

translate([  0,-40,0]) token("Sunlu", "Pla+2", "Orange", "Soleil");
translate([ 30,-40,0]) token("Sunlu", "Pla+2", "Violet", "Lavand");
translate([ 60,-40,0]) token("Sunlu", "Pla+2", "Jaune", "Vif");
translate([ 90,-40,0]) token("Sunlu", "Pla+2", "Marron", "Café");

translate([  0,-80,0]) token("Sunlu", "Pla+", "Gris", "");

module token(brand, gamme, color1, color2) {
	difference() {
		hull() {
			//translate([-l/2,-p/2,0]) cylinder(h, r, r, true, $fn=16);
			//translate([ l/2,-p/2,0]) cylinder(h, r, r, true, $fn=16);
			//translate([ l/2, p/2,0]) cylinder(h, r, r, true, $fn=16);
			//translate([-l/2, p/2,0]) cylinder(h, r, r, true, $fn=16);
			translate([-l/2,-p/2,0]) sphere(r, $fn=8);
			translate([ l/2,-p/2,0]) sphere(r, $fn=8);
			translate([ l/2, p/2,0]) sphere(r, $fn=8);
			translate([-l/2, p/2,0]) sphere(r, $fn=8);
		}
		linear_extrude(h) {
			translate([0, l/2,   .6])
				text(brand,   6, halign="center", valign="center");
			translate([0, l/4-1, .6])
				text(gamme,   6, halign="center", valign="center");
			if (color2 == "") {
				translate([0, -l/3,    .6])
					text(color1,  6, halign="center", valign="center");
			} else {
				translate([0, -l/4+1, .6])
					text(color1,  6, halign="center", valign="center");
				translate([0, -l/2,   .6])
					text(color2,  6, halign="center", valign="center");
			}
		}
		translate([l/2-1, p/2-1, 0])
			cylinder(h+2,1.5,1.5, center=true, $fn=8);
	}
}

