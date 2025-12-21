
// Largeur 60/85?/120
width = 60;
width_margin = 1;

// Profondeur
depth = 30;
depth_margin = 5;

// Standart 50, petite 25
height = 50;

wall = 1.5;

trench = true;
trench_h = 6;
trench_w = 8;

// fin des parametres


inner = [width+width_margin, depth+depth_margin, height];
outter = [width+width_margin+wall*2, depth+depth_margin+wall*2, height];
trench_box = [trench_w, depth+depth_margin, trench_h];

difference() {
	cube(outter, true);
	translate([0,0,wall+(trench?trench_h:0)])
		cube(inner, true);
	if (trench)
		translate([0,0,-height/2+trench_h/2+wall])
			cube(trench_box, center=true);
}

