package ;

import Array;

class Collar<T> {
	private var array:Array<T>;
	private var index(default, null):Int;

	public function new():Void {
		index = 0;
		array = new Array<T>();
	}

	public function push(n:T):Void {
		array.push(n);
	}

	public function remove(n:T):Void {
		array.remove(n);
	}

	public function get(?index:Int):T {
		if ( index < 0 || index >= array.length ) throw("Index out of bounds.");
		if ( index == null ) index = this.index;

		return array[index];
	}

	public function set(n):Void {
		array[index] = n;
	}

	public function setIndex(n:Int):Void {
		if ( n < 0 || n >= array.length ) throw("Index out of bounds.");
		index = n;
	}

	public function nextIndex(?steps:Int = 1):Void {
		if ( steps > array.length ) steps %= array.length;
		if ( index + steps > array.length - 1 ) index += steps - array.length;
		else index += steps;
	}

	public function previousIndex(?steps:Int = 1):Void {
		if ( steps > array.length ) steps %= array.length;
		if ( index - steps < 0 ) index = array.length - steps;
		else index -= steps;
	}

	public function next(?steps:Int = 1, ?moveIndex:Bool):T {
		var n:T;

		if ( steps > array.length ) steps %= array.length;
		if ( index + steps > array.length - 1 ) n = array[index + steps - array.length];
		else n = array[index + steps];

		if ( moveIndex ) nextIndex(steps);
		return n;
	}

	public function previous(?steps:Int = 1, ?moveIndex:Bool):T {
		var n:T;

		if ( steps > array.length ) steps %= array.length;
		if ( index - steps < 0 ) n = array[array.length - steps];
		else n = array[index - steps];

		if ( moveIndex ) previousIndex(steps);
		return n;
	}
}