function doMath(a:Int, b:Int):Void {
    if (a + b > 100) {
        var d:Int = Std.int((a + b) / 100);
        Sys.println('Hundreds digit of the sum is $d.');
    } else {
        Sys.println('The sum of both numbers is ${a + b}.');
    }
}

function main():Void {
    Sys.println("- Sum with Hundreds Digit Example -");
    Sys.print("Enter two integers separated by a space: ");
    var input:Array<String> = Sys.stdin().readLine().split(" ");
    var num1:Int = Std.parseInt(input[0]);
    var num2:Int = Std.parseInt(input[1]);
    doMath(num1, num2);
}