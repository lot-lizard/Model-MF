include <MCAD/polyholes.scad>;
include <Model MF Retainer Clip.scad>;

USB_B_X = 12;
USB_B_Y = 16.5;
USB_B_Z = 11;
USB_B_TOLERANCE = .25;
USB_B_THICKNESS = 1;

rotate([90, 0, 0]) {            
    difference() {   
        union() {
            retainerClip(); 
            translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE - USB_B_THICKNESS, 0, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE - USB_B_THICKNESS])
                cube([USB_B_X + USB_B_TOLERANCE * 2 + USB_B_THICKNESS * 2, USB_B_Z + USB_B_TOLERANCE + USB_B_THICKNESS, USB_B_Y + USB_B_TOLERANCE + USB_B_THICKNESS]);
        }
        translate([COVER_X / 2 - USB_B_X / 2 - USB_B_TOLERANCE, -USB_B_THICKNESS, COVER_Y / 2 - USB_B_Y - USB_B_TOLERANCE])
            cube([USB_B_X + USB_B_TOLERANCE * 2, USB_B_Z + USB_B_TOLERANCE + USB_B_THICKNESS, USB_B_Y + USB_B_TOLERANCE + USB_B_THICKNESS]);
    }
}

logo="../mf.png"; 

wid=58; 
logox = 587; 
logoy = 623; 

difference(){ 
    cube([wid,wid,2]); 
    translate([wid/4,wid/4,3]) 
        scale([.5*wid/logox,.5*wid/logoy,.02]) 
            surface(file=logo,invert=true); 