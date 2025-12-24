function stringComparator(a:String, b:String):Int {
    return if (a < b) -1 else if (a > b) 1 else 0;
}

function main():Void {
    Sys.println("- String Comparator Example -");
    Sys.print("Enter first string: ");
    var str1:String = Sys.stdin().readLine();
    Sys.print("Enter second string: ");
    var str2:String = Sys.stdin().readLine();
    var result:Int = stringComparator(str1, str2);
    if (result == -1) {
        Sys.println('"$str1" is less than "$str2".');
    } else if (result == 1) {
        Sys.println('"$str1" is greater than "$str2".');
    } else {
        Sys.println('"$str1" is equal to "$str2".');
    }
}