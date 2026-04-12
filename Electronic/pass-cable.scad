
epaisseur_base = 2;
epaisseur = 1;
gap = 2;

cube([15,15,epaisseur_base]);
cube([epaisseur,15,10]);
translate([0,0,10-epaisseur])
	cube([15,15,epaisseur]);

translate([15-epaisseur,0,epaisseur_base+gap])
	cube([epaisseur,15,10-epaisseur_base-gap]);
