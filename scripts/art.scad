
part = "outline"; //["outline", "mask", "diff", "shell"]

width = 72; // [50:100]
r_holes = 0.05; // [0:0.01:0.5]
r_inset = 0.1; // [0:0.01:0.5]
r_border = 2; // [0:0.1:5]
w_wall = 1.2;
w_ledge = 0.8;
h_bottom = 1.6;
h_top = 0.8;
d_pcbs = 12;

module herz() {
  for(col =["red"
          , "orange"
          , "yellow"
          , "green"
          , "blue"
          , "purple" ]) {
    color(col)
      offset(r=-r_holes-r_inset)offset(r=r_holes)
        import(str("../assets/logos/33c3-herz-", col, ".svg"));
  }
}

module mask() {
  resize([width,0,0], auto=true)
    herz();
}

module outline() {
  offset(r=r_border){
    mask();
  }
}

module shell() {
  difference() {
    translate([-35.89489, -61.2327]){
      difference() {
        linear_extrude(h_bottom + d_pcbs + h_top) {
          difference() {
            offset(r=w_ledge){
              outline();
            }
            offset(r=w_ledge-w_wall){
              outline();
            }
          }
        }
        linear_extrude(h_bottom) {
          outline();
        }
        translate([0, 0, h_bottom + d_pcbs]) {
          linear_extrude(h_top) {
            outline();
          }
        }
      }
    }
    translate([-16-5, 0, h_bottom]) {
      cube([10, 20, 4]);
    }
  }
}

//square([1, 1]);
//square([w1, 0.1], center=true);

if (part == "outline") {
  outline();
}
else if (part == "mask"){
  mask();
}
else if (part == "diff"){
  difference() {
    outline();
    mask();
  }
}

else if (part == "shell"){
  shell();
}

