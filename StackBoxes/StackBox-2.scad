
wall=3;
height=30;
marge = .5;


l1 = 117;
p1 = l1;
h1 = 25;
r1 = 20;

l2 = l1*2+wall*2+marge*2;
p2 = p1+wall*2+marge;
h2 = h1+wall;
r2 = r1+wall;

l3 = l2+wall*2+marge;
p3 = p2*2+wall*2+marge*2;
h3 = h2+wall;
r3 = r2+wall;

translate([300,0,0]) {
translate([ l1/2+marge/2,p1/2+wall+marge,0])
	box(l1,p1,h1,r1);
translate([-l1/2-marge/2,p1/2+wall+marge,0])
	box(l1,p1,h1,r1);
translate([ l1/2+marge/2, -p1/2-wall-marge,0])
	box(l1,p1,h1,r1);
translate([-l1/2-marge/2, -p1/2-wall-marge,0])
	box(l1,p1,h1,r1);
}

translate([-300,0,0]) {
	translate([0, p2/2+marge/2,-wall])
		box(l2,p2,h2,r2);
	translate([0,-p2/2-marge/2,-wall])
		box(l2,p2,h2,r2);
}

translate([0,0,-wall*2])
	box(l3,p3,h3,r3);


module box(largeur, profondeur, hauteur, rayon) {
	difference() {
		rounded_cube(largeur, profondeur, hauteur, rayon);
		translate([0,0,3])
			rounded_cube(largeur-wall*2, profondeur-wall*2, hauteur, rayon-wall);
	}
}

module rounded_cube(largeur, profondeur, hauteur, rayon) {
	x = largeur/2-rayon;
	y = profondeur/2-rayon;
	hull() {
		translate([-x, -y, 0])
			cylinder(hauteur, rayon, rayon, $fn=32);
		translate([ x, -y, 0])
			cylinder(hauteur, rayon, rayon, $fn=32);
		translate([ x,  y, 0])
			cylinder(hauteur, rayon, rayon, $fn=32);
		translate([-x,  y, 0])
			cylinder(hauteur, rayon, rayon, $fn=32);
	}
}