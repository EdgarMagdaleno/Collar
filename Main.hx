package ;

import Array;

class Main {
	public static function main() {
		new Main();
	}

	public function new() {
		var collar = new Collar<Int>();
		var array = new Array<Int>();

		collar.push(0);
		collar.push(1);
		collar.push(2);
		collar.push(3);
		collar.push(4);

		trace(collar.get(1));
	}

}