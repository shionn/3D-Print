
// Petite
int_x = 69.6+2;
int_z = 22.2+2;
int_y = 130+2;

// Grosse
int_x = 101.6+2;
int_z = 24.0+2;
int_y = 174+2;


wall = 1.5;

count = 4;

difference() {
	cube([int_x+wall*2, int_y+wall,int_z*4+wall*5]);

	for(b =[0:count-1]) {
		translate([wall,wall,wall+(wall+int_z)*b])
			cube([int_x,int_y+1,int_z]);
		translate([-1,int_y+wall+5,(int_z+wall)*b+int_z/2+wall])
			rotate([0,90,0])
				cylinder(int_x+wall*2+2, int_z/2, int_z/2);
	}

}

for(b =[0:count-1]) {
}
