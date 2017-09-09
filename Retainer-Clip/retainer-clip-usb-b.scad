include <MCAD/polyholes.scad>;
include <retainer-clip-template.scad>;

USB_B_X = 12;
USB_B_Y = 16.5;
USB_B_Z = 11;
USB_B_TOLERANCE = .25;
USB_B_THICKNESS = 1;

LOGO = "../mf.png"; 
LOGO_X_OFFSET = 2.3;
LOGO_Z_OFFSET = 2.2;
LOGO_SCALE = .0375;

SUPPORT = .4;

rotate([90, 0, 0]) {            
    difference() {   
        union() {
            retainerClip(); 
            translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE - USB_B_THICKNESS, 0, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE - USB_B_THICKNESS])
                cube([USB_B_X + USB_B_TOLERANCE * 2 + USB_B_THICKNESS * 2, USB_B_Z + USB_B_TOLERANCE + USB_B_THICKNESS, USB_B_Y + USB_B_TOLERANCE + USB_B_THICKNESS]);
        }
        translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE, -USB_B_THICKNESS, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE])
            cube([USB_B_X + USB_B_TOLERANCE * 2, USB_B_Z + USB_B_TOLERANCE + USB_B_THICKNESS, USB_B_Y + USB_B_TOLERANCE + USB_B_THICKNESS]);  
        
      translate([USB_B_Y + LOGO_X_OFFSET, USB_B_X + USB_B_THICKNESS * 1.7, -USB_B_Z - LOGO_Z_OFFSET]) {
                rotate([90, 0, 180]) {
                    scale([LOGO_SCALE, LOGO_SCALE, .02]) 
                        surface(file=LOGO, invert=true);
                }
            }  
    }
}

// support structure
//translate([COVER_X / 2 - USB_B_X / 4, USB_B_Y / 4 - COVER_Y / 2, 0]) {
//    difference() {
//        cube([USB_B_X / 2, USB_B_Y / 2, USB_B_Z + USB_B_TOLERANCE]); 
//        translate([SUPPORT, SUPPORT, 0])
//            cube([USB_B_X / 2 - SUPPORT * 2, USB_B_Y / 2 - SUPPORT * 2, USB_B_Z + USB_B_TOLERANCE]); 
//    }
//}

