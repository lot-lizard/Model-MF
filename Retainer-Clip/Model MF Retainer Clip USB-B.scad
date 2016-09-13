COVER_X = 27;
COVER_X_VARIANCE = 1.5;
COVER_X_OFFSET = 2.75;
COVER_Y = 6;
COVER_Y_OFFSET = 1.25;
COVER_Z = 13.75;
COVER_Z_OFFSET = 1.5;

CLIP_R_OUTER = 5;
CLIP_R_INNER = 1.75;
CLIP_X_SEPARATION = 24;
CLIP_Y_OFFSET = 7.5;
CLIP_Z = 3;
CLIP_Z_OFFSET = .5;

USB_B_X = 12;
USB_B_Y = 16.5;
USB_B_Z = 11;
USB_B_TOLERANCE = .25;
USB_B_THICKNESS = 1;

CYLINDER_FACETS = 128;

module copy_mirror(v) { 
    children(); 
    mirror(v) children(); 
} 

rotate([90, 0, 0]) {
    difference() {
        union() {
            translate([COVER_X_OFFSET, 0, 0])
                linear_extrude(height = COVER_Y / 2) 
                    polygon(points=[[COVER_X_VARIANCE / 2, 0], [COVER_X - (COVER_X_OFFSET * 2) - (COVER_X_VARIANCE / 2), 0], [COVER_X - (COVER_X_OFFSET * 2), COVER_Z], [0, COVER_Z]]);
            translate([0, 0, -COVER_Y / 2])
                linear_extrude(height = COVER_Y / 2) 
                    polygon(points=[[COVER_X_VARIANCE / 2, 0], [COVER_X - (COVER_X_VARIANCE / 2), 0], [COVER_X, COVER_Z], [0, COVER_Z]]);
            
            translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE - USB_B_THICKNESS, 0, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE - USB_B_THICKNESS])
            cube([USB_B_X + USB_B_TOLERANCE * 2 + USB_B_THICKNESS * 2, USB_B_Z + USB_B_TOLERANCE + USB_B_THICKNESS, USB_B_Y + USB_B_TOLERANCE + USB_B_THICKNESS]);
        }
        translate([0, COVER_Z - COVER_Z_OFFSET, -COVER_Y / 2])
            cube([COVER_X, COVER_Z_OFFSET, COVER_Y - COVER_Y_OFFSET]);
        translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE, 0, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE])
            cube([USB_B_X + USB_B_TOLERANCE * 2, USB_B_Z + USB_B_TOLERANCE, USB_B_Y + USB_B_TOLERANCE]);
    }
}

translate([COVER_X / 2, 0, 0])
    copy_mirror(vec=[0,1,0])
        translate([-CLIP_X_SEPARATION / 2, CLIP_Y_OFFSET, -CLIP_Z_OFFSET])
            difference() {
                union() {
                    cylinder(r=CLIP_R_OUTER, h=CLIP_Z, $fn=CYLINDER_FACETS);
                    translate([-CLIP_R_OUTER, -CLIP_R_OUTER, 0])
                        cube([CLIP_R_OUTER * 2, CLIP_R_OUTER, CLIP_Z]);
                }
                cylinder(r=CLIP_R_INNER, h=CLIP_Z, $fn=CYLINDER_FACETS);
            }