

// paint
pot_x=10;
pot_y=3;

pot_w = 1+25/sqrt(2);
pot_p = 1+25/sqrt(2);
pot_h = 60;
escalier_h = 13;


// batonnet de glace :
pot_x=7;
pot_y=2;
pot_w = 10+1;
pot_p = pot_w;
escalier_h = pot_w<;



wall = .8;


difference() {
	cube([pot_x*pot_w+wall*pot_x+wall, pot_y*pot_p+wall*pot_y+wall,pot_h+escalier_h*(pot_y-1)]);
	for(y = [0:pot_y-1]) {
		for(x = [0:pot_x-1]) 
			translate([x*pot_w + wall+wall*x,wall+y*pot_p+wall*y,wall*2+y*escalier_h])
				cube([pot_w,pot_p,90]);
		translate([-5, -5, pot_h+y*escalier_h])
			cube([400,pot_p+ pot_p*y+wall*y+wall+5,100]);//*/
	}
}

