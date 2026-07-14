
epaisseur=35;
largeur=max(75,77)+5;
wall=1.5;
hole_x=(epaisseur-wall*3)/4;
hole_y=(largeur-wall*7)/8;

difference() {
	cube([epaisseur*2+wall*3, largeur+wall*2, 55]);
	translate([wall,wall,wall]) {
		cube([epaisseur,largeur,85]);
		translate([epaisseur+wall,0,0])
			cube([epaisseur,largeur,85]);
	}
	for(x=[hole_x+wall:hole_x+wall:epaisseur*2-hole_x]) {
		for(y=[hole_y+wall:hole_y+wall:largeur-hole_y-wall]) {
			translate([x+wall,y+wall,-1])
				cube([hole_x,hole_y,5]);
		}
	}
}

pied_h = 10;
pied_r = pied_h/2;
translate([pied_r+wall,pied_r+wall,-pied_h])
	cylinder(pied_h,0,pied_r,$fn=32);
translate([epaisseur*2+wall*2-pied_r,pied_r+wall,-pied_h])
	cylinder(pied_h,0,pied_r,$fn=32);
translate([epaisseur*2+wall*2-pied_r,largeur-pied_r+wall,-pied_h])
	cylinder(pied_h,0,pied_r,$fn=32);
translate([pied_r+wall,largeur-pied_r+wall,-pied_h])
	cylinder(pied_h,0,pied_r,$fn=32);



