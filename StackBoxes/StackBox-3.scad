
wall=3;
height=32;
marge = 1;

position_x = 150;


l1 = 256;
p1 = l1;
h1 = height;
r1 = 20;

l2 =  l1 - wall*2     - marge;
p2 = (p1 - wall*2) /2 - marge;
h2 = h1-wall*2;
r2 = r1 - wall;

l3 = l2 - wall*2 - marge;
p3 = p2 - wall*2 - marge;
h3 = h2 -wall*2;
r3 = r2 - wall;

translate([0,0,0])
	box(l1,p1,h1,r1);

translate([0,position_x*2,0]) {
	translate([0,p2/2,wall]) 
		box(l2,p2,h2,r2);
	/*translate([0,-p2/2,wall]) 
		box(l2,p2,h2,r2);//*/
}

translate([0,position_x*3,0])
	translate([0,p2/2,wall*2]) 
		split_box(l3,p3,h3,r3);

translate([0,position_x*4,0])
	translate([0,p2/2,wall*2]) 
		split_4_box(l3,p3,h3,r3);


module split_box(largeur, profondeur, hauteur, rayon) {
	box(largeur, profondeur, hauteur, rayon, true);
	translate([-wall/2, -profondeur/2+wall, 0])
		cube([wall, profondeur-wall*2, hauteur-wall]);
}

module split_4_box(largeur, profondeur, hauteur, rayon) {
	split_box(largeur, profondeur, hauteur, rayon, true);
	translate([-wall/2-wall/4+largeur/4, -profondeur/2+wall, 0])
		cube([wall, profondeur-wall*2, hauteur-wall]);
	translate([-wall/2+wall/4-largeur/4, -profondeur/2+wall, 0])
		cube([wall, profondeur-wall*2, hauteur-wall]);
}


module box(largeur, profondeur, hauteur, rayon, corner = true) {
	difference() {
		rounded_cube(largeur, profondeur, hauteur, rayon);
		translate([0,0,wall])
			rounded_cube(largeur-wall*2, profondeur-wall*2, hauteur, rayon-wall);
		if (corner) {
			translate([0,0,hauteur-wall])
				rounded_cube(largeur, profondeur, hauteur, rayon);
		}
	}
}

module rounded_cube(largeur, profondeur, hauteur, rayon) {
	x = largeur/2-rayon;
	y = profondeur/2-rayon;
	hull() {
		translate([-x, -y, 0]) 
			pillar(hauteur, rayon);
		translate([ x, -y, 0])
			pillar(hauteur, rayon);
		translate([ x,  y, 0])
			pillar(hauteur, rayon);
		translate([-x,  y, 0])
			pillar(hauteur, rayon);
	}
}

module pillar(hauteur, rayon) {
	translate([0,0,wall])
		cylinder(hauteur-wall, rayon, rayon, $fn=32);
	cylinder(wall, rayon-wall, rayon, $fn=32);
}