package ;

import Array;

class Collar<T> {

	/*
	*	Can be accesed outside the class to perform functions.
	*/
	public var array(default, null):Array<T>;


	/*
	*	Current index in which all functions will act upon, unless specified not to.
	*/
	public var pointer(default, null):Int;


	/*
	*	Constructor, initializes both the pointer and array.
	*/
	public function new():Void {
		pointer = 0;
		array = new Array<T>();
	}


	/*
	*	Does what the function push in class Array does, added for convenience, as push 
	*	is a very common function and having to call it through the variable isn't as practical.
	*/
	public function push(x:T):Void {
		array.push(x);
	}


	/*
	*	Returns whats in the array at pointer, uses parameter ?index instead if specified.
	*/
	public function get(?index:Int):T {
		if ( index == null ) index = pointer;
		return array[transformIndex(index)];
	}


	/*
	*	Sets whats in the array at pointer to parameter x, uses parameter ?index as index instead if
	*	specified.
	*/
	public function set(?index:Int, x:T):Void {
		if ( index == null ) index = pointer;
		array[index] = x;
	}


	/*
	*	Sets pointer to index specified, will transform to in-bound if needed.
	*/
	public function setIndex(index:Int):Void {
		pointer = transformIndex(index);
	}


	/*
	*	Sets pointer to itself plus parameter steps, will transform to in-bound if needed.
	*/
	public function nextIndex(?steps:Int = 1):Void {
		pointer = transformIndex(pointer + steps);
	}


	/*
	*	Sets pointer to itself minus parameter steps, will transform to in-bound if needed.
	*/
	public function previousIndex(?steps:Int = 1):Void {
		pointer = transformIndex(pointer - steps);
	}


	/*
	*	Returns whats in the array at pointer plus number steps specified if none are, it will default to 1, 
	*	will move the pointer to the return position if specified in parameter movePointer.
	*/
	public function next(?steps:Int = 1, ?movePointer:Bool):T {
		var x:T = array[transformIndex(pointer + steps)];
		if ( moveIndex ) nextIndex(steps);
		return x;
	}


	/*
	*	Returns whats in the array at pointer minus number steps specified if none are, it will default to 1, 
	*	will move the pointer to the return position if specified in parameter movePointer.
	*/
	public function previous(?steps:Int = 1, ?movePointer:Bool):T {
		var x:T = array[transformIndex(pointer - steps)];
		if ( moveIndex ) previousIndex(steps);
		return x;
	}

	/*
	*	Will cycle the array backwards or forwards, to return an index inside array bounds.
	*	@param Index 	Integer to transform.
	*/
	private function transformIndex(index:Int):Void {
		if ( Math.abs(index) > array.length - 1 ) index %= array.length;
		if ( index < 0 ) return array.length + index;
		if ( index > array.length - 1 ) return index - array.length;
		return index;
	}
}