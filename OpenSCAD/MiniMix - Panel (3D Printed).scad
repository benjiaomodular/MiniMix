use <components/jack_35mm.scad>
use <components/led_3mm.scad>
use <components/pot_alpha_16mm.scad>

$fn=100; 
hp = 12;

EURORACK_H = 128.5;
EURORACK_W = 5.08;
THICKNESS = 2.2; // thickness

w = hp * EURORACK_W;


module main(){
    cube([w, EURORACK_H, THICKNESS]);
    
    // rib
    rib_height = 3;
    rib_margin = 13;
    rib_thickness = w;

    translate([0, rib_margin,-rib_height]) cube([rib_thickness, EURORACK_H-rib_margin*2, rib_height]);
    // --
}


module logo(x, y){
    // label
    translate([x, y, THICKNESS-0.6]) {
        rotate([0, 0, 90]) {
            linear_extrude(height=0.6) {
                text("benjiaomodular",
                     font="Liberation Sans",
                     size=6);
            }
        }
    }
}

module blank_panel(){
    difference() {
        main();
        
        union(){
            // mounting holes
            translate([7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
            translate([7.5, EURORACK_H-3, 0]) cylinder(r=1.6, h=10, center=true);
            
            translate([EURORACK_W * 4.4, 118, 1]) {
                linear_extrude(height=1.4) {
                    text("Mixer",
                         font="Liberation Sans",
                         size=5);
                }
            }
            
            translate([EURORACK_W * 6, 105, 0])  pot_alpha_16mm();
            translate([EURORACK_W * 6 - 1, 105-12, 1]) {
                linear_extrude(height=1.4) {
                    text("1",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 6, 78, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 6 - 1, 78-12, 1]) {
                linear_extrude(height=1.4) {
                    text("3",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 6, 51, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 6 - 1, 51-12, 1]) {
                linear_extrude(height=1.4) {
                    text("5",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 10, 105, 0])  pot_alpha_16mm();
            translate([EURORACK_W * 10 - 1, 105-12, 1]) {
                linear_extrude(height=1.4) {
                    text("2",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 10, 78, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 10 - 1, 78-12, 1]) {
                linear_extrude(height=1.4) {
                    text("4",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 10, 51, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 10 - 1, 51-12, 1]) {
                linear_extrude(height=1.4) {
                    text("6",
                         font="Liberation Sans",
                         size=3);
                }
            }
                  
 
            
            translate([EURORACK_W * 1, 51, 0]) jack_35mm();
            translate([EURORACK_W * 3, 51, 0]) jack_35mm();
            translate([EURORACK_W * 1, 78, 0]) jack_35mm();
            translate([EURORACK_W * 3, 78, 0]) jack_35mm();
            translate([EURORACK_W * 1, 105, 0]) jack_35mm();
            translate([EURORACK_W * 3, 105, 0]) jack_35mm();
         
            translate([EURORACK_W * 6, 24, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 3, 24]) led_3mm();
            translate([EURORACK_W * 10, 24, 0]) jack_35mm();
            
            
        }
    }
}

translate([w, 0, 2.2]) rotate([0, 180, 0]) blank_panel();
//translate([w, 0, 2]) color([1,0,0]) rotate([0, 180, 0]) logo(13, 16);