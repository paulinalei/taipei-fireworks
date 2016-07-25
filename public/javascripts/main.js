var app = app || {};

function getNumberBetween(a, b) {
  return Math.floor(Math.random() * b) + a;
}

var London = {
  river: null,
  wave: null,
  eyeWheel: null,
  shapes: {},
  positions: {
    eye: { x: 675, y: 100, radius: 60 },
    waves: { x: 300, y: 190, width: 200, height: 5, num: 12 },
    bridge: { x: 300, y: 170, width: 200 },
    wall: { y: 170 },
    shard: { x: 200, y: 0 },
    wharf: { x: 80, y: 40 },
    trees: [
      { x: 17, scale: .5 },
      { x: 550, scale: .5 },
      { x: 575, scale: .65 },
      { x: 600, scale: .8 },
      { x: 750, scale: .8 },
      { x: 775, scale: .65 },
      { x: 800, scale: .5 }
    ]
  },

  drawBanks: function() {
    var wharfSegments = [
      new Point(this.positions.wharf.x, this.positions.wharf.y + 200),
      new Point(this.positions.wharf.x, this.positions.wharf.y + 30),
      new Point(this.positions.wharf.x + 2, this.positions.wharf.y + 30),
      new Point(this.positions.wharf.x + 2, this.positions.wharf.y + 20),
      new Point(this.positions.wharf.x + 25, this.positions.wharf.y + 0),
      new Point(this.positions.wharf.x + 48, this.positions.wharf.y + 20),
      new Point(this.positions.wharf.x + 48, this.positions.wharf.y + 30),
      new Point(this.positions.wharf.x + 50, this.positions.wharf.y + 30),
      new Point(this.positions.wharf.x + 50, this.positions.wharf.y + 200)
    ];
    var wharf = new Path(wharfSegments);
    wharf.closed = true;
    wharf.fillColor = 'black';
    this.shapes.light.place(new Point(this.positions.wharf.x + 47, this.positions.wharf.y + 25));

    var hsSegments = [
      new Point(this.positions.wharf.x - 50, this.positions.wharf.y + 200),
      new Point(this.positions.wharf.x - 50, this.positions.wharf.y + 40),
      new Point(this.positions.wharf.x - 10, this.positions.wharf.y + 40),
      new Point(this.positions.wharf.x - 10, this.positions.wharf.y + 200)
    ];
    var hs = new Path(hsSegments);
    hs.closed = true;
    hs.fillColor = 'black';


    var dSegments = [
      new Point(this.positions.wharf.x + 60, this.positions.wharf.y + 200),
      new Point(this.positions.wharf.x + 60, this.positions.wharf.y + 50),
      new Point(this.positions.wharf.x + 60 + 2, this.positions.wharf.y + 50),
      new Point(this.positions.wharf.x + 60 + 2, this.positions.wharf.y + 40),
      new Point(this.positions.wharf.x + 60 + 48, this.positions.wharf.y + 40),
      new Point(this.positions.wharf.x + 60 + 48, this.positions.wharf.y + 50),
      new Point(this.positions.wharf.x + 60 + 50, this.positions.wharf.y + 50),
      new Point(this.positions.wharf.x + 60 + 50, this.positions.wharf.y + 200)
    ];
    var d = new Path(dSegments);
    d.closed = true;
    d.fillColor = 'black';
  },

  drawShard: function() {

    var segments = [
      new Point(this.positions.shard.x + 0, this.positions.shard.y + 200),
      new Point(this.positions.shard.x + 23, this.positions.shard.y + 20),
      new Point(this.positions.shard.x + 25, this.positions.shard.y + 40),
      new Point(this.positions.shard.x + 27, this.positions.shard.y + 20),
      new Point(this.positions.shard.x + 50, this.positions.shard.y + 200)
    ];
    var shard = new Path(segments);
    shard.closed = true;
    shard.fillColor = 'black';

    this.shapes.light.place(new Point(this.positions.shard.x + 27, this.positions.shard.y + 20));
  },

  drawCars: function() {
    var carsGoingEast = [];
    // cars on left
    carsGoingEast.push(this.shapes.car.place(new Point(this.positions.bridge.x - 40, this.positions.bridge.y - 2)));
    carsGoingEast.push(this.shapes.car.place(new Point(this.positions.bridge.x - 60, this.positions.bridge.y - 2)));

    carsGoingEast.push(this.shapes.car.place(new Point(this.positions.bridge.x - 160, this.positions.bridge.y - 2)));

    carsGoingEast.push(this.shapes.car.place(new Point(this.positions.bridge.x - 180, this.positions.bridge.y - 2)));
  },

  animateCars: function() {},

  drawTowerTops: function() {
    // TOWER SPIRES
    var towerLeftSegments = [
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) - 10, this.positions.bridge.y - 60),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) - 8, this.positions.bridge.y - 68),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) - 6, this.positions.bridge.y - 60),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) - 5, this.positions.bridge.y - 60),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) , this.positions.bridge.y - 80),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) + 5, this.positions.bridge.y - 60),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) + 6, this.positions.bridge.y - 60),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) + 8, this.positions.bridge.y - 68),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .3) + 10, this.positions.bridge.y - 60)
    ];
    var towerLeftSpire = new Path(towerLeftSegments);
    towerLeftSpire.closed = true;
    towerLeftSpire.fillColor = 'black';

    var towerTopSymbol = new Symbol(towerLeftSpire);
    towerTopSymbol.place(new Point(this.positions.bridge.x + (this.positions.bridge.width * .3), this.positions.bridge.y - 70));
    towerTopSymbol.place(new Point(this.positions.bridge.x + (this.positions.bridge.width * .7), this.positions.bridge.y - 70));

    // light on bridge top left tower
    this.shapes.light.place(new Point(this.positions.bridge.x + (this.positions.bridge.width * .3), this.positions.bridge.y - 80));

    // light on bridge top right tower
    this.shapes.light.place(new Point(this.positions.bridge.x + (this.positions.bridge.width * .7), this.positions.bridge.y - 80));

    var bridgeTowerTopLeft = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .3) - 13, this.positions.bridge.y - 60], // y position set on frame update
      size: [26, 28],
      fillColor: 'black'
    });

    var bridgeTowerTopRight = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) - 13, this.positions.bridge.y - 60], // y position set on frame update
      size: [26, 28],
      fillColor: 'black'
    });

    var bridgeJoinTop = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .3), this.positions.bridge.y - 60], // y position set on frame update
      size: [this.positions.bridge.width * .4, 5],
      fillColor: 'black'
    });

    var bridgeJoinTopUnder = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .3), this.positions.bridge.y - 53], // y position set on frame update
      size: [this.positions.bridge.width * .4, 2],
      fillColor: 'black'
    });
  },

  drawBridgeCurves1: function() {
    // BRIDGE SUPPORT CABLES
    var bridgeCurve1 = new Curve(new Point(100, 100), new Point(150, 100), new Point(200, 100), new Point(300, 50));

    var bridgeCurve1 = new Path({
      strokeCap: 'square',
      strokeColor: 'black',
      strokeWidth: .5
    });

    bridgeCurve1.add(
      new Point(this.positions.bridge.x - 10, this.positions.bridge.y),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .06), this.positions.bridge.y - 4),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .12), this.positions.bridge.y - 9),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .15), this.positions.bridge.y - 14),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .18), this.positions.bridge.y - 21),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .24), this.positions.bridge.y - 50)
    );
    // bridgeCurve1.selected = true;
    bridgeCurve1.smooth();

    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .06), this.positions.bridge.y - 4],
      size: [1, 4],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .12), this.positions.bridge.y - 9],
      size: [1, 9],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .18), this.positions.bridge.y - 21],
      size: [1, 21],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .23), this.positions.bridge.y - 50],
      size: [1, 50],
      fillColor: 'black'
    });
  },

  drawBridgeCurves2: function() {
    var bridgeCurve2 = new Path({
      strokeCap: 'square',
      strokeColor: 'black',
      strokeWidth: .5
    });

    bridgeCurve2.add(
      new Point(this.positions.bridge.x - 10, this.positions.bridge.y - 5),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .06), this.positions.bridge.y - 5 - 8),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .12), this.positions.bridge.y - 5 - 16),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .18), this.positions.bridge.y - 5 - 30),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .24), this.positions.bridge.y - 5 - 50)
    );
    // bridgeCurve2.selected = true;
    bridgeCurve2.smooth();

    new Path.Rectangle({
      point: [this.positions.bridge.x - 5 + (this.positions.bridge.width * .06), this.positions.bridge.y - 11],
      size: [1, 11],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x - 5 + (this.positions.bridge.width * .12), this.positions.bridge.y - 17],
      size: [1, 17],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x - 5 + (this.positions.bridge.width * .18), this.positions.bridge.y - 30],
      size: [1, 30],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x - 5 + (this.positions.bridge.width * .23), this.positions.bridge.y - 42],
      size: [1, 42],
      fillColor: 'black'
    });

    var bridgeCurve3 = new Curve(new Point(100, 100), new Point(150, 100), new Point(200, 100), new Point(300, 50));

    var bridgeCurve3 = new Path({
      strokeCap: 'square',
      strokeColor: 'black',
      strokeWidth: .5
    });

    bridgeCurve3.add(
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10, this.positions.bridge.y - 50),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .06), this.positions.bridge.y - 21),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .10), this.positions.bridge.y - 12),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .13), this.positions.bridge.y - 8),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .18), this.positions.bridge.y - 4),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 20 + (this.positions.bridge.width * .24), this.positions.bridge.y)
    );
    // bridgeCurve3.selected = true;
    bridgeCurve3.smooth();

    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .06), this.positions.bridge.y - 50],
      size: [1, 50],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .12), this.positions.bridge.y - 26],
      size: [1, 26],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .18), this.positions.bridge.y - 18],
      size: [1, 18],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .23), this.positions.bridge.y - 14],
      size: [1, 14],
      fillColor: 'black'
    });

    var bridgeCurve4 = new Path({
      strokeCap: 'square',
      strokeColor: 'black',
      strokeWidth: .5
    });

    bridgeCurve4.add(
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10, this.positions.bridge.y - 10 - 50),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .06), this.positions.bridge.y - 10 - 21),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .10), this.positions.bridge.y - 10 - 12),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .13), this.positions.bridge.y - 10 - 8),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 10 + (this.positions.bridge.width * .18), this.positions.bridge.y - 10 - 4),
      new Point(this.positions.bridge.x + (this.positions.bridge.width * .7) + 20 + (this.positions.bridge.width * .24), this.positions.bridge.y - 10)
    );
    // bridgeCurve4.selected = true;
    bridgeCurve4.smooth();

    new Path.Rectangle({
      point: [this.positions.bridge.x + 5 + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .06), this.positions.bridge.y - 42],
      size: [1, 42],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + 5 + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .12), this.positions.bridge.y - 22],
      size: [1, 22],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + 5 + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .18), this.positions.bridge.y - 16],
      size: [1, 16],
      fillColor: 'black'
    });
    new Path.Rectangle({
      point: [this.positions.bridge.x + 5 + (this.positions.bridge.width * .7) + (this.positions.bridge.width * .23), this.positions.bridge.y - 12],
      size: [1, 12],
      fillColor: 'black'
    });
  },

  drawGround: function() {
    // BASE GROUND HORIZON
    var groundLeft = new Path.Rectangle({
      point: [0, this.positions.wall.y],
      size: [this.positions.waves.x, 50],
      fillColor: 'black'
    });

    var groundRight = new Path.Rectangle({
      point: [this.positions.bridge.x + this.positions.bridge.width, this.positions.wall.y],
      size: [1000, 50],
      fillColor: 'black'
    });
  },

  drawRiver: function() {
    this.river = new Path.Rectangle({
      point: [this.positions.waves.x, 0], // y position set on frame update
      size: [this.positions.waves.width, 50],
      fillColor: 'pink'
    });
  },

  animateRiver: function(event) {
    this.river.position.y = this.wave.segments[0].point.y + 22;
  },

  drawWave: function() {
    // RIVER
    this.wave = new Path({
      strokeCap: 'square',
      fillColor: 'pink'
    });

    this.wave.position = new Point(100, 100);

    // Add 5 segment points to the path spread out
    // over the width of the view:
    for (var i = 0; i <= this.positions.waves.num; i++) {
      this.wave.add(new Point(this.positions.waves.x + ((i / this.positions.waves.num) * this.positions.waves.width), 1));
    }
  },

  drawTrees: function() {

    var treePath = new Path.Circle({
      center: [0, 0],
      radius: 6,
      fillColor: 'black'
    });

    var treePath2 = new Path.Circle({
      center: [4, 6],
      radius: 6,
      fillColor: 'black'
    });

    var treePath3 = new Path.Circle({
      center: [-4, 6],
      radius: 6,
      fillColor: 'black'
    });

    var treeTrunkPath = new Path.Rectangle({
      point: [-2, 10],
      size: [4, 10],
      fillColor: 'black'
    });

    var treeGroup = new Group([ treePath, treePath2, treePath3, treeTrunkPath ]);

    this.shapes.tree = new Symbol(treeGroup);

    for (var i = 0; i < this.positions.trees.length; i++) {

      var scaleOffset = (1 - this.positions.trees[i].scale) * 10;

      var t = this.shapes.tree.place(new Point(this.positions.trees[i].x, this.positions.wall.y - 10 + scaleOffset));
      t.scale(this.positions.trees[i].scale);

    }

  },

  animateWave: function(event) {
    // Loop through the segments of the path:
    for (var i = 0; i <= this.positions.waves.num; i++) {
      var segment = this.wave.segments[i];

      // A cylic value between -1 and 1
      var sinus = Math.sin(event.time * 3 + i);

      // Change the y position of the segment point:
      segment.point.y = sinus * this.positions.waves.height + this.positions.waves.y;

    }

    this.wave.smooth();
  },

  animateLondonEye: function() {
    this.eyeWheel.rotate(.1);
  },

  drawBridgeSections: function() {
    var bridgeLegLeft = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .3) - 17, this.positions.bridge.y], // y position set on frame update
      size: [34, 25],
      fillColor: 'black'
    });

    var bridgeLegRight = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) - 17, this.positions.bridge.y], // y position set on frame update
      size: [34, 25],
      fillColor: 'black'
    });

    var bridgeEdgeRight = new Path.Rectangle({
      point: [this.positions.bridge.x + this.positions.bridge.width, this.positions.bridge.y - 15], // y position set on frame update
      size: [20, 50],
      fillColor: 'black'
    });

    var bridgeEdgeLeft = new Path.Rectangle({
      point: [this.positions.bridge.x - 20, this.positions.bridge.y - 15], // y position set on frame update
      size: [20, 50],
      fillColor: 'black'
    });


    var bridgeTowerLeft = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .3) - 11, this.positions.bridge.y - 60], // y position set on frame update
      size: [22, 70],
      fillColor: 'black'
    });

    var bridgeTowerRight = new Path.Rectangle({
      point: [this.positions.bridge.x + (this.positions.bridge.width * .7) - 11, this.positions.bridge.y - 60], // y position set on frame update
      size: [22, 70],
      fillColor: 'black'
    });
  },

  drawLondonEye: function() {
    //  THE LONDON EYE WHEEL
    var leftLeg = new Path.Rectangle({
      point: [this.positions.eye.x - 63, this.positions.eye.y + 50],
      size: [100, 4],
      fillColor: 'black'
    });

    var rightLeg = new Path.Rectangle({
      point: [this.positions.eye.x - 38, this.positions.eye.y + 50],
      size: [100, 4],
      fillColor: 'black'
    });

    var wheel = new Path.Circle({
      center: [this.positions.eye.x, this.positions.eye.y],
      radius: 60,
      strokeColor: 'black',
      strokeWidth: 12
    });

    // wheel group to rotate together
    this.eyeWheel = new Group([ wheel ]);

    for (var i = 0; i < 24; i++) {

      var theta = Math.PI * 2 * (i / 24);
      var x = this.positions.eye.x + 60 * Math.cos(theta) - 5;
      var y = this.positions.eye.y + 60 * Math.sin(theta) - 5;

      var spoke = new Path.Rectangle({
        point: [this.positions.eye.x - 55, this.positions.eye.y],
        size: [109, 1],
        fillColor: 'black'
      });

      var rect = new Path.Rectangle({
        point: [x, y - 2],
        size: [10, 14],
        fillColor: '#e74c3c'
      });
      rect.rotate((360 / 24) * i);
      spoke.rotate((360 / 24) * i);

      this.eyeWheel.addChild(rect);
      this.eyeWheel.addChild(spoke);

      var x2 = this.positions.eye.x + 70 * Math.cos(theta) - 5;
      var y2 = this.positions.eye.y + 70 * Math.sin(theta) - 5;
      this.eyeWheel.addChild(this.shapes.light.place(new Point(x2 + 5, y2 + 5)));
    }

    // legs
    rightLeg.rotate(75);
    leftLeg.rotate(-75);
  }


};

London.drawGround();
London.drawTrees();

// LIGHTS
var lights = [];
var lightPath = new Path.Circle({
  center: view.center,
  radius: 2,
  fillColor: 'white'
});

var windowPath = new Path.Rectangle({
  center: view.center,
  size: [2, 4],
  fillColor: 'white'
});

London.shapes.light = new Symbol(lightPath);
London.shapes.window = new Symbol(windowPath);

London.drawLondonEye();

London.drawWave();

London.drawShard();

London.drawRiver();



// CARS
var carPath = new Path.Rectangle({
  point: [0, 0], // y position set on frame update
  size: [6, 3],
  fillColor: 'black'
});

London.shapes.car = new Symbol(carPath);



// LONDON BRIDGE
var bridgeRoad = new Path.Rectangle({
  point: [London.positions.bridge.x, London.positions.bridge.y], // y position set on frame update
  size: [London.positions.bridge.width, 3],
  fillColor: 'black'
});

var bridgeRoadUnderLeft = new Path.Rectangle({
  point: [London.positions.bridge.x, London.positions.bridge.y + 4], // y position set on frame update
  size: [London.positions.bridge.width, 1],
  fillColor: 'black'
});



London.drawTowerTops();

London.drawBridgeCurves1();

London.drawCars();

London.drawBridgeCurves2();

London.drawBridgeSections();
London.drawBanks();


var carDistanceTravelled = 0;
var carSpeed = 1;

var brightnessDir = 1;
var brightnessDiff = .01;
var brightnessMin = .7;
var brightness = brightnessMin;

function onFrame(event) {

  London.animateWave(event);
  London.animateRiver(event);



  London.animateLondonEye();

  // London.shapes.light.definition.fillColor.hue += 1;

  // console.log(London.shapes.light.definition.fillColor.brightness);
  if (brightness >= 1) {
    brightness -= brightnessDiff;
    brightnessDir = -1;
  } else if (brightness <= brightnessMin) {
    brightness += brightnessDiff;
    brightnessDir = 1;
  } else {
    brightness += brightnessDir * brightnessDiff;
  }

  London.shapes.light.definition.fillColor.brightness = brightness;

  London.animateCars(carDistanceTravelled, carSpeed);

  // make cars move across bridge
  if (carDistanceTravelled > 400) {
    carSpeed *= -1;
    carDistanceTravelled = 0;
  }

  London.shapes.car.definition.position.x += carSpeed;
  carDistanceTravelled += Math.abs(carSpeed);

}
