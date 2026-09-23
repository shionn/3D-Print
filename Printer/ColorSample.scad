include <../GridFinity/gridfinity_openscad/gridfinity_modules.scad>


r=2;
l=42-10-r*2+2-.7;
p=37;
h=2;

p_text = 1.84; // mm 
//p_text = 1.6; // gravure 

//holder();
//tokens();

 token("Creality", "Hyper", "Purple", "");

module holder() {
	count = 28;
	s_y=4;
	space = .8;
	border = 4;
	deep = (42*s_y-border*2-(count-1)*space)/count;
	echo(deep);

	difference() {
		grid_block(1,s_y,4, screw_depth = 0, magnet_diameter=0, center = true, box_corner_attachments_only = false);
		for (y = [0:count-1]) {
			translate([-42/2+border,-42*s_y/2 +border+y*(deep+space),6])
				cube([42-border*2,deep,100]);
		}
		translate([-10, -42*s_y/2 +border,6])
			cube([20,42*s_y-border*2,100]);
	}
}

module tokens() {
	translate([  0,45,0]) token("Creality", "Hyper", "Ultram.", "Green");
	translate([ 35,45,0]) token("Creality", "Hyper", "Violet", "Tulip");
	translate([-35,45,0]) token("Creality", "Hyper", "Red", "");
	translate([-70,45,0]) token("Creality", "Hyper", "Purple", "");

	translate([  0,0,0]) token("Creality", "Ender", "Yellow", "");
	translate([ 35,0,0]) token("Creality", "Ender", "Blue", "");
	translate([ 70,0,0]) token("Creality", "Ender", "Red", "");
	translate([-35,0,0]) token("Creality", "Ender", "Black", "");
	translate([-70,0,0]) token("Creality", "Ender", "White", "");
	translate([-105,0,0]) token("Creality", "Ender", "Grey", "");

	translate([  0, -45,0]) token("Sunlu", "Pla+2", "Orange", "Soleil");
	translate([ 35, -45,0]) token("Sunlu", "Pla+2", "Violet", "Lavand");
	translate([ 70, -45,0]) token("Sunlu", "Pla+2", "Jaune", "Vif");
	translate([ 105,-45,0]) token("Sunlu", "Pla+2", "Marron", "Café");

	translate([  0,-90,0]) token("Sunlu", "Pla+", "Grey", "");
}

module token(brand, gamme, color1, color2) {
	difference() {
		base_token();
		translate([0, 0,   p_text])
		linear_extrude(h) {
			translate([0, 3*p/9,   0])
				text(brand,   6, halign="center", valign="center");
			translate([0, p/9, .6])
				text(gamme,   6, halign="center", valign="center");
			if (color2 == "") {
				translate([0, -2*p/9,    0])
					text(color1,  6, halign="center", valign="center");
			} else {
				translate([0, -p/9, 0])
					text(color1,  6, halign="center", valign="center");
				translate([0, -3*p/9,   0])
					text(color2,  6, halign="center", valign="center");
			}
		}
		translate([l/2-1, p/2-1, 0])
			cylinder(h+10,1.5,1.5, center=true, $fn=8);
	}
}

module base_token() {
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
}
