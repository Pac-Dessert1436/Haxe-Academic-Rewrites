final pi:Float = 3.1415926;

function cylinderVolume(r:Float, h:Float):Float {
	return pi * r * r * h;
}

function main():Void {
    Sys.println("- Cylinder Volume Calculator -");
	Sys.print("Enter radius and height, separated by a space: ");
	var input:Array<String> = Sys.stdin().readLine().split(" ");
	var radius:Float = Std.parseFloat(input[0]);
	var height:Float = Std.parseFloat(input[1]);
	var volume:Float = cylinderVolume(radius, height);
	Sys.println("Volume of the cylinder is " + volume);
}
