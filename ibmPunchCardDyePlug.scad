INSIDE_R = 49.75 / 2;
INSIDE_VOID_R = INSIDE_R - 2;
INSIDE_Z = 8;
KEY_X = 4;
KEY_Y = 1;
OUTSIDE_R = 58.75 / 2;
OUTSIDE_Z = 2.5;
BEVEL_OFFSET = 0;
CYLINDER_FACETS = 1024;

// Inside Ring
difference() {
    union() {
        cylinder(r=INSIDE_R, h=INSIDE_Z, $fn=CYLINDER_FACETS);
        translate([0, INSIDE_R, INSIDE_Z / 2])
            cube(size = [KEY_X, KEY_Y * 2, INSIDE_Z], center = true);
    }
    cylinder(r=INSIDE_VOID_R, h=INSIDE_Z, $fn=CYLINDER_FACETS);
    translate([0, 0, INSIDE_Z + BEVEL_OFFSET + .01])
        rotate([180, 0, 0])
            cylinder(h = INSIDE_R, r1 = INSIDE_R, r2 = 0, $fn=CYLINDER_FACETS);
}
        
 // Outside Base
 translate([0, 0, -BEVEL_OFFSET]) {
        cylinder(r=OUTSIDE_R, h=BEVEL_OFFSET, $fn=CYLINDER_FACETS);
}       
intersection() {
    translate([0, 0, -OUTSIDE_Z]) {
        cylinder(r=OUTSIDE_R, h=OUTSIDE_Z, $fn=CYLINDER_FACETS);
    }
    translate([0, 0, -BEVEL_OFFSET])
        rotate([180, 0, 0])
            cylinder(h = OUTSIDE_R, r1 = OUTSIDE_R, r2 = 0, $fn=CYLINDER_FACETS);
}


