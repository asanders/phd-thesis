#include "colors.inc"
#include "textures.inc"
#include "golds.inc"
#include "metals.inc"
#include "shapes.inc"

#include "tips.inc"
#include "media.inc"
#include "nanoparticles.inc"

global_settings { assumed_gamma 1.3 }
background { color rgbt <0,0.5,1,0> }
camera { location <0, 0, -7> look_at 0 rotate <0, -55, 0> angle 50
	up 1*y right 16/9*x
	//focal_point < 0, 0, 0> aperture 0.12 blur_samples 20
}
light_source { <0, 3, -4> color White }

#macro tip()
prism {
    conic_sweep
    linear_spline
    0, // sweep the following shape from here ...
    1, // ... up through here
    4, // the number of points making up the shape ...
    <1,0>,<0,2>,<-1,0>,<0,-1>
    scale <1, 3, 1>
    //rotate <120, 45, 0>
    texture{ T_Gold_1A
		normal { granite 0.3 scale 0.1}
		finish {phong 0.4 specular 0.4}
	}
 }
#end

#macro spherical_apex()
merge{
	sphere { 0, 0.2 scale <1,1.25,1>}
	texture{ T_Gold_1A
		normal { granite 1 scale 0.2}
		finish {phong 0.4 specular 0.4}
	}
}
#end

#macro cantilever()
merge{
	box{ <-0.8, -0.1, -1>, <3, 0.1, 1> }
	texture{ T_Gold_1A
		normal { granite 0.3 scale 0.1}
		finish {phong 0.4 specular 0.4}
	}
}
#end

union{
	object{ tip() scale 1}
	object{ spherical_apex() scale 1 }
	object{ cantilever() scale 2 translate 3*y}
	sphere { 0, 1 pigment { rgbt 1 } hollow
		interior {
			media {
				emission 2
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
		scale 0.5 translate <0,-0.1,0>
	}
	rotate <0,0,90> translate <-1.5, 0, 0>
}

cylinder{
	<0, -1, 0>, <0, 4, 0>, 0.1
	texture{ T_Gold_1A
		normal { granite 0.3 scale 0.1}
		finish {phong 0.4 specular 0.4}
	}
	translate 3*x
}