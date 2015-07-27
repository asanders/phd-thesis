#include "colors.inc"
#include "nanoparticles.inc"

global_settings { assumed_gamma 1.2 }
background { color Black }
camera { location <0, 0, -1> look_at <-0.15,0,0> up 1*y right 21/8*x angle 60}
light_source { <2.5, 3, -5> color White }

#macro plasmon()
union{
	sphere { 0, 1 pigment { rgbt 1 } hollow
		interior {
			media {
				emission 5
				density { spherical density_map {
			       	[0.0 rgb 0]
			       	[0.1 rgb <0.5, 0, 0>]
			       	[0.2 rgb <0.6, 0.1, 0>]
			            [0.3 rgb <0.7, 0.2, 0>]
			            [0.4 rgb <0.8, 0.4, 0>]
			            [0.8 rgb <0.8, 0.8, 0.8,>]
			            [1.0 rgb 1]
				} turbulence 0. }
			}
		}
	translate <0.17,0,0>
	}
	sphere { 0, 1 pigment { rgbt 1 } hollow
		interior {
			media {
				emission 5
				density { spherical density_map {
			       	[0.0 rgb 0]
			       	[0.1 rgb <0, 0, 0.5>]
			       	[0.2 rgb <0, 0.1, 0.6>]
			            [0.3 rgb <0, 0.2, 0.7>]
			            [0.4 rgb <0, 0.4, 0.8>]
			            [0.8 rgb <0.8, 0.8, 0.8>]
			            [1.0 rgb 1]
				} turbulence 0. }
			}
		}
	translate <-0.17,0,0>
	}
}
#end
union {
object {aunp() scale 1 translate -1.01*x texture{ T_Gold_1A finish {phong 0.4 specular 0.4} } }
object {aunp() scale 1 translate 1.01*x texture{ T_Gold_1A finish {phong 0.4 specular 0.4} } }
cylinder { -1*y, 1*y, 1 pigment { color Clear } hollow
	interior {
		media {
			emission 50
			density { cylindrical density_map {
		       	[0 rgb 0]
		       	//[0.2 rgb <0.0001, 0, 0>]
		            //[0.4 rgb <0.001, 0, 0>]
		            //[0.6 rgb <0.01, 0, 0>]
		            [0.5 rgb <0.1, 0, 0>]
		            [0.7 rgb <0.2, 0.1, 0>]
		            [0.9 rgb <0.5, 0.5, 0>]
		            [1 rgb 1]
			} turbulence 0.05 }
		}
	}
	rotate 90*z scale <0.05,0.15,0.15> }
light_source{ 0 color White area_light <-0.01, 0, 0> <0.01, 0, 0>, 5, 1 adaptive 1 jitter }
}

cylinder { -1*y, 1*y, 1 pigment { rgbt <0,0,0,0> } 
	rotate 90*z scale <0.1,0.005,0.05>
	no_reflection
}


//union{
//	union{
//		object {aunp() texture{ T_Gold_1A finish {phong 0.4 specular 0.4} } }		object {plasmon() scale 1.2 translate -0.*z}
//		scale 0.01 translate <-0.05,0.,-0.9> no_reflection
//	}
//	union{
//		object {aunp() texture{ T_Gold_1A finish {phong 0.4 specular 0.4} } }		object {plasmon() scale 1.2 translate -0.*z}
//		scale 0.01 translate <-0.01,0.,-0.9> no_reflection
//	}
//}
