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
camera { location <0, 0, -5> look_at 0 rotate <0, 0, 0>
	up 1*y right 16/9*x
	//focal_point < 0, 0, 0> aperture 0.12 blur_samples 20
}
light_source { <0, 3, -4> color White }

union{
	object{aunp() scale 0.5 translate <0,0,0>}
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
	scale <0.6,0.6,0.4> translate <0.1,0,0>
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
	scale <0.6,0.6,0.4> translate <-0.1,0,0>
	}
	translate <-3,0.75,0> no_reflection
}

union{
	object{aunp() scale 0.5 translate <0,0,0>}
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
	scale <0.65,0.6,0.4> translate <0.12,0,0>
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
	scale <0.6,0.6,0.4> translate <-0.1,0,0>
	}
	translate <-1,0.75,0>
}
union{
	object{aunp() scale 0.5 translate <0,0,0>}
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
	scale <0.6,0.6,0.4> translate <0.1,0,0>
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
	scale <0.65,0.6,0.4> translate <-0.12,0,0>
	}
	translate <0.05,0.75,0>
}

#macro tip()
merge{
	sphere { 0, 0.2 scale <1,1.25,1>}
	lathe { linear_spline 2, <0.2, 0.>, <1.8, 6> }
	texture{ T_Gold_1A
		normal { granite 0.8 scale 0.5}
		finish {phong 0.4 specular 0.4}
	}
}
#end

union{
	object{ tip() scale 0.7 }
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
		scale <0.2,0.2,0.2> translate <0,-0.1,0>
	}
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