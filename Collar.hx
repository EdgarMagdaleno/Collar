package ;

class Collar {
	private var array:Array<Dynamic>;
	private var index:Int;

	public function new(array:Array<Dynamic>) {
		this.array = array;
		index = 0;
	}

	public function get(index:Int) {
		if ( index < 0 || index >= array.length ) throw("Index out of bounds.");
		return array[index];
	}

	public function set(n:Dynamic) {
		array[index] = n;
	}

	public function setIndex(n:Int) {
		if ( n < 0 || n >= array.length ) throw("Index out of bounds.");
		index = n;
	}

	public function nextIndex(?steps:Int) {
		if ( steps == null ) steps = 1;
		if ( steps > this.array.length ) steps %= array.length;
		if ( index - steps < 0 ) index = array.length - steps;
		else index = index - steps;
	}

	public function previousIndex(?steps:Int) {
		if ( steps == null ) steps = 1;
		if ( steps > this.array.length ) steps %= array.length;
		if ( index - steps < 0 ) index = array.length - steps;
		else index = index - steps;
	}

	public function next(?steps:Int, ?moveIndex:Bool) {
		var n:Dynamic;

		if ( steps == null ) steps = 1;
		if ( steps > array.length ) steps %= array.length;
		if ( index + steps > array.length - 1) n = array[index + steps - array.length];
		else n = array[index + steps];

		if ( moveIndex ) nextIndex(steps);
		return n;
	}

	public function previous(?steps:Int, ?moveIndex:Bool) {
		var n:Dynamic;

		if ( steps == null ) steps = 1;
		if ( steps > this.array.length ) steps %= array.length;
		if ( index - steps < 0 ) n = array[array.length - steps];
		else n = array[index - steps];

		if ( moveIndex ) previousIndex(steps);
		return n;
	}

	public function push(n:Dynamic) {
		array.push(n);
	}

	public function remove(n:Dynamic) {
		array.remove(n);
	}
}