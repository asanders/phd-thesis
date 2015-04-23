#include "colors.inc"
#include "nanoparticles.inc"

global_settings { assumed_gamma 1.2 }
background { color Black }
camera { location <0, 0, -1> up 1*y right 16/9*x angle 50}
light_source { <2.5, 3, -5> color White }

object {aunp() scale 1 translate -1.01*x }
object { aunp() scale 1 translate 1.01*x
	texture{ T_Gold_1A
		//normal { }
		finish {phong 0.4 specular 0.4}
	}
}

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
	rotate 90*z
	scale <0.05,0.15,0.15>
}

light_source{ 0 color White area_light <-0.01, 0, 0> <0.01, 0, 0>, 5, 1 adaptive 1 jitter }
