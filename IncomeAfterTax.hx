typedef Result = {
	var income:Float;
	var tax:Float;
	var afterTax:Float;
}

function main():Void {
	Sys.println("- \"Income After Tax\" Calculator -");
	Sys.print("Enter your income (or service fee): ");
	var input = Sys.stdin().readLine();
	var res:Result = {
		income: Std.parseFloat(input),
		tax: 0,
		afterTax: 0
	};
    if (res.income > 800) {
        res.tax = (res.income - 800) * 0.2;
        res.afterTax = res.income - res.tax;
    } else {
        res.tax = 0;
        res.afterTax = res.income;
    }
	Sys.println("Tax to pay: " + res.tax);
	Sys.println("Remaining service fee after tax: " + res.afterTax);
}
