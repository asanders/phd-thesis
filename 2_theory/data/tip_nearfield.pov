#include "colors.inc"
#include "textures.inc"
#include "golds.inc"
#include "metals.inc"
#include "shapes.inc"

#include "tips.inc"
#include "media.inc"
#include "nanoparticles.inc"

global_settings { assumed_gamma 1.3 }
background { color Black }
camera { location <0, 0.7, -5> look_at <0,0.4,0> rotate <0, 0, 0> angle 40
	up 1*y right 4/3*x
	//focal_point < 0, 0, 0> aperture 0.12 blur_samples 20
}
light_source { <0, 3, -4> color White }

//#macro tip()
//prism {
//    conic_sweep
//    linear_spline
//    0, // sweep the following shape from here ...
//    1, // ... up through here
//    4, // the number of points making up the shape ...
//    <1,0>,<0,2>,<-1,0>,<0,-1>
//    scale <1, 3, 1>
//    //rotate <120, 45, 0>
//    pigment { White }
// }
//#end

#macro tip()
merge{
	sphere { 0, 0.2 scale <1,1.25,1> translate 0.04*y}
	lathe { linear_spline 2, <0.2, 0.>, <1.8, 6> }
	texture{ T_Gold_1A
		//normal { granite 0.8 scale 0.5}
		finish {phong 0.4 specular 0.4}
	}
}
#end

#macro spherical_apex()
merge{
	sphere { 0, 0.2 scale <1,1.25,1>}
	texture{ T_Gold_1A
		//normal { granite 1 scale 0.2}
		finish {phong 0.4 specular 0.4}
	}
}
#end

plane { <0, 1, 0>, 0
	texture{ T_Gold_1A
		//normal { granite 1 scale 0.2}
		finish {phong 0.4 specular 0.4}
	}
}

union{
	object{ tip() scale 3}
	//object{ spherical_apex() scale 1 }
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
		scale 0.5 translate <0,-0.5,0>
	}
	rotate <0,0,0> translate <0, 0.8, 0>
}