
largeur_in = 4*42+1;
profondeur_in = 6*42+1;
hauteur = 85;
wall = 2;

largeur_out = largeur_in+wall*2;
profondeur_out = profondeur_in+wall*2;

difference() {
	cube([largeur_out, profondeur_out, hauteur]);
	translate([wall,wall,wall])
		cube([largeur_in, profondeur_in, hauteur]);
}

