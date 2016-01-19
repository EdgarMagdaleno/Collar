package ;

import Collar;

class Main {
	private var collar:Collar;
	public static function main() {
		new Main();
	}

	public function new() {
		var letras = ['A','B','C','D','E','F'];
		collar = new Collar(letras);
		trace(collar.next());		
	}

}