#include "colors.inc"
#include "textures.inc"
#include "golds.inc"
#include "metals.inc"
#include "shapes.inc"

#include "tips.inc"
#include "media.inc"

global_settings { assumed_gamma 1.5 }
background { color Black }
camera { location <0, 0, -6.5> look_at <-0.5,0,0> rotate <0, -15, 20> angle 60
		   up 1*y right 21/8*x
		   focal_point <1, 0, 0> aperture 0.15 blur_samples 20
}
light_source { <0, 3, -4> rgb 0.5 }
light_source { < 12, 10, 0> rgb 4.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < -12, 10, 0> rgb 4.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < 0, 10, 12> rgb 4.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }
light_source { < 0, 10, -12> rgb 4.0 cylinder point_at 0 radius 1 falloff 1.5 tightness 1 }//photons { reflection on } }

#macro gap_field()
sphere { 0, 5 pigment { rgbt 1 } hollow
	interior {
		media {
			emission 200
			density { spherical density_map {
		       	[0 rgb 0]
		       	[0.2 rgb <0.0001, 0, 0>]
		            [0.4 rgb <0.001, 0, 0>]
		            [0.6 rgb <0.01, 0, 0>]
		            [0.85 rgb <0.1, 0, 0>]
		            [0.95 rgb <1, 1, 0>]
		            [1 rgb 1]
			} turbulence 0.1 }
		}
	}
	translate <0,0,-0.2>
}
#end

#macro light()
blob {
  sphere { <0.,0.67,0>, 1, 1 pigment {rgbt 1 } }
  sphere { <-0.,-0.67,0>, 1, 1 pigment { rgbt 1} }
  threshold 0.6 pigment {rgbt 1} hollow
  interior {
   media{
    emission 0.9
    density { spherical density_map {
		       	[0.6 rgb 0]
		       	[0.7 rgb 0.1]
		       	[0.8 rgb 0.2]
		       	[0.9 rgb 0.5]
		            [1 rgb 1]
			} turbulence 0.1 }
   }    
  }
  scale <8,9,8>
  //rotate <0,0,0>
  finish { phong 0 ambient 0 roughness 0 }
}
#end

union{
object{ spherical_tip() rotate <0,0,90> translate -1*x }
object{ spherical_tip() rotate <0,0,-90> translate 1*x }
gap_field()
light()
}