length = [45,30.5];
width = 20.5;
height = 20.5;
rippe=[6,5.5,1.5,9.2];//dx von vorne, breite Rille dx, breite Rille dy
rippe2=[20.5,6.5,1.5,9.2];//dx von vorne, breite Rille dx, breite Rille dy, tiefe Rille dz
wd = 3;

adafruit_fingerprint_sensor();

module adafruit_fingerprint_sensor()
{
  poly =
    [
    [0,0],
    [length[0],0],
    [length[0],1.8],
    [length[1],height],
    [length[1]-rippe[0],height],
    [length[1]-rippe[0],height-1.6],
    [length[1]-rippe[0]-rippe[1],height-1.6],
    [length[1]-rippe[0]-rippe[1],height],
    [0,height],

    ];
    inlay = rippe[2];
    difference()
    {
      linear_extrude(height=width, convexity=2) polygon(poly);
      union()
      {
        translate([length[1]-rippe[0]-rippe[1],height-rippe[3]+.1,-.1])cube([rippe[1],rippe[3],inlay ]);
        translate([length[1]-rippe2[0],height-rippe2[3]+.1,-.1])cube([rippe2[1],rippe2[3],rippe2[2] ]);
        translate([length[1]-rippe[0]-rippe[1],height-rippe[3]+.1,width-inlay+.1])cube([rippe[1],rippe[3],inlay ]);
        translate([length[1]-rippe2[0],height-rippe2[3]+.1,width-rippe2[2]+.1])cube([rippe2[1],rippe2[3],rippe2[2] ]);
      }
    }
}
