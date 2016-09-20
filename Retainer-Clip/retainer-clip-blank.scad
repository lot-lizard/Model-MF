include <MCAD/polyholes.scad>;
include <retainer-clip-template.scad>;

rotate([180 - COVER_ANGLE, 0, 0]) { 
    retainerClip();
}