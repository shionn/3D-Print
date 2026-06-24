
// bloc lenovo 120W
largeur = 65.5+1;
hauteur = 30.5+1;
profondeur = 90;

// bloc Ugreen 65W
largeur = 71.1+1;
hauteur = 29.5+1;
profondeur = 74.6;


mur = 3;

difference() {
	cube([largeur+mur*2, profondeur, hauteur+mur*2]);
	translate([mur,-10,mur])
		cube([largeur, profondeur+20, hauteur]);
	translate([mur+largeur/2, 20, -1])
		cylinder(mur+2,1,1+mur+1);
	translate([mur+largeur/2, profondeur-20, -1])
		cylinder(mur+2,1,1+mur+1);
	/*translate([10, 10, hauteur+mur-1])
		cube([largeur+mur*2-20, profondeur-20, mur+2]);*/
	translate([largeur/2+mur, profondeur/2, hauteur+mur-1])
		scale([largeur+mur*2-20,profondeur-20,1])
			cylinder(mur+2,.5,.5,$fn=4);
}
