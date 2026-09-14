
wall=3;
height=30;

x1 = 256;
y1 = x1;
r1 = 30;

x2 = x1 - wall*2 -1;
y2 = (y1 - wall*2 -1)/2;
r2 = r1 -wall;

x3 = (x2 - wall*2 -1)/2;
y3 = (y2 - wall*2 -1);
r3 = r2 -wall;


box(x1,y1,height, r1);
translate([0,y2/2,wall])
	box(x2,y2,height-wall, r2);
translate([0,-y2/2,wall])
	box(x2,y2,height-wall, r2);
translate([x3/2,y3/2+wall+1/2,wall*2])
	box(x3,y3,height-wall*2, r3);
translate([-x3/2,y3/2+wall+1/2,wall*2])
	box(x3,y3,height-wall*2, r3);


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