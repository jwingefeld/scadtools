/*

 **** Jans OpenSCAD toolbox ****

 Usage:
 include </path/to/scadtools.scad>
*/

echo("Thanks for using jans OpenSCAD toolbox");

module ring(r1, r2, h,fn) {
    if (r1 < r2) {
        echo("WARNING: ring is smaller than cutout!");
    }
    difference() {
        cylinder(r = r1, h = h,$fn=fn);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2,$fn=fn);
    }
}
module roundedRect(size, radius)
{
    x = size[0];
    y = size[1];
    hull() {
        // place 4 circles in the corners, with the given radius
        translate([radius,radius]) circle(r=radius);
        translate([x-radius,radius]) circle(r=radius);
        translate([x-radius,y-radius]) circle(r=radius);
        translate([radius,y-radius]) circle(r=radius);
    }
}
