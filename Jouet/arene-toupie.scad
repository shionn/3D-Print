
l=300;
h=30;
r=450;

difference() {
	cube([l,l,h], center=true);
	translate([0,0,r-h/2+5])
		sphere(r,$fn=512);
}