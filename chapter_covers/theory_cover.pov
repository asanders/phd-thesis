#include "colors.inc"
#include "textures.inc"
#include "golds.inc"
#include "metals.inc"
#include "shapes.inc"

#include "tips.inc"
#include "media.inc"
#include "nanoparticles.inc"

global_settings { assumed_gamma 1.3 }
//background { color Black }
camera { location <0, 0, -10> look_at 0 rotate <0, 0, 0> angle 40
	up 1*y right 21/8*x
	//focal_point < 0, 0, 0> aperture 1 blur_samples 2
}
light_source { <0, 3, -4> color White }

#macro red_half_plasmon(intensity)
sphere { 0, 1 pigment { rgbt 1 } hollow
		interior { media { emission intensity
				density { spherical density_map {
			       	[0.0 rgb 0]
			       	[0.1 rgb <0.5, 0, 0>]
			       	[0.2 rgb <0.6, 0.1, 0>]
			            [0.3 rgb <0.7, 0.2, 0>]
			            [0.4 rgb <0.8, 0.4, 0>]
			            [0.8 rgb <0.8, 0.8, 0.8,>]
			            [1.0 rgb 1]
				} turbulence 0. }
		}}}
#end

#macro blue_half_plasmon(intensity)
sphere { 0, 1 pigment { rgbt 1 } hollow
		interior { media { emission intensity
				density { spherical density_map {
			       	[0.0 rgb 0]
			       	[0.1 rgb <0, 0, 0.5>]
			       	[0.2 rgb <0, 0.1, 0.6>]
			            [0.3 rgb <0, 0.2, 0.7>]
			            [0.4 rgb <0, 0.4, 0.8>]
			            [0.8 rgb <0.8, 0.8, 0.8>]
			            [1.0 rgb 1]
				} turbulence 0. }
		}}}
#end

#macro plasmon(left_strength, right_strength, left_scale, right_scale)
union{
	object{red_half_plasmon(right_strength) translate <0.2,0,0> scale right_scale}
	object{blue_half_plasmon(left_strength) translate <-0.2,0,0> scale left_scale}
	scale <1,1,0.6>
}
#end

#macro tip()
merge{
	sphere { 0, 0.1 scale <1,1.25,1>}
	lathe { linear_spline 2, <0.1, 0.>, <1.8, 6> }
	texture{ T_Gold_1A
		normal { granite 0.8 scale 0.2}
		finish {phong 0.4 specular 0.4}
	}
}
#end

union{
	object{aunp() scale 1 translate <0,0,0>}
	object{plasmon(20,20,1,1) scale 1.05 translate <0,0,0>}
	scale 0.4 translate <-2.8,0.55,0> no_reflection
}

union{
	union{
		object{aunp() scale 1}
		object{plasmon(20,20,1,<1.04,0.98,1>) scale 1.05 translate <0,0,0>}
		translate <-1.03,0,0>
	}
	union{
		object{aunp() scale 1}
		object{plasmon(20,20,<1.04,0.98,1>,1) scale 1.05 translate <0,0,0>}
		translate <1.03,0,0>
	}
scale 0.4 translate <-0.6, -0.2, 0>}

union{
	object{ tip() scale 0.7 }
	object{ red_half_plasmon(10) scale 0.1 translate <0,-0.05,0>}
	rotate <0,0,-60> translate <1.6, 0.5, 0> no_reflection
}

union{
	object{ spherical_tip() scale 0.5 }
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
		scale <0.6,0.6,0.4> translate <0,-0.1,0>
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
		scale <0.6,0.5,0.4> translate <0,0.1,0>
	}
	rotate <0,0,-120> translate <2, -0.8, 0> no_reflection
}