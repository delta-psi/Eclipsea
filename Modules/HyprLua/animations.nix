
{ lua, ... }:


let 
  mkCurve = name: points: {
    _args = [
      name 
      {
        type = "bezier";
        points = lua points;
      }
    ];
  };
  mkSpring = name: mass: stiffness: dampening: {
    _args = [
      name
      {
        type = "spring";
        mass = mass;
        stiffness = stiffness;
        dampening = dampening;
      }
    ];
  };
in
{
  curve = [
    (mkCurve "overShoot" "{ {0.05, 0.95}, {0.05, 1.1} }")
    (mkCurve "pop" "{ {0.5, -0.3}, {1, 1} }")
    (mkCurve "emphasizedAccel" "{ {0.3, 0}, {0.8, 0.15} }")
    (mkCurve "emphasizedDecel" "{ {0.05, 0.7}, {0.1, 1} }")
    (mkCurve "specialWorkSwitch" "{ {0.05, 0.7}, {0.1, 1} }")
    (mkCurve "standard" "{ {0.2, 1}, {0.5, 1} }")

    (mkSpring "rubber" 1 70 10)

  ];

  animation = [
    {
			leaf = "layersIn";
			enabled = true;
			speed = 5;
			bezier = "emphasizedDecel";
			style = "slide";
		}
    {
			leaf = "layersOut";
			enabled = true;
			speed = 4;
			bezier = "emphasizedAccel";
			style = "slide";
		}
		#   {
		# 	leaf = "fadeLayersIn";
		# 	enabled = true;
		# 	speed = 5;
		# 	bezier = "standard";
		# 	style = "slide";
		# }
		#   {
		# 	leaf = "fadeLayersOut";
		# 	enabled = true;
		# 	speed = 5;
		# 	bezier = "standard";
		# 	style = "slide";
		# }
    {
			leaf = "windowsIn";
			enabled = true;
			speed = 5;
			bezier = "overShoot";
		}
    {
			leaf = "windowsOut";
			enabled = true;
			speed = 3;
			bezier = "pop";
		}
    {
			leaf = "windowsMove";
			enabled = true;
			speed = 6;
			bezier = "standard";
		}
    {
			leaf = "workspaces";
			enabled = true;
			speed = 5;
			bezier = "standard";
		}
    {
			leaf = "specialWorkspace";
			enabled = true;
			speed = 4;
			bezier = "specialWorkSwitch";
			style = "slidefadevert 15%";
		}
    {
			leaf = "fade";
			enabled = true;
			speed = 6;
			bezier = "standard";
		}
    {
			leaf = "fadeDim";
			enabled = true;
			speed = 6;
			bezier = "standard";
		}
    {
			leaf = "border";
			enabled = true;
			speed = 6;
			bezier = "standard";
		}
  ];
}
