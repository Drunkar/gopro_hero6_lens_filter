use <RoundedRectangle.scad>;

RESOLUTION = 50;
x_inner = 29.1;
y_inner = 32.1;
r_inner = 6;
x_base = 33;
y_base = 36;
margin = 3;
r = 2.5;
x = x_base;
y = y_base;
x_subtract = 30;
y_subtract = 32;


difference() {
    translate([-x_base/2.0, 0, y_base/2.0])
            rotate([-90, 0, 0])
                RoundedRectangle(x=x_base, y=y_base, r=r, thickness=5, $fn=RESOLUTION);
    
    translate([-x_inner/2.0, 0, y_inner/2.0])
            rotate([-90, 0, 0])
                RoundedRectangle(x=x_inner, y=y_inner, r=r_inner, thickness=6, $fn=RESOLUTION);
}

difference() {
    hull() {
        translate([-x_base/2.0, 5, y_base/2.0])
            rotate([-90, 0, 0])
                RoundedRectangle(x=x_base, y=y_base, r=r, thickness=2, $fn=RESOLUTION);
        
        translate([-x/2.0, 6, y/2.0])
            rotate([-90, 0, 0])
                RoundedRectangle(x=x, y=y, r=r, thickness=2.5, $fn=RESOLUTION);
    }
    
    // subtract
    translate([-x_subtract/2.0, 6+1, y_subtract/2.0])
        rotate([-90, 0, 0])
            cube([x_subtract, y_subtract, 3]);
    
    // inner
    translate([-(x_inner-4)/2.0, 0, (y_inner-4)/2.0])
        rotate([-90, 0, 0])
            RoundedRectangle(x=x_inner-4, y=y_inner-4, r=r_inner, thickness=10, $fn=RESOLUTION);
}