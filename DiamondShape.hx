function main():Void {
	var line:Int = 9;
	var half:Int = Std.int(line / 2 + 1);
	for (i in 1...line + 1) {
		var bound1:Int = Std.int(Math.abs(half - i) + 1);
		var bound2:Int = Std.int(Math.abs(Math.abs(half - i) - 4) * 2 + 1);
		for (_ in 0...bound1) {
			Sys.print(" ");
		}
		for (_ in 0...bound2) {
			Sys.print("*");
		}
		Sys.println("");
	}
}