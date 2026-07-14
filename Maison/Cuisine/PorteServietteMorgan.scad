
// hauteur et epaisseur truc de morgan
m_h = 142;
m_e = 10.4;
// hauteur et epaisseur porte
p_h = 58;
p_e = 19.2+.2;

// epaiseur
e=2;

difference() {
	cube([e*3+m_e+p_e, m_h+p_h+e*2, 30]);
	translate([e*2+p_e,e,-5])
		cube([m_e,m_h,40]);
	translate([e*2+p_e,e*2+m_h,-5])
		cube([20,100,40]);
	translate([e,-5,-5])
		cube([p_e,m_h+p_h+e+5,40]);
	translate([-5,-5,-5])
		cube([10,160,40]);
	translate([30,e+5,-5])
		cube([10,m_h-5*2,40]);
}
