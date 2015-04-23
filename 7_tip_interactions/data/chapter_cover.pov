#include "colors.inc"
#include "textures.inc"
#include "golds.inc"
#include "metals.inc"
#include "shapes.inc"

#include "tips.inc"
#include "media.inc"

global_settings { assumed_gamma 1.3 }
background { color Black }
camera { location <0, 0, -5> look_at 0 rotate <0, -15, 20>
	focal_point < 0, 0, 0> aperture 0.12 blur_samples 20
}
light_source { <0, 3, -4> color White }
light_source { < 12, 10, 0> rgb 6.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < -12, 10, 0> rgb 6.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < 0, 10, 12> rgb 6.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < 0, 10, -12> rgb 6.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }

//box { <-5,0,-1>, <5,5,5> hollow
//	material { transparent_with_media }
//	photons { pass_through }
//	no_shadow
//}

object{ spherical_tip() rotate <0,0,90> translate -1*x }
object{ spherical_tip() rotate <0,0,-90> translate 1*x }

difference {
	cone {0, 1, <0,5,0>, 10 }
	cone {<0,1,0>, 1, <0,5,0>, 8 }
	pigment { rgbt 1 } hollow
	material { transparent_with_media }
	photons { pass_through }
	no_shadow
}

sphere { 0, 1 pigment { rgbt 1 } hollow
	interior {
		media {
			emission 100
			density { spherical density_map {
		       	[0 rgb 0]
		       	[0.2 rgb <0.0001, 0, 0>]
		            [0.4 rgb <0.001, 0, 0>]
		            [0.6 rgb <0.01, 0, 0>]
		            [0.85 rgb <0.1, 0, 0>]
		            [0.95 rgb <1, 1, 0>]
		            [1 rgb 1]
			} turbulence 0.3 }
		}
	}
}