
part = "outline"; //["outline", "mask", "diff"]

width = 72; // [50:100]
r_holes = 0.05; // [0:0.01:0.5]
r_inset = 0.1; // [0:0.01:0.5]
r_border = 2; // [0:0.1:5]

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

square([1, 1]);
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

