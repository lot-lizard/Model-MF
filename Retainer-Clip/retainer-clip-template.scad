COVER_X = 27;
COVER_X_VARIANCE = 1.5;
COVER_X_OFFSET = 2.75;
COVER_Y = 6;
COVER_Z = 13.75;
COVER_Z_OFFSET = 1.5;
COVER_ANGLE = 5;

COVER_OFFSET_RATIO = 0.05454545454545;
COVER_EXTENSION = 2;

CLIP_R_OUTER = 5;
CLIP_R_INNER = 1.8;
CLIP_X_SEPARATION = 24.25;
CLIP_Y_OFFSET = 7;
CLIP_Z = 3;
CLIP_Z_OFFSET = .5;

CYLINDER_FACETS = 128;

VOID = 100;

module copy_mirror(v) { 
    children(); 
    mirror(v) children(); 
} 

module retainerClip() {
    difference() {
        union() {
            rotate([COVER_ANGLE, 0, 0]) {
                translate([0, CLIP_Z_OFFSET, 0]) {
                    difference() {
                        union() {
                            translate([COVER_X_OFFSET, -COVER_EXTENSION, 0])
                                linear_extrude(height = COVER_Y / 2) 
                                    polygon(points=[[COVER_X_VARIANCE / 2 + (COVER_EXTENSION * COVER_OFFSET_RATIO), 0], [COVER_X - (COVER_X_OFFSET * 2) - (COVER_X_VARIANCE / 2), 0], [COVER_X - (COVER_X_OFFSET * 2) - (COVER_EXTENSION * COVER_OFFSET_RATIO), COVER_Z + COVER_EXTENSION], [0, COVER_Z + COVER_EXTENSION]]);
                            translate([0, -COVER_EXTENSION, -COVER_Y / 2])
                                linear_extrude(height = COVER_Y / 2) 
                                    polygon(points=[[COVER_X_VARIANCE / 2 + (COVER_EXTENSION * COVER_OFFSET_RATIO), 0], [COVER_X - (COVER_X_VARIANCE / 2) - (COVER_EXTENSION * COVER_OFFSET_RATIO), 0], [COVER_X, COVER_Z + COVER_EXTENSION], [0, COVER_Z + COVER_EXTENSION]]);
                        }
                        rotate([-COVER_ANGLE, 0, 0]) {
                            translate([0, COVER_Z - COVER_Z_OFFSET, -COVER_Y / 2])
                                cube([COVER_X, COVER_Z_OFFSET * 2, COVER_Y]);
                        }
                    }
                }
            
                rotate([-90 - COVER_ANGLE, 0, 0]) {
                translate([COVER_X / 2, 0, 0])
                    copy_mirror(vec=[0,1,0])
                        translate([-CLIP_X_SEPARATION / 2, CLIP_Y_OFFSET, 0])
                            difference() {
                                union() {
                                    cylinder(r=CLIP_R_OUTER, h=CLIP_Z, $fn=CYLINDER_FACETS);
                                    translate([-CLIP_R_OUTER, -CLIP_R_OUTER, 0])
                                        cube([CLIP_R_OUTER * 2, CLIP_R_OUTER, CLIP_Z]);
                                }
                                polyhole(h=CLIP_Z, d=CLIP_R_INNER * 2);
                            }
                }
            }
        }
        translate([0, -VOID, -VOID / 2])
                cube([VOID, VOID, VOID]);
    }
}

//module retainerClip() {
//    rotate([COVER_ANGLE, 0, 0]) {
//        translate([0, CLIP_Z_OFFSET, 0]) {
//        difference() {
//            union() {
//                translate([COVER_X_OFFSET, 0, 0])
//                    linear_extrude(height = COVER_Y / 2) 
//                        polygon(points=[[COVER_X_VARIANCE / 2, 0], [COVER_X - (COVER_X_OFFSET * 2) - (COVER_X_VARIANCE / 2), 0], [COVER_X - (COVER_X_OFFSET * 2), COVER_Z], [0, COVER_Z]]);
//                translate([0, 0, -COVER_Y / 2])
//                    linear_extrude(height = COVER_Y / 2) 
//                        polygon(points=[[COVER_X_VARIANCE / 2, 0], [COVER_X - (COVER_X_VARIANCE / 2), 0], [COVER_X, COVER_Z], [0, COVER_Z]]);
//            }
//            rotate([-COVER_ANGLE, 0, 0]) {
//                translate([0, COVER_Z - COVER_Z_OFFSET, -COVER_Y / 2])
//                    cube([COVER_X, COVER_Z_OFFSET * 2, COVER_Y]);
//            }
//        }
//    }
//    
//        rotate([-90 - COVER_ANGLE, 0, 0]) {
//        translate([COVER_X / 2, 0, 0])
//            copy_mirror(vec=[0,1,0])
//                translate([-CLIP_X_SEPARATION / 2, CLIP_Y_OFFSET, 0])
//                    difference() {
//                        union() {
//                            cylinder(r=CLIP_R_OUTER, h=CLIP_Z, $fn=CYLINDER_FACETS);
//                            translate([-CLIP_R_OUTER, -CLIP_R_OUTER, 0])
//                                cube([CLIP_R_OUTER * 2, CLIP_R_OUTER, CLIP_Z]);
//                        }
//                        polyhole(h=CLIP_Z, d=CLIP_R_INNER * 2);
//                    }
//        }
//    }
//}