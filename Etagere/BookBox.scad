

// Largeur 270

mur = 3;

hauteur = 220 - 180;
profondeur = 130;
largeur = 270/2;

translate([-largeur-10,0,0]) {
	difference() {
		union() {
			cube([largeur, profondeur, hauteur]);
			translate([-mur,profondeur-220,0])
				cube([mur,220,150]);
			translate([-mur,profondeur,0])
				cube([mur+largeur,mur,150]);
		}
		translate([mur, mur, mur])
			linear_extrude(hauteur-mur*2)
				polygon([
						[largeur/2 - mur,0], 
						[0,40], 
						[0,profondeur+mur],
						[largeur - mur *2,profondeur+mur], 
						[largeur - mur *2,40]]);
	}
}

translate([10,0,0]) {
	difference() {
		union() {
			cube([largeur, profondeur, hauteur]);
			translate([largeur,profondeur-220,0])
				cube([mur,220,150]);
			translate([0,profondeur,0])
				cube([mur+largeur,mur,150]);
		}
		translate([mur, mur, mur])
			linear_extrude(hauteur-mur*2)
				polygon([
						[largeur/2 - mur,0], 
						[0,40], 
						[0,profondeur+mur],
						[largeur - mur *2,profondeur+mur], 
						[largeur - mur *2,40]]);
	}		
}
