include <MCAD/polyholes.scad>;
include <Model MF Retainer Clip.scad>;

rotate([180 - COVER_ANGLE, 0, 0]) { 
    retainerClip();
}