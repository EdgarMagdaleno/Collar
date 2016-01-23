package ;

import Array;

class Collar<T> {
	public var array(default, null):Array<T>;
	public var pointer(default, null):Int;

	public function new():Void {
		pointer = 0;
		array = new Array<T>();
	}

	public function push(x:T):Void {
		array.push(x);
	}

	public function get(?index:Int):T {
		if ( index == null ) index = pointer;
		return array[transformIndex(index)];
	}

	public function set(?index:Int, x:T):Void {
		if ( index == null ) index = pointer;
		array[index] = x;
	}

	public function setIndex(index:Int):Void {
		pointer = transformIndex(index);
	}

	public function nextIndex(?steps:Int = 1):Void {
		pointer = transformIndex(pointer + steps);
	}

	public function previousIndex(?steps:Int = 1):Void {
		pointer = transformIndex(pointer - steps);
	}

	public function next(?steps:Int = 1, ?moveIndex:Bool):T {
		var x:T = array[transformIndex(pointer + steps)];
		if ( moveIndex ) nextIndex(steps);
		return x;
	}

	public function previous(?steps:Int = 1, ?moveIndex:Bool):T {
		var x:T = array[transformIndex(pointer - steps)];
		if ( moveIndex ) previousIndex(steps);
		return x;
	}

	private function transformIndex(index:Int) {
		if ( Math.abs(index) > array.length - 1 ) index %= array.length;
		if ( index < 0 ) return array.length + index;
		if ( index > array.length - 1 ) return index - array.length;
		return index;
	}
}