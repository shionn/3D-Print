
largeur = 28;
profondeur = 35;
hauteur = 14;
mur = 2;

translate([-35,0,0])
difference() {
	cube([largeur+mur*2,profondeur+mur*2,hauteur+mur]);
	translate([mur,mur,mur])
		cube([largeur,profondeur,20]);
	translate([largeur/2+mur-6/2,-1,mur+4])
		cube([6,mur*2,20]);
	translate([largeur/2+mur-12/2,profondeur+mur-1,mur])
		cube([12,mur*2,8]);
	/*translate([largeur/2+mur,profondeur/2+mur, -1])
		cylinder(4,2/2,10/2,$fn=32);	*/
}

cube([largeur+mur*2,profondeur+mur*2,mur]);
translate([mur, mur, mur])
	cube([largeur,profondeur,mur]);
translate([largeur/2+mur-6/2,0,mur])
	cube([6,mur,6]);
