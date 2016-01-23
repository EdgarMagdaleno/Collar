package ;

class Main {
	public static function main() {
		new Main();
	}

	public function new() {
		var collar = new Collar<Int>();

		collar.push(1);
		collar.push(2);
		collar.push(3);
		collar.push(4);
		collar.push(5);
		
		collar.
		trace("Pointer: " + collar.pointer);
		for ( i in 0 ... 90 ) {
			trace(collar.next(true));
			Sys.sleep(.1);
		}
	}

}