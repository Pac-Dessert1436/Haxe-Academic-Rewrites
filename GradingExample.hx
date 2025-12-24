function gradingUsingIf(score:Int):Void {
    if (score >= 90) {
        Sys.println("Grade: A");
    } else if (score >= 80) {
        Sys.println("Grade: B");
    } else if (score >= 70) {
        Sys.println("Grade: C");
    } else if (score >= 60) {
        Sys.println("Grade: D");
    } else {
        Sys.println("Grade: F");
    }
}

function gradingUsingSwitch(score:Int):Void {
    switch (score / 10) {
        case 10, 9:
            Sys.println("Grade: A");
        case 8:
            Sys.println("Grade: B");
        case 7:
            Sys.println("Grade: C");
        case 6:
            Sys.println("Grade: D");
        default:
            Sys.println("Grade: F");
    }
}

function main():Void {
    try {
        Sys.println("- Grading System Example -");
        Sys.print("Enter the score (0-100): ");
        var input:String = Sys.stdin().readLine();
        var score:Int = Std.parseInt(input);
        if (score < 0 || score > 100) {
            Sys.println("Please enter a valid score between 0 and 100.");
            return;
        }
        Sys.print("Using \"if-else\" ->");
        gradingUsingIf(score);
        Sys.print("Using \"switch-case\" ->");
        gradingUsingSwitch(score);
    } catch (e:Dynamic) {
        Sys.println("Invalid input. Please enter a numeric score.");
    }
}