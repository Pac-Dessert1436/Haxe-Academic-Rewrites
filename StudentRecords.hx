import sys.FileSystem;
import sys.io.File;

// This console program stores simple student records (name, student number, age) in an array 
// and persists them to `students.json`. It allows searching and editing records by index.
class Student {
	public var name:String;
	public var studentNumber:String;
	public var age:Int;

	public function new(name:String, studentNumber:String, age:Int) {
		this.name = name;
		this.studentNumber = studentNumber;
		this.age = age;
	}

	public function toDynamic():Dynamic {
		return {name: name, studentNumber: studentNumber, age: age};
	}

	public static function fromDynamic(d:Dynamic):Student {
		return new Student(d.name, d.studentNumber, d.age);
	}
}

var dataFile = "students.json";
var records:Array<Student> = [];

function printMenu() {
	Sys.println("Select an option:");
	Sys.println("1 -- Search");
	Sys.println("2 -- Enter / Edit");
	Sys.println("Q -- Quit");
	Sys.print("Enter choice: ");
}

function readLine():String {
	var input = Sys.stdin().readLine();
	return if (input == null) "" else input;
}

function ensureIndex(i:Int) {
	while (i >= records.length)
		records.push(null);
}

function search() {
	Sys.print("Enter index to search: ");
	var s = readLine();
	var idx = Std.parseInt(s);
	if (idx == null || idx < 0) {
		Sys.println("Invalid index.");
		return;
	}
	if (idx >= records.length || records[idx] == null) {
		Sys.println("No record at index " + idx);
	} else {
		var r = records[idx];
		Sys.println("Name: " + r.name);
		Sys.println("Student Number: " + r.studentNumber);
		Sys.println("Age: " + r.age);
	}
}

function edit() {
	Sys.print("Enter index to edit: ");
	var s = readLine();
	var idx = Std.parseInt(s);
	if (idx == null || idx < 0) {
		Sys.println("Invalid index.");
		return;
	}
	ensureIndex(idx);
	Sys.print("Enter name: ");
	var n = readLine();
	Sys.print("Enter student number: ");
	var sn = readLine();
	Sys.print("Enter age: ");
	var aStr = readLine();
	var a = Std.parseInt(aStr);
	if (a == null)
		a = 0;
	records[idx] = new Student(n, sn, a);
	saveRecords();
	Sys.println("Record saved at index " + idx);
}

function loadRecords() {
	if (FileSystem.exists(dataFile)) {
		try {
			var content = File.getContent(dataFile);
			var parsed:Dynamic = haxe.Json.parse(content);
			records = [];
			if (Std.isOfType(parsed, Array)) {
				for (d in cast(parsed, Array<Dynamic>)) {
					if (d != null)
						records.push(Student.fromDynamic(d));
					else
						records.push(null);
				}
			} else {
				Sys.println("Data file does not contain an array, starting empty.");
			}
		} catch (e:Dynamic) {
			records = [];
			Sys.println("Failed to read data file, starting empty.");
		}
	} else {
		records = [];
	}
}

function saveRecords() {
	var arr = records.map(function(s:Student) return if (s == null) null else s.toDynamic());
	File.saveContent(dataFile, haxe.Json.stringify(arr));
}

function main() {
	loadRecords();
	while (true) {
		printMenu();
		var choice = readLine().toUpperCase();
		switch (choice) {
			case "1":
				search();
			case "2":
				edit();
			case "Q":
				saveRecords();
				Sys.println("See you next time.");
				return;
			default:
				Sys.println("Unknown option. Please try again.");
		}
	}
}
