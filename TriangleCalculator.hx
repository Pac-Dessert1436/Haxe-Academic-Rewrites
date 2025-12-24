typedef Sides = {
	var a:Float;
	var b:Float;
	var c:Float;
}

function triangleArea(sides:Sides):Float {
	var p:Float = (sides.a + sides.b + sides.c) / 2;
	return Math.sqrt(p * (p - sides.a) * (p - sides.b) * (p - sides.c));
}

function main():Void {
	Sys.println("- Triangle Perimeter & Area Calculator -");
	Sys.print("Enter the three sides of the triangle, separated by spaces: ");
	var input:Array<String> = Sys.stdin().readLine().split(" ");
	var sides:Sides = {
		a: Std.parseFloat(input[0]),
		b: Std.parseFloat(input[1]),
		c: Std.parseFloat(input[2])
	};
	var perimeter:Float = sides.a + sides.b + sides.c;
	Sys.println("Triangle perimeter: " + perimeter);
	Sys.println("Triangle area: " + triangleArea(sides));
}

// Q: What's the difference between perimeter and circumference?
// A: Perimeter is the total length of the boundary of any polygon, while circumference
//    specifically refers to the perimeter of a circle.
