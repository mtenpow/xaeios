var $=[

/************
Object image OSCorlib - Code: 0	Data: 0
**********/

function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 0: System.String System.Object::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return "[Object object]"/*"[Object object]"*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 1: System.Int32 System.Object::GetHashCode()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = $[5](this)/*V_0.1 = System.ObjectHelper::NativeGetHashCode(this)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 2: System.Boolean System.Object::Equals(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return (this == __f__[3])/*this ValueEquality o*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 3: System.Void System.ObjectHelper::Initialize()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					_[8] = 1/*System.ObjectHelper._hashCodeCounter = 1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //4: System.Int32 System.ObjectHelper::GenerateHashCode()
{
	var r0;
	r0 = _[8]/*$tf1 = System.ObjectHelper._hashCodeCounter*/;
	_[8] = (r0 + 1)/*System.ObjectHelper._hashCodeCounter = $tf1 Add 1*/;
	return r0/*$tf1*/;

},
function(a0/*obj*/)
 //5: System.Int32 System.ObjectHelper::NativeGetHashCode(System.Object)
{
	var r0;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = "_" in a0/*V_2.1 = obj.ContainsKey("_")*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 3
				r0 = $[4]()/*$t7 = System.ObjectHelper::GenerateHashCode()*/;
				a0["_"] = r0/*obj.set_Item("_", $t7)*/;
			}
			case 3:
			{
				r0 = a0["_"]/*V_1.1 = obj.get_Item("_")*/
				return r0/*V_1.1*/;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*obj*/,a1/*typeVtable*/,a2/*throwError*/)
 //6: System.Object System.ObjectHelper::Cast(System.NativeObject,System.NativeObject,System.Boolean)
{
	var r1,r2,r0,r3,r4;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r1 = (!(a0 == null))/*V_3.1 = BooleanNot obj ValueEquality null*/;
				if(r1)
				{
					__ep__ = 5;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				r1 = (!a2)/*V_3.2 = BooleanNot throwError*/
				if(r1)
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				r1 = {$:_[123],0:null,1:null,2:null,3:null}/*$t11 = new System.Void System.InvalidCastException::.ctor()()*/
				$[144].call(r1)/*$t11..ctor()*/;
				throw r1/*$t11*/;
			}
			case 4:
			{
				r0 = null/*V_2.1 = null*/
				__ep__ = 17;
				continue __ctrl__;
			}
			case 5:
			{
				__ep__ = 6
				r1 = a1["f"]/*$t16 = typeVtable.get_Item("f")*/;
				r3 = (!((r1 & 1) == 0))/*V_0.1 = BooleanNot $t16 BitwiseAnd 1 ValueEquality 0*/;
				r4 = a0["$"]/*V_1.1 = obj.get_Item("$")*/;
			}
			case 6:
			{
				r1 = (!(r4 == null))/*V_3.3 = BooleanNot V_1.1 ValueEquality null*/
				if(r1)
				{
					__ep__ = 10;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 7

				}
			}
			case 7:
			{
				r1 = (!a2)/*V_3.4 = BooleanNot throwError*/
				if(r1)
				{
					__ep__ = 9;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 8

				}
			}
			case 8:
			{
				r1 = {$:_[123],0:null,1:null,2:null,3:null}/*$t39 = new System.Void System.InvalidCastException::.ctor()()*/
				$[144].call(r1)/*$t39..ctor()*/;
				throw r1/*$t39*/;
			}
			case 9:
			{
				r0 = null/*V_2.2 = null*/
				__ep__ = 17;
				continue __ctrl__;
			}
			case 10:
			{
				r1 = (!(r4 == a1))/*V_3.5 = BooleanNot V_1.1 ValueEquality typeVtable*/
				if(r1)
				{
					__ep__ = 12;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 11

				}
			}
			case 11:
			{
				r0 = a0/*V_2.3 = obj*/
				__ep__ = 17;
				continue __ctrl__;
			}
			case 12:
			{
				if((!r3))
				{
					__ep__ = 14;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 13

				}
			}
			case 13:
			{
				r1 = $[7](r4,a1)/*$t49 = System.ObjectHelper::ImplementsInterface(V_1.1, typeVtable)*/
				r1 = (!r1)/*$ts0 = BooleanNot $t49*/;
				__ep__ = 15;
				continue __ctrl__;
			}
			case 14:
			{
				r1 = 1/*$ts0 = 1*/
				__ep__ = 15;
			}
			case 15:
			{
				r1 = r1/*V_3.6 = $ts0*/
				if(r1)
				{
					__ep__ = 18;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 16

				}
			}
			case 16:
			{
				r0 = a0/*V_2.4 = obj*/
				__ep__ = 17;
			}
			case 17:
			{
				return r0/*V_2.5*/
			}
			case 18:
			{
				__ep__ = 6
				r4 = r4["b"]/*System.ObjectHelper::GenerateCodeToAssignToBaseVTable(V_1.1)*/;
				continue __ctrl__;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*vtable*/,a1/*interfaceVtable*/)
 //7: System.Boolean System.ObjectHelper::ImplementsInterface(System.NativeObject,System.NativeObject)
{
	var r2,r0,r3,r1;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r2 = a0["i"]/*V_0.1 = vtable.get_Item("i")*/;
				r3 = (function(obj){var keys = []; for(var i in obj){  if(i == "$"){ continue; } keys.push(i);}; return keys;})(r2)/*V_1.1 = System.ObjectHelper::GetKeys(V_0.1)*/;
				r0 = 0/*V_2.1 = 0*/;
				__ep__ = 2;
			}
			case 2:
			{
				r2 = (r0 < r3.length)/*V_4.1 = V_2.3 LessThan (System.Int32)V_1.1.Length*/
				if(r2)
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				r1 = 0/*V_3.1 = 0*/
				__ep__ = 6;
				continue __ctrl__;
			}
			case 4:
			{
				r2 = _[r3[r0]]/*$t12 = System.ObjectHelper::GenerateCodeToDereferenceDataPointer(V_1.1[V_2.3])*/
				r2 = (!(r2 == a1))/*V_4.2 = BooleanNot $t12 ValueEquality interfaceVtable*/;
				if(r2)
				{
					__ep__ = 7;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 5

				}
			}
			case 5:
			{
				r1 = 1/*V_3.2 = 1*/
				__ep__ = 6;
			}
			case 6:
			{
				return r1/*V_3.3*/
			}
			case 7:
			{
				r0 = (r0 + 1)/*V_2.2 = V_2.3 Add 1*/
				__ep__ = 2;
				continue __ctrl__;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0)
// 8: System.Boolean System.ObjectHelper::TypesEqual(System.Object,System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r1 = __f__[3]/*$t0 = a*/;
					if((!r1))
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					r1 = (!(__f__[4] == null))/*$ts0 = BooleanNot b ValueEquality null*/
					__ep__ = 4;
					continue __ctrl__;
				}
				case 3:
				{
					r1 = 0/*$ts0 = 0*/
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r1 = r1/*V_1.1 = $ts0*/
					if(r1)
					{
						__ep__ = 5;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 7
						continue __ctrl__;

					}
				}
				case 5:
				{
					__ep__ = 6
					r1 = __f__[3]["$"]/*$t13 = a.get_Item("$")*/;
					r2 = __f__[4]["$"]/*$t18 = b.get_Item("$")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r0 = (r1 == r2)/*V_0.2 = $t13 ValueEquality $t18*/
					__ep__ = 8;
					continue __ctrl__;
				}
				case 7:
				{
					r0 = 0/*V_0.1 = 0*/
					__ep__ = 8;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					return r0/*V_0.3*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 9: System.Void System.ObjectHelper::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //10: System.String System.NativeObject::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.NativeToString()*/;
	return r0/*V_0.1*/;

},
function()
 //11: System.Int32 System.NativeObject::GetHashCode()
{
	var r0;
	r0 = $[5](this)/*V_0.1 = System.ObjectHelper::NativeGetHashCode(this)*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 12: System.String System.Exception::get_Message()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[1]/*V_0.1 = this._message*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 13: System.Exception System.Exception::get_InnerException()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[2]/*V_0.1 = this._innerException*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0)
// 14: System.Exception System.Exception::GetBaseException()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[13].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0],[null,null,0])/*__rv__ = this.get_InnerException()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					r1 = this/*V_1.1 = this*/;
					__ep__ = 3;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r2 = (!(r0 == null))/*V_3.1 = BooleanNot V_0.3 ValueEquality null*/
					if(r2)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					return r1/*V_1.3*/
				}
				case 5:
				{
					__ep__ = 3
					r1 = r0/*V_1.2 = V_0.3*/;
					__rv__ = $[13].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0],[null,null,0])/*__rv__ = V_0.3.get_InnerException()*/;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 15: System.String System.Exception::get_HelpLink()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 16: System.Void System.Exception::set_HelpLink(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 17: System.String System.Exception::get_Source()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 18: System.Void System.Exception::set_Source(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 19: System.String System.Exception::get_StackTrace()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[3]/*$t1 = this._stackTrace*/;
					r0 = (!(r0 == null))/*V_1.1 = BooleanNot $t1 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[0]/*$t10 = this._throwContext*/;
					__rv__ = $[COULD NOT FIXUP: [MethodCodePointer Could not resolve method: XaeiOS.SystemCalls::GetStackTrace]](r0)/*__rv__ = XaeiOS.SystemCalls::GetStackTrace($t10)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t11 = __rv__*/
					this[3] = r0/*this._stackTrace = $t11*/;
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0 = this[3]/*V_0.1 = this._stackTrace*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 20: System.String System.Exception::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[12].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Message()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t1 = __rv__*/;
					__rv__ = this.$[8].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_StackTrace()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t4 = __rv__*/
					r0 = (r1 + " " + r0)/*V_0.1 = System.String::Concat($t1, " ", $t4)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //21: System.Void System.Exception::.ctor()
{
	var r0;
	r0 = $[199]()/*$t1 = System.String::get_Empty()*/;
	$[23].call(this,r0,null)/*this..ctor($t1, null)*/;
	return;

},
function(a0/*message*/)
 //22: System.Void System.Exception::.ctor(System.String)
{
	$[23].call(this,a0,null)/*this..ctor(message, null)*/;
	return;

},
function(a0/*message*/,a1/*innerException*/)
 //23: System.Void System.Exception::.ctor(System.String,System.Exception)
{
	this[1] = a0/*this._message = message*/;
	this[2] = a1/*this._innerException = innerException*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 24: System.Void System.SystemException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[21].call(this)/*this..ctor()*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 25: System.Void System.SystemException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[22].call(this,__f__[3])/*this..ctor(message)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 26: System.Void System.SystemException::.ctor(System.String,System.Exception)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[23].call(this,__f__[3],__f__[4])/*this..ctor(message, innerException)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 27: System.Void System.InvalidOperationException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[25].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this..ctor(message)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 28: System.Void System.Attribute::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //29: System.Void System.Resources.ResourceManager::Initialize()
{
	var r0;
	r0 = {$:_[71],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.NativeArray`1<System.IDisposable>>::.ctor()()*/;
	$[97].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*$t0..ctor()*/;
	_[18] = r0/*System.Resources.ResourceManager._resourceMap = $t0*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 30: System.Void System.Resources.ResourceManager::RegisterSIP(XaeiOS.Process.SIP)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = _[18]/*$t0 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t2 = __rv__*/;
					__rv__ = r0.$[7].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*__rv__ = $t0.ContainsKey($t2)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t3 = __rv__*/
					r0 = (!r0)/*V_0.1 = BooleanNot $t3*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t8 = new System.Void System.Exception::.ctor(System.String)("SIP is already set up")*/;
					$[22].call(r0,"SIP is already set up")/*$t8..ctor("SIP is already set up")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					throw r0/*$t8*/
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = $[205](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,"Registering SIP with ResourceManager: ",__f__[3]])/*__rv__ = System.String::Concat("Registering SIP with ResourceManager: ", sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = __rv__/*$t11 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t11)*/;
					r0 = _[18]/*$t12 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r2 = __rv__/*$t14 = __rv__*/;
					r1 = new Array()/*$t15 = new System.Void System.NativeArray`1<System.IDisposable>::.ctor()()*/;
					r0.$[5].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r2,r1])/*$t12.set_Item($t14, $t15)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3)
// 31: System.Void System.Resources.ResourceManager::CleanupAndUnregisterSIP(XaeiOS.Process.SIP)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[205](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,"Cleaning up SIP: ",__f__[3]])/*__rv__ = System.String::Concat("Cleaning up SIP: ", sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t2 = __rv__*/;
					console.log(r1)/*System.Diagnostics.Logging::Log($t2)*/;
					r1 = _[18]/*$t3 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r2 = __rv__/*$t5 = __rv__*/;
					__rv__ = r1.$[4].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,r2])/*__rv__ = $t3.get_Item($t5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r3 = __rv__/*V_0.1 = __rv__*/
					r0 = 0/*V_1.1 = 0*/;
					__ep__ = 5;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r1 = r3.length/*$t8 = V_0.1.get_Length()*/
					r1 = (r0 < r1)/*V_3.1 = V_1.3 LessThan $t8*/;
					if(r1)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					r1 = _[18]/*$t11 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2 = __rv__/*$t13 = __rv__*/;
					r1.$[9].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,r2])/*$t11.Remove($t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					return
				}
				case 9:
				{
					__ep__ = 10
					r2 = new Array(4)/*V_2.1 = new System.Object[4]*/;
					r2[0] = "Freeing resource "/*V_2.1[0] = "Freeing resource "*/;
					r1 = r3[r0]/*$t21 = V_0.1.get_Item(V_1.3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r2[1] = r1/*V_2.1[1] = $t21*/;
					r2[2] = " left by SIP: "/*V_2.1[2] = " left by SIP: "*/;
					r2[3] = __f__[3]/*V_2.1[3] = sip*/;
					__rv__ = $[208](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,r2])/*__rv__ = System.String::Concat(V_2.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r1 = __rv__/*$t26 = __rv__*/;
					console.log(r1)/*System.Diagnostics.Logging::Log($t26)*/;
					r1 = r3[r0]/*$t28 = V_0.1.get_Item(V_1.3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					r1.$.i[45][0].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*$t28.Dispose()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					r0 = (r0 + 1)/*V_1.2 = V_1.3 Add 1*/
					__ep__ = 5;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 32: System.Void System.Resources.ResourceManager::RegisterResource(System.IDisposable)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = new Array(4)/*V_1.1 = new System.Object[4]*/;
					r1[0] = "Registering resource "/*V_1.1[0] = "Registering resource "*/;
					r1[1] = __f__[3]/*V_1.1[1] = resource*/;
					r1[2] = " for SIP: "/*V_1.1[2] = " for SIP: "*/;
					__rv__ = $[158](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::get_CurrentSIP()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t9 = __rv__*/;
					r1[3] = r0/*V_1.1[3] = $t9*/;
					__rv__ = $[208](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t10 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t10)*/;
					r1 = _[18]/*$t11 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[158](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::get_CurrentSIP()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t12 = __rv__*/;
					__rv__ = $[145].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t12.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t13 = __rv__*/;
					__rv__ = r1.$[4].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*__rv__ = $t11.get_Item($t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = __rv__/*V_0.1 = __rv__*/;
					r0.push(__f__[3])/*V_0.1.Push(resource)*/;
					console.log("Resource successfully registered")/*System.Diagnostics.Logging::Log("Resource successfully registered")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 33: System.Void System.Resources.ResourceManager::FreeResource(System.IDisposable)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 34: System.String System.Console::ReadLine()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 35: System.Int32 System.Console::Read()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 36: System.String System.Console::get_Title()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotSupportedException::.ctor()()*/;
					$[131].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 37: System.Void System.Console::set_Title(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotSupportedException::.ctor()()*/;
					$[131].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 38: System.Void System.Console::Write(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					ConsoleWrite(__f__[3])/*System.Console::ConsoleWrite(s)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 39: System.Void System.Console::WriteLine(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = (__f__[3] + "\n")/*$t2 = System.String::Concat(s, "
")*/;
					$[38](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*System.Console::Write($t2)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 40: System.Void System.Console::WriteLine()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[38](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,"\n"])/*System.Console::Write("
")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 41: System.Exception System.Threading.Thread::get_UnhandledException()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[9]/*V_0.1 = this._unhandledException*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 42: System.Threading.ThreadCallback System.Threading.Thread::get_Callback()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[10]/*V_0.1 = this._callback*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 43: System.Void System.Threading.Thread::set_Callback(System.Threading.ThreadCallback)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[10] = __f__[3]/*this._callback = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 44: System.String System.Threading.Thread::get_Name()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[11]/*V_0.1 = this._name*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 45: System.Void System.Threading.Thread::set_Name(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[11] = __f__[3]/*this._name = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 46: System.Boolean System.Threading.Thread::get_IsBackground()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[12]/*V_0.1 = this._isBackground*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 47: System.Void System.Threading.Thread::set_IsBackground(System.Boolean)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					this[12] = __f__[3]/*this._isBackground = value*/;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t2..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t2*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3)
// 48: System.Void System.Threading.Thread::Start()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[2]/*$t1 = this._threadStart*/;
					r0 = (!(r0 == null))/*V_0.1 = BooleanNot $t1 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotSupportedException::.ctor(System.String)("The thread start delegate was parametized.  Cannot start this thread without a parameter.")*/;
					$[132].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"The thread start delegate was parametized.  Cannot start this thread without a parameter."])/*$t9..ctor("The thread start delegate was parametized.  Cannot start this thread without a parameter.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t9*/
				}
				case 4:
				{
					r0 = this[11]/*$t11 = this._name*/
					r0 = (!(r0 == null))/*V_0.2 = BooleanNot $t11 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 8;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = new Date()/*$t20 = new System.Void System.NativeDate::.ctor()()*/;
					__rv__ = r0.getTime()/*__rv__ = $t20.GetTime()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = __rv__/*V_1.1 = __rv__*/;
					r0 = r0.toString()/*$t22 = V_1.1.ToString()*/;
					r0 = ("Thread: anonymous " + r0)/*$t23 = System.String::Concat("Thread: anonymous ", $t22)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					this[11] = r0/*this._name = $t23*/
					__ep__ = 8;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r0 = this[2]/*$t27 = this._threadStart*/;
					r3 = $[119].call($[66],r0)/*$t29 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)($t27, System.Threading.ThreadStart::Invoke)*/;
					/*$t29..ctor($t27, System.Threading.ThreadStart::Invoke)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					r2 = $[119].call($[53],this)/*$t32 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::InternalCallback)*/;
					/*$t32..ctor(this, System.Threading.Thread::InternalCallback)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r1 = this[4]/*$t34 = this._priority*/;
					r0 = this[11]/*$t36 = this._name*/;
					__rv__ = $[307](null,r3,r2,r1,r0)/*__rv__ = XaeiOS.SystemCalls::CreateTask(null, $t29, $t32, $t34, $t36)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r0 = __rv__/*$t37 = __rv__*/;
					this[0] = r0/*this._taskId = $t37*/;
					r1 = this[11]/*$t40 = this._name*/;
					r0 = this[0]/*$t43 = this._taskId*/;
					r0 = r0.toString()/*$t44 = $t43.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					r0 = ["Creating thread ", r1, " with task id: ", r0].join('')/*$t45 = System.String::Concat("Creating thread ", $t40, " with task id: ", $t44)*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t45)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					$[116](this)/*System.Threading.ThreadManager::RegisterThread(this)*/;
					this[6] = 1/*this._running = 1*/;
					r0 = this[0]/*$t50 = this._taskId*/;
					$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t50)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3)
// 49: System.Void System.Threading.Thread::Start(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[3]/*$t1 = this._parametizedThreadStart*/;
					r0 = (!(r0 == null))/*V_0.1 = BooleanNot $t1 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotSupportedException::.ctor(System.String)("The thread start delegate was not parametized.  Cannot start this thread with a parameter.")*/;
					$[132].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"The thread start delegate was not parametized.  Cannot start this thread with a parameter."])/*$t9..ctor("The thread start delegate was not parametized.  Cannot start this thread with a parameter.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t9*/
				}
				case 4:
				{
					r0 = this[11]/*$t11 = this._name*/
					r0 = (!(r0 == null))/*V_0.2 = BooleanNot $t11 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					this[11] = "Thread: anonymous"/*this._name = "Thread: anonymous"*/
					__ep__ = 6;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					this[8] = __f__[3]/*this._parameter = parameter*/;
					r3 = $[119].call($[52],this)/*$t26 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::ParametizedTaskFunction)*/;
					/*$t26..ctor(this, System.Threading.Thread::ParametizedTaskFunction)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2 = $[119].call($[53],this)/*$t29 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::InternalCallback)*/;
					/*$t29..ctor(this, System.Threading.Thread::InternalCallback)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r1 = this[4]/*$t31 = this._priority*/;
					r0 = this[11]/*$t33 = this._name*/;
					__rv__ = $[307](null,r3,r2,r1,r0)/*__rv__ = XaeiOS.SystemCalls::CreateTask(null, $t26, $t29, $t31, $t33)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					r0 = __rv__/*$t34 = __rv__*/;
					this[0] = r0/*this._taskId = $t34*/;
					r1 = this[11]/*$t37 = this._name*/;
					r0 = this[0]/*$t40 = this._taskId*/;
					r0 = r0.toString()/*$t41 = $t40.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r0 = ["Creating thread ", r1, " with task id: ", r0].join('')/*$t42 = System.String::Concat("Creating thread ", $t37, " with task id: ", $t41)*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t42)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					$[116](this)/*System.Threading.ThreadManager::RegisterThread(this)*/;
					this[6] = 1/*this._running = 1*/;
					r0 = this[0]/*$t47 = this._taskId*/;
					$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t47)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 50: System.Void System.Threading.Thread::Abort()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[51].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,null])/*this.Abort(null)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 51: System.Void System.Threading.Thread::Abort(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 52: System.Void System.Threading.Thread::ParametizedTaskFunction()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[3]/*$t1 = this._parametizedThreadStart*/;
					r1 = this[8]/*$t3 = this._parameter*/;
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1.Invoke($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*taskId*/,a1/*taskName*/,a2/*returnValue*/,a3/*exitStatus*/)
 //53: System.Void System.Threading.Thread::InternalCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)
{
	var r0,r1;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = a0.toString()/*$t2 = taskId.ToString()*/;
				r0 = ["Thread internal callback: ", r0, ":", a1].join('')/*$t5 = System.String::Concat("Thread internal callback: ", $t2, ":", taskName)*/;
				console.log(r0)/*System.Diagnostics.Logging::Log($t5)*/;
				this[6] = 0/*this._running = 0*/;
				$[117](this)/*System.Threading.ThreadManager::UnregisterThread(this)*/;
				r0 = this[10]/*$t10 = this._callback*/;
				r0 = (r0 == null)/*V_1.1 = $t10 ValueEquality null*/;
				if(r0)
				{
					__ep__ = 7;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				r0 = (!(a3 == 1))/*V_1.2 = BooleanNot exitStatus ValueEquality 1*/
				if(r0)
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				this[9] = $[6](a2,_[13],false)/*this._unhandledException = returnValue is System.Exception*/
				__ep__ = 6;
				continue __ctrl__;
			}
			case 4:
			{
				r0 = (!(a3 == 3))/*V_1.3 = BooleanNot exitStatus ValueEquality 3*/
				if(r0)
				{
					__ep__ = 6;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 5

				}
			}
			case 5:
			{
				r0 = a2.toString()/*$t44 = returnValue.NativeToString()*/
				r1 = {$:_[135],0:null,1:null,2:null,3:null}/*$t45 = new System.Void System.ExecutionEngineException::.ctor(System.String)($t44)*/;
				$[181].call(r1,r0)/*$t45..ctor($t44)*/;
				this[9] = r1/*this._unhandledException = $t45*/;
				__ep__ = 6;
			}
			case 6:
			{
				__ep__ = 7
				console.log("Creating a separate task for thread callback method")/*System.Diagnostics.Logging::Log("Creating a separate task for thread callback method")*/;
				r0 = this[10]/*$t28 = this._callback*/;
				r1 = $[119].call($[66],r0)/*$t30 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)($t28, System.Threading.ThreadCallback::Invoke)*/;
				/*$t30..ctor($t28, System.Threading.ThreadCallback::Invoke)*/r0 = $[307](null,r1,null,1,"Thread callback")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t30, null, 1, "Thread callback")*/;
				$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
			}
			case 7:
			{
				return
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*milliseconds*/)
 //54: System.Void System.Threading.Thread::InternalSleep(System.Int32)
{
	var r0;
	r0 = this[5]/*$t1 = this._blocked*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t1*/;
	if(r0)
	{
		r0 = this[0]/*$t16 = this._taskId*/;
		$[302](r0)/*XaeiOS.SystemCalls::BlockTask($t16)*/;
		r0 = $[119].call($[56],this)/*$t20 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::WakeUp)*/;
		/*$t20..ctor(this, System.Threading.Thread::WakeUp)*/r0 = $[120](r0)/*$t21 = System.NativeFunction::op_Explicit($t20)*/;
		r0 = setTimeout(r0, a0)/*$t24 = System.Global::SetTimeout($t21, (System.Int64)milliseconds)*/;
		this[7] = r0/*this._unblockTimeoutId = $t24*/;
		this[5] = 1/*this._blocked = 1*/;
		this[6] = 0/*this._running = 0*/;

	}
	else
	{
		r0 = this[7]/*$t6 = this._unblockTimeoutId*/
		clearTimeout(r0)/*System.Global::ClearTimeout($t6)*/;
		r0 = $[119].call($[56],this)/*$t10 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::WakeUp)*/;
		/*$t10..ctor(this, System.Threading.Thread::WakeUp)*/r0 = $[120](r0)/*$t11 = System.NativeFunction::op_Explicit($t10)*/;
		r0 = setTimeout(r0, a0)/*$t14 = System.Global::SetTimeout($t11, (System.Int64)milliseconds)*/;
		this[7] = r0/*this._unblockTimeoutId = $t14*/;

	}
	return;

},
function()
 //55: System.Void System.Threading.Thread::InternalSleep()
{
	var r0;
	r0 = this[5]/*$t1 = this._blocked*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t1*/;
	if(r0)
	{
		r0 = this[0]/*$t8 = this._taskId*/;
		$[302](r0)/*XaeiOS.SystemCalls::BlockTask($t8)*/;
		this[5] = 1/*this._blocked = 1*/;
		this[6] = 0/*this._running = 0*/;

	}
	else
	{
		r0 = this[7]/*$t6 = this._unblockTimeoutId*/
		clearTimeout(r0)/*System.Global::ClearTimeout($t6)*/;

	}
	return;

},
function()
 //56: System.Void System.Threading.Thread::WakeUp()
{
	var r0;
	r0 = this[5]/*V_0.1 = this._blocked*/;
	if(r0)
	{
		this[5] = 0/*this._blocked = 0*/;
		this[6] = 1/*this._running = 1*/;
		r0 = this[0]/*$t9 = this._taskId*/;
		$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t9)*/;
		return;

	}
	else
	{
		r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t3 = new System.Void System.Exception::.ctor(System.String)("Illegal thread state.  Cannot unblock a thread that is not blocked.")*/
		$[22].call(r0,"Illegal thread state.  Cannot unblock a thread that is not blocked.")/*$t3..ctor("Illegal thread state.  Cannot unblock a thread that is not blocked.")*/;
		throw r0/*$t3*/;

	}

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 57: System.String System.Threading.Thread::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = this[0]/*$t1 = this._taskId*/;
					r0 = this[11]/*$t4 = this._name*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,": ",r0])/*__rv__ = System.String::Concat($t1, ": ", $t4)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 58: System.Void System.Threading.Thread::Sleep(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = $[115]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
					$[54].call(r0,__f__[3])/*$t0.InternalSleep(milliseconds)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[304](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 59: System.Void System.Threading.Thread::Sleep()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = $[115]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
					$[55].call(r0)/*$t0.InternalSleep()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[304](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*threadStart*/)
 //60: System.Void System.Threading.Thread::ExecuteAsync(System.Threading.ThreadStart)
{
	var r0;
	r0 = $[119].call($[66],a0)/*$t3 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(threadStart, System.Threading.ThreadStart::Invoke)*/;
	/*$t3..ctor(threadStart, System.Threading.ThreadStart::Invoke)*/r0 = $[307](null,r0,null,3,"Thread pool thread")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t3, null, 3, "Thread pool thread")*/;
	$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 61: System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[62].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],3])/*this..ctor(threadStart, 3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 62: System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[2] = __f__[3]/*this._threadStart = threadStart*/;
					this[4] = __f__[4]/*this._priority = priority*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 63: System.Void System.Threading.Thread::.ctor(System.Threading.ParametizedThreadStart,System.Threading.ThreadPriority)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[3] = __f__[3]/*this._parametizedThreadStart = threadStart*/;
					this[4] = __f__[4]/*this._priority = priority*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //64: System.Object System.Delegate::get_Target()
{
	var r0;
	r0 = this[0]/*V_0.1 = this._target*/;
	return r0/*V_0.1*/;

},
function()
 //65: System.NativeFunction System.Delegate::get_Function()
{
	var r0;
	r0 = this[1]/*V_0.1 = this._function*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 66: System.Void System.Delegate::Invoke(System.Object[])
{
	this[1].apply(this[0], [1,__end__,0,null,null,__pco__,[null,null,0]]);
},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 67: System.Void System.Delegate::InvokeNative(System.Object[])
{
	if(typeof(this) == 'function'){return this.apply(null, arguments);}else{return this[1].apply(this[0], arguments);}
},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 68: System.Void System.Delegate::InternalCombine(System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[122],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.MulticastNotSupportedException::.ctor()()*/;
					$[143].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*d*/,a1/*target*/,a2/*function*/)
 //69: System.Void System.Delegate::InternalCreate(System.Delegate,System.Object,System.NativeFunction)
{
	a0[0] = a1/*d._target = target*/;
	a0[1] = a2/*d._function = function*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0)
// 70: System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r1 = (!(__f__[3] == null))/*V_2.1 = BooleanNot a ValueEquality null*/;
					if(r1)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					r0 = __f__[4]/*V_1.1 = b*/
					__ep__ = 9;
					continue __ctrl__;
				}
				case 3:
				{
					r1 = (!(__f__[4] == null))/*V_2.2 = BooleanNot b ValueEquality null*/
					if(r1)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					r0 = __f__[3]/*V_1.2 = a*/
					__ep__ = 9;
					continue __ctrl__;
				}
				case 5:
				{
					r1 = (!($[6](__f__[3],_[22],false) == null))/*V_2.3 = BooleanNot a is System.MulticastDelegate ValueEquality null*/
					if(r1)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					r2 = __f__[3][0]/*$t25 = a._target*/;
					r1 = __f__[3][1]/*$t27 = a._function*/;
					$[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0],[null,null,0,r2,r1])/*System.MulticastDelegate::InternalCreate($t25, $t27)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					$[6](__f__[3],_[22],false).$[5].call($[6](__f__[3],_[22],false),1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0],[null,null,0,__f__[4]])/*a is System.MulticastDelegate.InternalCombine(b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = $[6](__f__[3],_[22],false)/*V_1.3 = a is System.MulticastDelegate*/
					__ep__ = 9;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					return r0/*V_1.4*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 71: System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[122],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.MulticastNotSupportedException::.ctor(System.String)("Delegate::Remove not yet implemented")*/;
					$[142].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Delegate::Remove not yet implemented"])/*$t1..ctor("Delegate::Remove not yet implemented")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 72: System.Boolean System.Delegate::op_Equality(System.Delegate,System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 73: System.Boolean System.Delegate::op_Inequality(System.Delegate,System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //74: System.Void System.Delegate::.ctor()
{
	return;

},
function(a0/*target*/,a1/*function*/)
 //75: System.Void System.Delegate::.ctor(System.Object,System.NativeFunction)
{
	$[69](this,a0,a1)/*System.Delegate::InternalCreate(this, target, function)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 76: System.Void System.MulticastDelegate::Invoke(System.Object[])
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[66].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*this.Invoke(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = this[2]/*$t3 = this._next*/
					r0 = (r0 == null)/*V_0.1 = $t3 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = this[2]/*$t8 = this._next*/;
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*$t8.Invoke(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 77: System.Void System.MulticastDelegate::InvokeNative(System.Object[])
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[122],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.MulticastNotSupportedException::.ctor(System.String)("Native multicast delegates are not supported")*/;
					$[142].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Native multicast delegates are not supported"])/*$t1..ctor("Native multicast delegates are not supported")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0)
// 78: System.Void System.MulticastDelegate::InternalCombine(System.Delegate)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this/*V_0.1 = this*/;
					__ep__ = 2;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r2 = r0[2]/*$t1 = V_0.3._next*/
					r2 = (!(r2 == null))/*V_2.1 = BooleanNot $t1 ValueEquality null*/;
					if(r2)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					r1 = $[6](__f__[3],_[22],false)/*V_1.1 = d is System.MulticastDelegate*/
					r2 = (!($[6](__f__[3],_[22],false) == null))/*V_2.2 = BooleanNot d is System.MulticastDelegate ValueEquality null*/;
					if(r2)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r3 = $[64].call(__f__[3])/*$t17 = d.get_Target()*/;
					__rv__ = $[65].call(__f__[3])/*__rv__ = d.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r2 = __rv__/*$t19 = __rv__*/;
					r4 = {$:_[22],0:null,1:null,2:null,3:null}/*$t20 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t17, $t19)*/;
					$[81].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0],[null,null,0,r3,r2])/*$t20..ctor($t17, $t19)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r1 = r4/*V_1.2 = $t20*/
					__ep__ = 8;
					continue __ctrl__;
				}
				case 7:
				{
					__ep__ = 8
					__rv__ = $[79].call($[6](__f__[3],_[22],false),1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0],[null,null,0])/*__rv__ = d is System.MulticastDelegate.Clone()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r1 = __rv__/*V_1.3 = __rv__*/
					r0[2] = r1/*V_0.3._next = V_1.4*/;
					r1[3] = r0/*V_1.4._prev = V_0.3*/;
					return;
				}
				case 9:
				{
					r0 = r0[2]/*V_0.2 = V_0.3._next*/
					__ep__ = 2;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5)
// 79: System.MulticastDelegate System.MulticastDelegate::Clone()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r3 = $[64].call(this)/*$t1 = this.get_Target()*/;
					__rv__ = $[65].call(this)/*__rv__ = this.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*$t3 = __rv__*/;
					r5 = {$:_[22],0:null,1:null,2:null,3:null}/*$t4 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t1, $t3)*/;
					$[81].call(r5,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5],[null,null,0,r3,r2])/*$t4..ctor($t1, $t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = r5/*V_1.1 = $t4*/
					r1 = r5[2]/*V_2.1 = $t4._next*/;
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r2 = (!(r1 == null))/*V_5.1 = BooleanNot V_2.3 ValueEquality null*/
					if(r2)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					return r5/*$t4*/
				}
				case 6:
				{
					__ep__ = 7
					r3 = $[64].call(r1)/*$t12 = V_2.3.get_Target()*/;
					__rv__ = $[65].call(r1)/*__rv__ = V_2.3.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2 = __rv__/*$t13 = __rv__*/;
					r4 = {$:_[22],0:null,1:null,2:null,3:null}/*$t14 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t12, $t13)*/;
					$[81].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5],[null,null,0,r3,r2])/*$t14..ctor($t12, $t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r4[3] = r0/*$t14._prev = V_1.3*/
					r0 = r4/*V_1.2 = $t14*/;
					r1 = r1[2]/*V_2.2 = V_2.3._next*/;
					__ep__ = 4;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 80: System.MulticastDelegate System.MulticastDelegate::InternalCreate(System.Object,System.NativeFunction)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[22],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)(target, function)*/;
					$[81].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4]])/*$t2..ctor(target, function)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*$t2*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 81: System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[75].call(this,__f__[3],__f__[4])/*this..ctor(target, function)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 82: System.Void System.OverflowException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[21].call(this)/*this..ctor()*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //83: System.String System.Int32::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 84: System.Int32 System.Int32::GetHashCode()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return this/*this*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //85: System.String System.Decimal::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 86: System.Void System.Collections.Generic.KeyValuePair`2::.ctor(K,V)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = __f__[3]/*this.Key = key*/;
					this[1] = __f__[4]/*this.Value = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //87: System.String System.Int64::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function()
 //88: System.Void System.Boolean::.cctor()
{
	_[51] = "False"/*System.Boolean.FalseString = "False"*/;
	_[52] = "True"/*System.Boolean.TrueString = "True"*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 89: System.Int32 System.Collections.Generic.Dictionary`2::get_Count()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._keys*/;
					r0 = r0.length/*V_0.1 = $t1.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*V_0.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 90: V System.Collections.Generic.Dictionary`2::get_Item(K)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[1].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = key.GetHashCode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*V_0.1 = __rv__*/;
					r0 = this[2]/*$t3 = this._internalObject*/;
					r0 = r1 in r0/*V_2.1 = $t3.ContainsKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t7 = new System.Void System.Exception::.ctor(System.String)("Key not found")*/;
					$[22].call(r0,"Key not found")/*$t7..ctor("Key not found")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					throw r0/*$t7*/
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[2]/*$t9 = this._internalObject*/;
					r0 = r0[r1]/*V_1.1 = $t9.get_Item(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return r0/*V_1.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 91: System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[1].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = key.GetHashCode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*V_0.1 = __rv__*/;
					r0 = this[2]/*$t3 = this._internalObject*/;
					r0 = r2 in r0/*V_1.1 = $t3.ContainsKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r1 = this[1]/*$t7 = this._keysToIndexMapping*/;
					r0 = this[0]/*$t10 = this._keys*/;
					r0 = r0.length/*$t12 = $t10.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r1[r2] = r0/*$t7.set_Item(V_0.1, $t12)*/;
					r0 = this[0]/*$t14 = this._keys*/;
					r0.push(__f__[3])/*$t14.Push(key)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[2]/*$t17 = this._internalObject*/;
					r0[r2] = __f__[4]/*$t17.set_Item(V_0.1, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 92: System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 93: System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[2]/*$t1 = this._internalObject*/;
					__rv__ = __f__[3].$[1].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = key.GetHashCode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r1 = __rv__/*$t4 = __rv__*/
					r0 = r1 in r0/*V_0.1 = $t1.ContainsKey($t4)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 94: System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5)
// 95: System.Boolean System.Collections.Generic.Dictionary`2::Remove(K)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[1].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5],[null,null,0])/*__rv__ = key.GetHashCode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r3 = __rv__/*V_0.1 = __rv__*/;
					r1 = this[2]/*$t3 = this._internalObject*/;
					r1 = r3 in r1/*V_6.1 = $t3.ContainsKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					if(r1)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					r0 = 0/*V_5.1 = 0*/
					__ep__ = 11;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					r1 = this[1]/*$t8 = this._keysToIndexMapping*/;
					r2 = r1[r3]/*V_1.1 = $t8.get_Item(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r1 = this[1]/*$t13 = this._keysToIndexMapping*/;
					delete r1[r3]/*$t13.RemoveKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r4 = new Array()/*$t15 = new System.Void System.NativeArray`1<K>::.ctor()()*/;
					r1 = this[0]/*$t17 = this._keys*/;
					r5 = r1.length/*$t18 = $t17.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r1 = (0 < (r5 - 1))/*V_6.2 = 0 LessThan $t18 Subtract 1*/
					if(r1)
					{
						__ep__ = 12;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 9
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

						}

					}
				}
				case 9:
				{
					__ep__ = 10
					this[0] = r4/*this._keys = $t15*/;
					r1 = this[2]/*$t26 = this._internalObject*/;
					delete r1[r3]/*$t26.RemoveKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r0 = 1/*V_5.2 = 1*/
					__ep__ = 11;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					return r0/*V_5.3*/
				}
				case 12:
				{
					r1 = (!(0 == r2))/*V_6.3 = BooleanNot 0 ValueEquality V_1.1*/
					if(r1)
					{
						__ep__ = 13;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 8
						continue __ctrl__;

					}
				}
				case 13:
				{
					__ep__ = 14
					r1 = this[0]/*$t37 = this._keys*/;
					r1 = r1[0]/*$t39 = $t37.get_Item(0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 8
					r4.push(r1)/*$t15.Push($t39)*/;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4,r5]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 96: System.Void System.Collections.Generic.Dictionary`2::Clear()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = new Array()/*$t1 = new System.Void System.NativeArray`1<K>::.ctor()()*/;
					this[0] = r0/*this._keys = $t1*/;
					r0 = new Object()/*$t3 = new System.Void System.NativeObject::.ctor()()*/;
					this[1] = r0/*this._keysToIndexMapping = $t3*/;
					r0 = new Object()/*$t5 = new System.Void System.NativeObject::.ctor()()*/;
					this[2] = r0/*this._internalObject = $t5*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 97: System.Void System.Collections.Generic.Dictionary`2::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = new Array()/*$t2 = new System.Void System.NativeArray`1<K>::.ctor()()*/;
					this[0] = r0/*this._keys = $t2*/;
					r0 = new Object()/*$t4 = new System.Void System.NativeObject::.ctor()()*/;
					this[1] = r0/*this._keysToIndexMapping = $t4*/;
					r0 = new Object()/*$t6 = new System.Void System.NativeObject::.ctor()()*/;
					this[2] = r0/*this._internalObject = $t6*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 98: System.Void System.Collections.Generic.Dictionary`2::.ctor(System.Collections.Generic.Dictionary`2<K,V>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[97].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //99: System.String System.var::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.NativeToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 100: System.Void System.var::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 101: System.Void System.Reflection.MethodInfo::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 102: System.Boolean System.WeakReference::get_IsAlive()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[132].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t1..ctor("WeakReference not supported")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 103: System.Object System.WeakReference::get_Target()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[132].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t1..ctor("WeakReference not supported")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 104: System.Void System.WeakReference::.ctor(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[116],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[132].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t2..ctor("WeakReference not supported")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t2*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 105: System.Void System.Threading.Lock::Acquire()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__end__ = Number.POSITIVE_INFINITY;
	__ctrl__:
	while(true)
	{
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[306]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 2:
				{
					r2 = __rv__/*V_0.1 = __rv__*/
					r0 = this[0]/*$t2 = this._owner*/;
					if((!r0))
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3

					}
				}
				case 3:
				{
					r0 = this[0]/*$t4 = this._owner*/
					r0 = (!(r0 == r2))/*$ts0 = BooleanNot $t4 ValueEquality V_0.1*/;
					__ep__ = 5;
					continue __ctrl__;
				}
				case 4:
				{
					r0 = 0/*$ts0 = 0*/
					__ep__ = 5;
				}
				case 5:
				{
					r0 = r0/*V_1.1 = $ts0*/
					if(r0)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6

					}
				}
				case 6:
				{
					this[0] = r2/*this._owner = V_0.1*/
					return;
				}
				case 7:
				{
					__ep__ = 8
					r0 = this[1]/*$t12 = this._waitingOwners*/;
					r0.push(r2)/*$t12.Push(V_0.1)*/;
				}
				case 8:
				{
					__ep__ = 2
					$[302](r2)/*XaeiOS.SystemCalls::BlockTask(V_0.1)*/;
					$[304](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0)
// 106: System.Boolean System.Threading.Lock::TryAcquire()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__end__ = Number.POSITIVE_INFINITY;
	__ctrl__:
	while(true)
	{
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r2 = $[306]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
					r1 = this[0]/*$t2 = this._owner*/;
					r1 = (!(r1 == 0))/*V_2.1 = BooleanNot $t2 ValueEquality 0*/;
					if(r1)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2

					}
				}
				case 2:
				{
					this[0] = r2/*this._owner = V_0.1*/
					r0 = 1/*V_1.1 = 1*/;
					__ep__ = 6;
					continue __ctrl__;
				}
				case 3:
				{
					r1 = this[0]/*$t12 = this._owner*/
					r1 = (!(r1 == r2))/*V_2.2 = BooleanNot $t12 ValueEquality V_0.1*/;
					if(r1)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4

					}
				}
				case 4:
				{
					r0 = 1/*V_1.2 = 1*/
					__ep__ = 6;
					continue __ctrl__;
				}
				case 5:
				{
					r0 = 0/*V_1.3 = 0*/
					__ep__ = 6;
				}
				case 6:
				{
					return r0/*V_1.4*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //107: System.Void System.Threading.Lock::Release()
{
	var r0,r1;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = $[306]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				r1 = this[0]/*$t2 = this._owner*/;
				r0 = (!(r1 == r0))/*V_1.1 = BooleanNot $t2 ValueEquality V_0.1*/;
				if(r0)
				{
					__ep__ = 5;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				this[0] = 0/*this._owner = 0*/
				r0 = this[1]/*$t11 = this._waitingOwners*/;
				r0 = r0.length/*$t12 = $t11.get_Length()*/;
				r0 = (!(r0 > 0))/*V_1.2 = BooleanNot $t12 GreaterThan 0*/;
				if(r0)
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				__ep__ = 4
				r0 = this[1]/*$t21 = this._waitingOwners*/;
				r0 = r0.shift()/*$tf23 = $t21.Shift()*/;
				this[0] = r0/*this._owner = $tf23*/;
				$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($tf23)*/;
			}
			case 4:
			{
				return
			}
			case 5:
			{
				r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t25 = new System.Void System.Exception::.ctor(System.String)("Cannot release lock.  Current thread is not owner")*/
				$[22].call(r0,"Cannot release lock.  Current thread is not owner")/*$t25..ctor("Cannot release lock.  Current thread is not owner")*/;
				throw r0/*$t25*/;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 108: System.Void System.Threading.Lock::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = 0/*this._owner = 0*/;
					r0 = new Array()/*$t4 = new System.Void System.NativeArray`1<System.Int32>::.ctor()()*/;
					this[1] = r0/*this._waitingOwners = $t4*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 109: System.Void System.NullReferenceException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[24].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 110: System.Void System.NullReferenceException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[25].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this..ctor(message)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 111: System.Void System.NullReferenceException::.ctor(System.String,System.Exception)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[26].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],__f__[4]])/*this..ctor(message, innerException)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 112: System.Void System.EventArgs::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 113: System.Void System.EventArgs::.cctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[81]}/*$t0 = new System.Void System.EventArgs::.ctor()()*/;
					$[112].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					_[82] = r0/*System.EventArgs.Empty = $t0*/
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 114: System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[22].call(this,__f__[3])/*this..ctor(message)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //115: System.Threading.Thread System.Threading.ThreadManager::get_CurrentThread()
{
	var r0,r1;
	r0 = _[104]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = $[306]()/*$t1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
	r0 = r0.$[4].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1])/*V_0.1 = $t0.get_Item($t1)*/;
	return r0/*V_0.1*/;

},
function(a0/*thread*/)
 //116: System.Void System.Threading.ThreadManager::RegisterThread(System.Threading.Thread)
{
	var r0,r1;
	r0 = _[104]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = a0[0]/*$t2 = thread._taskId*/;
	r0.$[5].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1,a0])/*$t0.set_Item($t2, thread)*/;
	return;

},
function(a0/*thread*/)
 //117: System.Void System.Threading.ThreadManager::UnregisterThread(System.Threading.Thread)
{
	var r0,r1;
	r0 = _[104]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = a0[0]/*$t2 = thread._taskId*/;
	r0.$[9].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1])/*$t0.Remove($t2)*/;
	return;

},
function()
 //118: System.Void System.Threading.ThreadManager::Initialize()
{
	var r0;
	r0 = {$:_[71],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Threading.Thread>::.ctor()()*/;
	$[97].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*$t0..ctor()*/;
	_[104] = r0/*System.Threading.ThreadManager._threadsByTaskId = $t0*/;
	return;

},
function(a0/*self*/)
 //119: System.NativeFunction System.NativeFunction::Bind(System.var)
{
	var r0,r1;
	r1 = this/*V_0.1 = System.NativeFunction::GenerateCodeForThis()*/;
	r0 = arguments/*$t1 = System.NativeFunction::GetArguments()*/;
	r0 = (!(r0.length == 1))/*V_2.1 = BooleanNot (System.Int32)$t1.Length ValueEquality 1*/;
	if(r0)
	{
		r0 = new Error("Not yet implemented")/*$t13 = new System.Void System.NativeError::.ctor(System.String)("Not yet implemented")*/;
		throw r0/*$t13*/;

	}
	else
	{
		r0 = function(){ return r1.apply(a0, arguments); }/*V_1.1 = System.NativeFunction::GenerateCodeForBoundNativeFunctionSimple(V_0.1, self)*/
		return r0/*V_1.1*/;

	}

},
function(a0/*d*/)
 //120: System.NativeFunction System.NativeFunction::op_Explicit(System.Delegate)
{
	var r0;
	r0 = typeof(a0)/*$t2 = d.TypeOf()*/;
	r0 = (r0 == "function")/*$t4 = System.String::op_Equality($t2, "function")*/;
	r0 = (!r0)/*V_2.1 = BooleanNot $t4*/;
	if(r0)
	{
		r0 = {$:_[123],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.InvalidCastException::.ctor()()*/;
		$[144].call(r0)/*$t9..ctor()*/;
		throw r0/*$t9*/;

	}
	else
	{
		return a0/*d*/

	}

},
function(a0/*initDelegate*/)
 //121: System.Void XaeiOS.Boot.BootManager::Boot(System.VoidDelegate)
{
	var r0,r1;
	r0 = _[108]/*$t0 = XaeiOS.Boot.BootManager._booting*/;
	r0 = (!r0)/*V_1.1 = BooleanNot $t0*/;
	if(r0)
	{
		r0 = _[109]/*$t6 = XaeiOS.Boot.BootManager._booted*/;
		r0 = (!r0)/*V_1.2 = BooleanNot $t6*/;
		if(r0)
		{
			r0 = (!(a0 == null))/*V_1.3 = BooleanNot initDelegate ValueEquality null*/;
			if(r0)
			{
				_[108] = 1/*XaeiOS.Boot.BootManager._booting = 1*/;
				$[300]()/*XaeiOS.SystemCalls::InitializeKernel()*/;
				$[239]()/*XaeiOS.OSCorlib::Initialize()*/;
				_[110] = a0/*XaeiOS.Boot.BootManager._initDelegate = initDelegate*/;
				r1 = $[123]/*$t26 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Boot.BootManager::CreateInitProcess)*/;
				/*$t26..ctor(null, XaeiOS.Boot.BootManager::CreateInitProcess)*/r0 = $[122]/*$t29 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Boot.BootManager::BootCallback)*/;
				/*$t29..ctor(null, XaeiOS.Boot.BootManager::BootCallback)*/r0 = $[307](null,r1,r0,3,"XaeiOS.Boot")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t26, $t29, 3, "XaeiOS.Boot")*/;
				$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
				return;

			}
			else
			{
				r0 = new Error("Cannot boot with null init delegate.")/*$t20 = new System.Void System.NativeError::.ctor(System.String)("Cannot boot with null init delegate.")*/
				throw r0/*$t20*/;

			}

		}
		else
		{
			r0 = new Error("XaeiOS already booted.")/*$t11 = new System.Void System.NativeError::.ctor(System.String)("XaeiOS already booted.")*/
			throw r0/*$t11*/;

		}

	}
	else
	{
		r0 = new Error("XaeiOS already booting.")/*$t5 = new System.Void System.NativeError::.ctor(System.String)("XaeiOS already booting.")*/
		throw r0/*$t5*/;

	}

},
function(a0/*taskId*/,a1/*taskName*/,a2/*returnValue*/,a3/*exitStatus*/)
 //122: System.Void XaeiOS.Boot.BootManager::BootCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)
{
	var r0;
	r0 = _[109]/*V_0.1 = XaeiOS.Boot.BootManager._booted*/;
	if(r0)
	{
		return;

	}
	else
	{
		r0 = new Error("XaeiOS.Boot process failed to boot")/*$t2 = new System.Void System.NativeError::.ctor(System.String)("XaeiOS.Boot process failed to boot")*/
		throw r0/*$t2*/;

	}

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 123: System.Void XaeiOS.Boot.BootManager::CreateInitProcess()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r2 = {$:_[254],0:null}/*$t0 = new System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::.ctor()()*/;
					$[249].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = _[110]/*$t1 = XaeiOS.Boot.BootManager._initDelegate*/;
					r1 = {$:_[24],0:null,1:null,2:null,3:null}/*$t3 = new System.Void System.Threading.ThreadStart::.ctor(System.Object,System.IntPtr)($t1, System.VoidDelegate::Invoke)*/;
					$[69](r1,r0,$[67])/*$t3..ctor($t1, System.VoidDelegate::Invoke)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = {$:_[127],0:null,1:null,2:null,3:0,4:null,5:0,6:null,7:null}/*$t6 = new System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)($t3, 3, "XaeiOS.Init")*/;
					$[159].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1,3,"XaeiOS.Init"])/*$t6..ctor($t3, 3, "XaeiOS.Init")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r2[0] = r0/*$t0.initProcess = $t6*/;
					r0 = r2[0]/*$t7 = $t0.initProcess*/;
					r1 = {$:_[23],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.Threading.ThreadCallback::.ctor(System.Object,System.IntPtr)($t0, XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0)*/;
					$[69](r1,r2,$[248])/*$t9..ctor($t0, XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[148].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t7.set_Callback($t9)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = r2[0]/*$t10 = $t0.initProcess*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t10.Start()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					_[109] = 1/*XaeiOS.Boot.BootManager._booted = 1*/
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 124: System.Void System.Threading.Condition::Signal()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._lock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[1]/*$t3 = this._waitingList*/;
					r0 = r0.length/*$t4 = $t3.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = (!(r0 > 0))/*V_0.1 = BooleanNot $t4 GreaterThan 0*/
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[1]/*$t12 = this._waitingList*/;
					__rv__ = r0.shift()/*__rv__ = $t12.Shift()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t13 = __rv__*/;
					$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[0]/*$t15 = this._lock*/;
					$[107].call(r0)/*$t15.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 125: System.Void System.Threading.Condition::Await()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._lock*/;
					$[107].call(r0)/*$t1.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = $[306]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
					r0 = this[1]/*$t4 = this._waitingList*/;
					r0.push(r1)/*$t4.Push(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[302](r1)/*XaeiOS.SystemCalls::BlockTask(V_0.1)*/;
					$[304](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[0]/*$t6 = this._lock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t6.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 126: System.Void System.Threading.Condition::.ctor(System.Threading.Lock)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = __f__[3]/*this._lock = l*/;
					r0 = new Array()/*$t4 = new System.Void System.NativeArray`1<System.Int32>::.ctor()()*/;
					this[1] = r0/*this._waitingList = $t4*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 127: System.Void System.Threading.TimedCondition::Await(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__end__ = Number.POSITIVE_INFINITY;
	__ctrl__:
	while(true)
	{
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = $[119].call($[128],this)/*$t3 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.TimedCondition::Unblock)*/;
					/*$t3..ctor(this, System.Threading.TimedCondition::Unblock)*/}
				case 2:
				{
					__ep__ = 3
					r0 = $[120](r0)/*$t4 = System.NativeFunction::op_Explicit($t3)*/;
					r0 = setTimeout(r0, __f__[3])/*$t7 = System.Global::SetTimeout($t4, (System.Int64)timeoutMs)*/;
				}
				case 3:
				{
					__ep__ = 4
					this[2] = r0/*this._timeoutId = $t7*/;
					__rv__ = $[306]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t9 = __rv__*/;
					this[3] = r0/*this._taskId = $t9*/;
					this[4] = 0/*this._timedOut = 0*/;
					$[125].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this.Await()*/;
				}
				case 5:
				{
					__ep__ = 6
					r0 = this[2]/*$t14 = this._timeoutId*/;
					clearTimeout(r0)/*System.Global::ClearTimeout($t14)*/;
				}
				case 6:
				{
					this[2] = null/*this._timeoutId = null*/
					this[3] = 0/*this._taskId = 0*/;
					r0 = this[4]/*$t20 = this._timedOut*/;
					r0 = (!r0)/*V_0.1 = BooleanNot $t20*/;
					if(r0)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 7

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = {$:_[115],0:null,1:null,2:null,3:null}/*$t24 = new System.Void System.Threading.ConditionTimedOutException::.ctor()()*/;
					$[130].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t24..ctor()*/;
				}
				case 8:
				{
					throw r0/*$t24*/
				}
				case 9:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //128: System.Void System.Threading.TimedCondition::Unblock()
{
	var r0;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = this[2]/*$t1 = this._timeoutId*/;
				r0 = (r0 == null)/*V_0.1 = $t1 ValueEquality null*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 3
				this[4] = 1/*this._timedOut = 1*/;
				r0 = this[3]/*$t8 = this._taskId*/;
				$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t8)*/;
			}
			case 3:
			{
				return
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 129: System.Void System.Threading.TimedCondition::.ctor(System.Threading.Lock)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[126].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this..ctor(l)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					this[2] = null/*this._timeoutId = null*/
					this[3] = 0/*this._taskId = 0*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 130: System.Void System.Threading.ConditionTimedOutException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[21].call(this)/*this..ctor()*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 131: System.Void System.NotSupportedException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[24].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 132: System.Void System.NotSupportedException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[25].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this..ctor(message)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 133: System.Void System.NotSupportedException::.ctor(System.String,System.Exception)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[26].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],__f__[4]])/*this..ctor(message, innerException)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 134: System.Void System.NotImplementedException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[21].call(this)/*this..ctor()*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 135: System.Void System.NotImplementedException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[22].call(this,__f__[3])/*this..ctor(message)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 136: System.Object System.ThreadAbortException::get_ExceptionState()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[4]/*V_0.1 = this._exceptionState*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 137: System.Void System.ThreadAbortException::.ctor(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[21].call(this)/*this..ctor()*/;
					this[4] = __f__[3]/*this._exceptionState = exceptionState*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 138: System.Void System.ThreadAbortException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[137].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,null])/*this..ctor(null)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 139: System.Void System.ArgumentException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[22].call(this,__f__[3])/*this..ctor(message)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 140: System.Int32 System.NativeNumber::GetHashCode()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return this/*this*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 141: System.String System.NativeNumber::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = this.toString()/*__rv__ = this.NativeToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 142: System.Void System.MulticastNotSupportedException::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					$[22].call(this,__f__[3])/*this..ctor(message)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 143: System.Void System.MulticastNotSupportedException::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[142].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,"Multicast not supported"])/*this..ctor("Multicast not supported")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //144: System.Void System.InvalidCastException::.ctor()
{
	$[21].call(this)/*this..ctor()*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 145: System.Int32 XaeiOS.Process.SIP::get_ID()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[5]/*V_0.1 = this._id*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 146: System.String XaeiOS.Process.SIP::get_Name()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[6]/*V_0.1 = this._name*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 147: System.Threading.ThreadCallback XaeiOS.Process.SIP::get_Callback()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[7]/*V_0.1 = this._callback*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 148: System.Void XaeiOS.Process.SIP::set_Callback(System.Threading.ThreadCallback)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[7] = __f__[3]/*this._callback = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 149: System.Void XaeiOS.Process.SIP::Start()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[168](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*XaeiOS.Process.SIPManager::RegisterSIP(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[0]/*$t2 = this._threads*/;
					__rv__ = $[161].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = $t2.get_Head()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*V_0.1 = __rv__*/;
					$[48].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*V_0.1.Start()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					this[3] = 1/*this._state = 1*/
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 150: System.Int32 XaeiOS.Process.SIP::GetHashCode()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[5]/*V_0.1 = this._id*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 151: System.String XaeiOS.Process.SIP::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = this[5]/*$t1 = this._id*/;
					r0 = this[6]/*$t4 = this._name*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,": ",r0])/*__rv__ = System.String::Concat($t1, ": ", $t4)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0)
// 152: System.Boolean XaeiOS.Process.SIP::Equals(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r1 = (!($[6](__f__[3],_[127],false) == null))/*V_2.1 = BooleanNot o is XaeiOS.Process.SIP ValueEquality null*/;
					if(r1)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					r0 = 0/*V_1.1 = 0*/
					__ep__ = 4;
					continue __ctrl__;
				}
				case 3:
				{
					r2 = $[6](__f__[3],_[127],false)[5]/*$t9 = o is XaeiOS.Process.SIP._id*/
					r1 = this[5]/*$t11 = this._id*/;
					r0 = (r2 == r1)/*V_1.2 = $t9 ValueEquality $t11*/;
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					return r0/*V_1.3*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 153: System.Void XaeiOS.Process.SIP::InitializeThread(System.Threading.Thread)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r2 = {$:_[255],0:null,1:null}/*$t0 = new System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::.ctor()()*/;
					$[251].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2[1] = __f__[3]/*$t0.thread = thread*/;
					r2[0] = this/*$t0.<>4__this = this*/;
					r0 = this[0]/*$t4 = this._threads*/;
					r1 = r2[1]/*$t5 = $t0.thread*/;
					$[163].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t4.Add($t5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = r2[1]/*$t6 = $t0.thread*/;
					r1 = {$:_[23],0:null,1:null,2:null,3:null}/*$t8 = new System.Void System.Threading.ThreadCallback::.ctor(System.Object,System.IntPtr)($t0, XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0)*/;
					$[69](r1,r2,$[250])/*$t8..ctor($t0, XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[43].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t6.set_Callback($t8)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 154: System.Void XaeiOS.Process.SIP::ThreadExited(System.Threading.Thread)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[41].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = thread.get_UnhandledException()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t1 = __rv__*/
					r0 = (r0 == null)/*V_0.1 = $t1 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 4
					r1 = new Array(4)/*V_1.1 = new System.Object[4]*/;
					r1[0] = "An unhandled exception occurred in thread "/*V_1.1[0] = "An unhandled exception occurred in thread "*/;
					r1[1] = __f__[3]/*V_1.1[1] = thread*/;
					r1[2] = ": "/*V_1.1[2] = ": "*/;
					__rv__ = $[41].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = thread.get_UnhandledException()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t15 = __rv__*/;
					r1[3] = r0/*V_1.1[3] = $t15*/;
					__rv__ = $[208](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t16 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t16)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Thread ",__f__[3]," exited"])/*__rv__ = System.String::Concat("Thread ", thread, " exited")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = __rv__/*$t20 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t20)*/;
					r0 = this[4]/*$t22 = this._exitLock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t22.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r0 = this[0]/*$t24 = this._threads*/;
					$[164].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*$t24.Remove(thread)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					$[156].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*this.TryExit()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r0 = this[4]/*$t28 = this._exitLock*/;
					$[107].call(r0)/*$t28.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 155: System.Void XaeiOS.Process.SIP::ChildExited(XaeiOS.Process.SIP)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[4]/*$t1 = this._exitLock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[2]/*$t3 = this._children*/;
					$[164].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*$t3.Remove(child)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[156].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this.TryExit()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[4]/*$t7 = this._exitLock*/;
					$[107].call(r0)/*$t7.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 156: System.Void XaeiOS.Process.SIP::TryExit()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Process ",this," trying to exit"])/*__rv__ = System.String::Concat("Process ", this, " trying to exit")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t3 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t3)*/;
					r0 = this[0]/*$t5 = this._threads*/;
					__rv__ = $[162].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t5.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t6 = __rv__*/
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[2]/*$t8 = this._children*/;
					__rv__ = $[162].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t8.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = __rv__/*$t9 = __rv__*/
					r0 = (!(r0 == 0))/*$ts0 = BooleanNot $t9 ValueEquality 0*/;
					__ep__ = 7;
					continue __ctrl__;
				}
				case 6:
				{
					r0 = 1/*$ts0 = 1*/
					__ep__ = 7;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					r0 = r0/*V_0.1 = $ts0*/
					if(r0)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 8
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 8:
				{
					__ep__ = 9
					$[157].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*this.Exit()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 157: System.Void XaeiOS.Process.SIP::Exit()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Process ",this," exiting"])/*__rv__ = System.String::Concat("Process ", this, " exiting")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t3 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t3)*/;
					this[3] = 2/*this._state = 2*/;
					$[169](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*XaeiOS.Process.SIPManager::UnregisterSIP(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					this[3] = 3/*this._state = 3*/
					r0 = this[7]/*$t10 = this._callback*/;
					r0 = (r0 == null)/*V_0.1 = $t10 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Executing process ",this," callback"])/*__rv__ = System.String::Concat("Executing process ", this, " callback")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t17 = __rv__*/;
					console.log(r0)/*System.Diagnostics.Logging::Log($t17)*/;
					r0 = this[7]/*$t19 = this._callback*/;
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t19.Invoke()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 158: XaeiOS.Process.SIP XaeiOS.Process.SIP::get_CurrentSIP()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = $[115]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
					r0 = r0[1]/*V_0.1 = $t0._sip*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 159: System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[128],0:null,1:null,2:null,3:0}/*$t1 = new System.Void XaeiOS.Process.DoublyLinkedList`1<System.Threading.Thread>::.ctor()()*/;
					$[165].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					this[0] = r0/*this._threads = $t1*/;
					r0 = {$:_[128],0:null,1:null,2:null,3:0}/*$t3 = new System.Void XaeiOS.Process.DoublyLinkedList`1<XaeiOS.Process.SIP>::.ctor()()*/;
					$[165].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t3..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					this[2] = r0/*this._children = $t3*/;
					this[3] = 0/*this._state = 0*/;
					r0 = {$:_[79],0:0,1:null}/*$t7 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[108].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t7..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					this[4] = r0/*this._exitLock = $t7*/;
					this[5] = -1/*this._id = -1*/;
					r0 = {$:_[20],0:0,1:null,2:null,3:null,4:0,5:0,6:0,7:null,8:null,9:null,10:null,11:null,12:0}/*$t13 = new System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority)(threadStart, priority)*/;
					$[62].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4]])/*$t13..ctor(threadStart, priority)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[45].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[5]])/*$t13.set_Name(name)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0[1] = this/*$t13._sip = this*/;
					this[6] = __f__[5]/*this._name = name*/;
					$[153].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*this.InitializeThread($t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 160: System.Void XaeiOS.Process.SIP::.ctor(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[128],0:null,1:null,2:null,3:0}/*$t1 = new System.Void XaeiOS.Process.DoublyLinkedList`1<System.Threading.Thread>::.ctor()()*/;
					$[165].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					this[0] = r0/*this._threads = $t1*/;
					r0 = {$:_[128],0:null,1:null,2:null,3:0}/*$t3 = new System.Void XaeiOS.Process.DoublyLinkedList`1<XaeiOS.Process.SIP>::.ctor()()*/;
					$[165].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t3..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					this[2] = r0/*this._children = $t3*/;
					this[3] = 0/*this._state = 0*/;
					r0 = {$:_[79],0:0,1:null}/*$t7 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[108].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t7..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					this[4] = r0/*this._exitLock = $t7*/
					this[5] = -1/*this._id = -1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0)
// 161: T XaeiOS.Process.DoublyLinkedList`1::get_Head()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r1 = this[0]/*$t1 = this._head*/;
					r1 = (!(r1 == null))/*V_1.1 = BooleanNot $t1 ValueEquality null*/;
					if(r1)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					/*XaeiO.Compiler.CodeModel.ObjectInitializeExpression*/
					r0 = r2/*V_0.1 = V_2*/;
					__ep__ = 4;
					continue __ctrl__;
				}
				case 3:
				{
					r1 = this[0]/*$t9 = this._head*/
					r0 = r1[0]/*V_0.2 = $t9.Data*/;
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					return r0/*V_0.3*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 162: System.Int32 XaeiOS.Process.DoublyLinkedList`1::get_Count()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[2]/*$t1 = this._lock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = this[3]/*V_0.1 = this._count*/;
					r0 = this[2]/*$t5 = this._lock*/;
					$[107].call(r0)/*$t5.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					return r1/*V_0.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 163: System.Void XaeiOS.Process.DoublyLinkedList`1::Add(T)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[2]/*$t1 = this._lock*/;
					$[105].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = this[0]/*$t3 = this._head*/
					r0 = (!(r0 == null))/*V_1.1 = BooleanNot $t3 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = {$:_[129],0:false,1:null,2:null}/*$t10 = new System.Void XaeiOS.Process.DoublyLinkedListItem`1<T>::.ctor()()*/;
					$[166].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t10..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0[0] = __f__[3]/*$t10.Data = item*/
					this[1] = r0/*this._tail = $t10*/;
					this[0] = r0/*this._head = $t10*/;
					__ep__ = 7;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					r1 = {$:_[129],0:false,1:null,2:null}/*$t22 = new System.Void XaeiOS.Process.DoublyLinkedListItem`1<T>::.ctor()()*/;
					$[166].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t22..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r1[0] = __f__[3]/*$t22.Data = item*/
					r0 = this[1]/*$t25 = this._tail*/;
					r0[2] = r1/*$t25.Next = $t22*/;
					r0 = this[1]/*$t27 = this._tail*/;
					r1[1] = r0/*$t22.Previous = $t27*/;
					this[1] = r1/*this._tail = $t22*/;
					__ep__ = 7;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = this[3]/*$t17 = this._count*/;
					this[3] = (r0 + 1)/*this._count = $t17 Add 1*/;
					r0 = this[2]/*$t21 = this._lock*/;
					$[107].call(r0)/*$t21.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3)
// 164: System.Void XaeiOS.Process.DoublyLinkedList`1::Remove(T)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = this[2]/*$t1 = this._lock*/;
					$[105].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = this[0]/*V_0.1 = this._head*/
					__ep__ = 3;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r1 = (!(r0 == null))/*V_3.1 = BooleanNot V_0.3 ValueEquality null*/
					if(r1)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 5
					r1 = this[2]/*$t11 = this._lock*/;
					$[107].call(r1)/*$t11.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r1 = {$:_[120],0:null,1:null,2:null,3:null}/*$t13 = new System.Void System.ArgumentException::.ctor(System.String)("Item is not in the list")*/;
					$[139].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0,"Item is not in the list"])/*$t13..ctor("Item is not in the list")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					throw r1/*$t13*/
				}
				case 7:
				{
					__ep__ = 8
					r1 = r0[0]/*$t14 = V_0.3.Data*/;
					__rv__ = r1.$[2].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0,__f__[3]])/*__rv__ = $t14.Equals(item)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r1 = __rv__/*$t16 = __rv__*/
					r1 = (!r1)/*V_3.2 = BooleanNot $t16*/;
					if(r1)
					{
						__ep__ = 17;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 9
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 9:
				{
					r2 = r0[1]/*V_1.1 = V_0.3.Previous*/
					r3 = r0[2]/*V_2.1 = V_0.3.Next*/;
					r1 = (!(r2 == null))/*V_3.3 = BooleanNot V_1.1 ValueEquality null*/;
					if(r1)
					{
						__ep__ = 11;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 10
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 10:
				{
					this[0] = r3/*this._head = V_2.1*/
					__ep__ = 12;
					continue __ctrl__;
				}
				case 11:
				{
					r2[2] = r3/*V_1.1.Next = V_2.1*/
					__ep__ = 12;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					r1 = (!(r3 == null))/*V_3.4 = BooleanNot V_2.1 ValueEquality null*/
					if(r1)
					{
						__ep__ = 14;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 13
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 13:
				{
					this[1] = r2/*this._tail = V_1.1*/
					__ep__ = 15;
					continue __ctrl__;
				}
				case 14:
				{
					r3[1] = r2/*V_2.1.Previous = V_1.1*/
					__ep__ = 15;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					__ep__ = 16
					r1 = this[3]/*$t38 = this._count*/;
					this[3] = (r1 - 1)/*this._count = $t38 Subtract 1*/;
					r1 = this[2]/*$t42 = this._lock*/;
					$[107].call(r1)/*$t42.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					return
				}
				case 17:
				{
					r0 = r0[2]/*V_0.2 = V_0.3.Next*/
					__ep__ = 3;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 165: System.Void XaeiOS.Process.DoublyLinkedList`1::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					this[3] = 0/*this._count = 0*/;
					this[1] = null/*this._tail = null*/;
					this[0] = null/*this._head = null*/;
					r0 = {$:_[79],0:0,1:null}/*$t8 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[108].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t8..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					this[2] = r0/*this._lock = $t8*/
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 166: System.Void XaeiOS.Process.DoublyLinkedListItem`1::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 167: System.Void XaeiOS.Process.SIPManager::Initialize()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[71],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,XaeiOS.Process.SIP>::.ctor()()*/;
					$[97].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					_[131] = r0/*XaeiOS.Process.SIPManager._sips = $t0*/
					_[132] = 0/*XaeiOS.Process.SIPManager._pidCounter = 0*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 168: System.Void XaeiOS.Process.SIPManager::RegisterSIP(XaeiOS.Process.SIP)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t1 = __rv__*/
					r0 = (r0 == -1)/*V_1.1 = $t1 ValueEquality -1*/;
					if(r0)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t6 = new System.Void System.ArgumentException::.ctor(System.String)("SIP is already registered.")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"SIP is already registered."])/*$t6..ctor("SIP is already registered.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					throw r0/*$t6*/
				}
				case 5:
				{
					__ep__ = 6
					r1 = $[170]()/*V_0.1 = XaeiOS.Process.SIPManager::GetPID()*/;
					__f__[3][5] = r1/*sip._id = V_0.1*/;
					r0 = _[131]/*$t9 = XaeiOS.Process.SIPManager._sips*/;
					r0.$[5].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,__f__[3]])/*$t9.set_Item(V_0.1, sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[30](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*System.Resources.ResourceManager::RegisterSIP(sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 169: System.Void XaeiOS.Process.SIPManager::UnregisterSIP(XaeiOS.Process.SIP)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[31](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*System.Resources.ResourceManager::CleanupAndUnregisterSIP(sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = _[131]/*$t1 = XaeiOS.Process.SIPManager._sips*/;
					__rv__ = $[145].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = sip.get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r1 = __rv__/*$t3 = __rv__*/;
					r0.$[9].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*$t1.Remove($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //170: System.Int32 XaeiOS.Process.SIPManager::GetPID()
{
	var r0;
	r0 = _[132]/*$tf1 = XaeiOS.Process.SIPManager._pidCounter*/;
	_[132] = (r0 + 1)/*XaeiOS.Process.SIPManager._pidCounter = $tf1 Add 1*/;
	return r0/*$tf1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 171: System.NativeObject XaeiOS.Process.ImageFormat.ObjectImage::GetMetadata()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[1]/*$t1 = this.Header*/;
					r0 = r0["Metadata"]/*V_0.1 = $t1.get_Item("Metadata")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*V_0.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 172: System.NativeArray XaeiOS.Process.ImageFormat.ObjectImage::GetFixups()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[1]/*$t1 = this.Header*/;
					r0 = r0["Fixups"]/*V_0.1 = $t1.get_Item("Fixups")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*V_0.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 173: System.Void XaeiOS.Process.ImageFormat.ObjectImage::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 174: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Name()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[0]/*V_0.1 = this._name*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 175: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Name(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = __f__[3]/*this._name = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 176: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Version()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[1]/*V_0.1 = this._version*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 177: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Version(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[1] = __f__[3]/*this._version = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 178: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Culture()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[2]/*V_0.1 = this._culture*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 179: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Culture(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[2] = __f__[3]/*this._culture = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 180: System.Void XaeiOS.Process.ImageFormat.AssemblyName::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*message*/)
 //181: System.Void System.ExecutionEngineException::.ctor(System.String)
{
	var r0;
	r0 = ("ExecutionEngineException: " + a0)/*$t3 = System.String::Concat("ExecutionEngineException: ", message)*/;
	$[22].call(this,r0)/*this..ctor($t3)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 182: T System.Collections.Generic.List`1::get_Item(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = (__f__[3] < 0)/*$t2 = index LessThan 0*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					__rv__ = this.$[9].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t5 = __rv__*/
					r0 = (__f__[3] < r0)/*$ts0 = index LessThan $t5*/;
					__ep__ = 5;
					continue __ctrl__;
				}
				case 4:
				{
					r0 = 0/*$ts0 = 0*/
					__ep__ = 5;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = r0/*V_1.1 = $ts0*/
					if(r0)
					{
						__ep__ = 6;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 8
						continue __ctrl__;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[0]/*$t11 = this._array*/;
					r0 = r0[__f__[3]]/*V_0.1 = $t11.get_Item(index)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return r0/*V_0.1*/
				}
				case 8:
				{
					__ep__ = 9
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Argument out of range")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Argument out of range"])/*$t9..ctor("Argument out of range")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					throw r0/*$t9*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 183: System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = (__f__[3] < 0)/*$t2 = index LessThan 0*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					__rv__ = this.$[9].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t5 = __rv__*/
					r0 = (__f__[3] < r0)/*$ts0 = index LessThan $t5*/;
					__ep__ = 5;
					continue __ctrl__;
				}
				case 4:
				{
					r0 = 0/*$ts0 = 0*/
					__ep__ = 5;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = r0/*V_0.1 = $ts0*/
					if(r0)
					{
						__ep__ = 6;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 8
						continue __ctrl__;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[0]/*$t11 = this._array*/;
					r0[__f__[3]] = __f__[4]/*$t11.set_Item(index, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					return
				}
				case 8:
				{
					__ep__ = 9
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Argument out of range")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Argument out of range"])/*$t9..ctor("Argument out of range")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					throw r0/*$t9*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 184: System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = this.$[3].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*__rv__ = this.get_Item(index)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 185: System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					this.$[4].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],__f__[4]])/*this.set_Item(index, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 186: System.Void System.Collections.Generic.List`1::Add(T)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._array*/;
					r1 = this[1]/*$tf5 = this._count*/;
					this[1] = (r1 + 1)/*this._count = $tf5 Add 1*/;
					r0[r1] = __f__[3]/*$t1.set_Item($tf5, item)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 187: System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					this.$[7].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this.Add(item)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 188: System.Int32 System.Collections.Generic.List`1::get_Count()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[1]/*V_0.1 = this._count*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 189: System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[138],0:0,1:null}/*$t1 = new System.Void System.Collections.Generic.List`1/Enumerator<T>::.ctor(System.Collections.Generic.List`1<T>)(this)*/;
					$[197].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 190: System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[138],0:0,1:null}/*$t1 = new System.Void System.Collections.Generic.List`1/Enumerator<T>::.ctor(System.Collections.Generic.List`1<T>)(this)*/;
					$[197].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 191: System.Void System.Collections.Generic.List`1::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = new Array()/*$t1 = new System.Void System.NativeArray`1<K>::.ctor()()*/;
					this[0] = r0/*this._array = $t1*/;
					this[1] = 0/*this._count = 0*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 192: T System.Collections.Generic.List`1/Enumerator::get_Current()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[1]/*$t1 = this._list*/;
					r1 = this[0]/*$t3 = this._currentIndex*/;
					__rv__ = r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = $t1.get_Item($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 193: System.Object System.Collections.Generic.List`1/Enumerator::System.Collections.IEnumerator.get_Current()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[192].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = this.get_Current()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 194: System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = this[0]/*$t2 = this._currentIndex*/;
					this[0] = (r1 + 1)/*this._currentIndex = $t2 Add 1*/;
					r0 = this[1]/*$t7 = this._list*/;
					__rv__ = r0.$[9].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t7.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t8 = __rv__*/
					return ((r1 + 1) < r0)/*$t2 Add 1 LessThan $t8*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 195: System.Void System.Collections.Generic.List`1/Enumerator::Reset()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = -1/*this._currentIndex = -1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 196: System.Void System.Collections.Generic.List`1/Enumerator::Dispose()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[1] = null/*this._list = null*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 197: System.Void System.Collections.Generic.List`1/Enumerator::.ctor(System.Collections.Generic.List`1<T>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[1] = __f__[3]/*this._list = list*/;
					this[0] = -1/*this._currentIndex = -1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 198: System.Void System.Collections.ArrayList::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[191].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //199: System.String System.String::get_Empty()
{
	var r0;
	r0 = _[141]/*V_0.1 = System.String._empty*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 200: System.Void System.String::Initialize()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					_[141] = ""/*System.String._empty = ""*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 201: System.String[] System.String::Split(System.Char[])
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = (!(__f__[3].length > 1))/*V_1.1 = BooleanNot (System.Int32)separator.Length GreaterThan 1*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t9..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t9*/
				}
				case 4:
				{
					__ep__ = 5
					__rv__ = __f__[3][0].$[0].call(__f__[3][0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = separator[0].ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = __rv__/*$t14 = __rv__*/
					r0 = this.split(r0)/*V_0.1 = this.Split($t14)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*prefix*/)
 //202: System.Boolean System.String::StartsWith(System.String)
{
	var r1,r2,r0;
	r2 = a0.length/*$t1 = prefix.get_Length()*/;
	r1 = this.length/*$t3 = this.get_Length()*/;
	r1 = (!(r2 > r1))/*V_1.1 = BooleanNot $t1 GreaterThan $t3*/;
	if(r1)
	{
		r1 = a0.length/*$t13 = prefix.get_Length()*/;
		r1 = this.substr(0,r1)/*$t14 = this.Substr(0, $t13)*/;
		r0 = (r1 == a0)/*V_0.2 = System.String::op_Equality($t14, prefix)*/;

	}
	else
	{
		r0 = 0/*V_0.1 = 0*/

	}
	return r0/*V_0.3*/;

},
function(a0/*suffix*/)
 //203: System.Boolean System.String::EndsWith(System.String)
{
	var r0;
	r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.Exception::.ctor(System.String)("Not yet implemented")*/;
	$[22].call(r0,"Not yet implemented")/*$t1..ctor("Not yet implemented")*/;
	throw r0/*$t1*/;

},
function()
 //204: System.String System.String::ToString()
{
	return this/*this*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 205: System.String System.String::Concat(System.Object,System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[0].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = obj0.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t1 = __rv__*/;
					__rv__ = __f__[4].$[0].call(__f__[4],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = obj1.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t3 = __rv__*/
					r0 = (r1 + r0)/*V_0.1 = System.String::Concat($t1, $t3)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 206: System.String System.String::Concat(System.Object,System.Object,System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[0].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = obj0.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*$t1 = __rv__*/;
					__rv__ = __f__[4].$[0].call(__f__[4],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = obj1.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r1 = __rv__/*$t3 = __rv__*/;
					__rv__ = __f__[5].$[0].call(__f__[5],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = obj2.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0 = __rv__/*$t5 = __rv__*/
					r0 = (r2 + r1 + r0)/*V_0.1 = System.String::Concat($t1, $t3, $t5)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3)
// 207: System.String System.String::Concat(System.Object,System.Object,System.Object,System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[0].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*__rv__ = obj0.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r3 = __rv__/*$t1 = __rv__*/;
					__rv__ = __f__[4].$[0].call(__f__[4],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*__rv__ = obj1.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r2 = __rv__/*$t3 = __rv__*/;
					__rv__ = __f__[5].$[0].call(__f__[5],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*__rv__ = obj2.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r1 = __rv__/*$t5 = __rv__*/;
					__rv__ = __f__[6].$[0].call(__f__[6],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*__rv__ = obj3.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = __rv__/*$t7 = __rv__*/
					r0 = [r3, r2, r1, r0].join('')/*V_0.1 = System.String::Concat($t1, $t3, $t5, $t7)*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 208: System.String System.String::Concat(System.Object[])
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r2 = new Array(__f__[3].length)/*V_0.1 = new System.String[(System.Int32)objs.Length]*/;
					r0 = 0/*V_1.1 = 0*/;
					__ep__ = 2;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r1 = (r0 < __f__[3].length)/*V_3.1 = V_1.3 LessThan (System.Int32)objs.Length*/
					if(r1)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					r1 = r2.join('')/*V_2.1 = System.String::Concat(V_0.1)*/
					return r1/*V_2.1*/;
				}
				case 4:
				{
					__ep__ = 5
					__rv__ = __f__[3][r0].$[0].call(__f__[3][r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = objs[V_1.3].ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r1 = __rv__/*$t13 = __rv__*/
					r2[r0] = r1/*V_0.1[V_1.3] = $t13*/;
					r0 = (r0 + 1)/*V_1.2 = V_1.3 Add 1*/;
					__ep__ = 2;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 209: System.Int32 System.String::Compare(System.String,System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 210: System.Void System.String::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 211: System.Void XaeiOS.Process.DynamicLinker::Initialize()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = _[149]/*$t0 = XaeiOS.Process.DynamicLinker._initialized*/;
					r0 = (!r0)/*V_0.1 = BooleanNot $t0*/;
					if(r0)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					r0 = new Error("DynamicLinker is already initialized")/*$t5 = new System.Void System.NativeError::.ctor(System.String)("DynamicLinker is already initialized")*/
					throw r0/*$t5*/;
				}
				case 3:
				{
					r0 = _[150]/*$t6 = XaeiOS.Process.DynamicLinker._initializing*/
					r0 = (!r0)/*V_0.2 = BooleanNot $t6*/;
					if(r0)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					r0 = new Error("DynamicLinker is already initializing")/*$t11 = new System.Void System.NativeError::.ctor(System.String)("DynamicLinker is already initializing")*/
					throw r0/*$t11*/;
				}
				case 5:
				{
					_[150] = 1/*XaeiOS.Process.DynamicLinker._initializing = 1*/
					_[151] = null/*XaeiOS.Process.DynamicLinker._osCorlibObjectImageData = null*/;
					_[149] = 1/*XaeiOS.Process.DynamicLinker._initialized = 1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 212: XaeiOS.Process.ImageFormat.AssemblyName XaeiOS.Process.DynamicLinker::LoadObjectImage(System.String)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[13],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.Exception::.ctor(System.String)("Not yet implemented")*/;
					$[22].call(r0,"Not yet implemented")/*$t1..ctor("Not yet implemented")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 213: System.Void XaeiOS.Process.DynamicLinker::SetEntryPointObjectImage(XaeiOS.Process.ImageFormat.AssemblyName)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = __f__[3]/*this._entryPointImage = entryPointImage*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 214: System.Void XaeiOS.Process.DynamicLinker::Link()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 215: System.Void XaeiOS.Process.DynamicLinker::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 216: System.String System.NativeError::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = this.toString()/*__rv__ = this.NativeToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //217: System.NativeObject System.Diagnostics.ObjectDebugger::GetSystemObjectVTable()
{
	var r0;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = _[158]/*$t0 = System.Diagnostics.ObjectDebugger._object*/;
				r0 = (!(r0 == null))/*V_1.1 = BooleanNot $t0 ValueEquality null*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				r0 = {$:_[0]}/*$t7 = new System.Void System.Object::.ctor()()*/
				_[158] = r0/*System.Diagnostics.ObjectDebugger._object = $t7*/;
				__ep__ = 3;
			}
			case 3:
			{
				r0 = _[158]/*$t10 = System.Diagnostics.ObjectDebugger._object*/
				r0 = r0["$"]/*V_0.1 = $t10.get_Item("$")*/;
				return r0/*V_0.1*/;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*obj*/)
 //218: System.NativeObject System.Diagnostics.ObjectDebugger::DebugObject(System.Object)
{
	var r0,r1;
	r1 = a0["$"]/*V_1.1 = obj.get_Item("$")*/;
	r0 = (!(r1 == null))/*V_3.1 = BooleanNot V_1.1 ValueEquality null*/;
	if(r0)
	{
		r0 = {$:_[159],0:0}/*$t14 = new System.Void System.Diagnostics.ObjectDebugger/IntRef::.ctor()()*/;
		$[220].call(r0)/*$t14..ctor()*/;
		r0 = $[219](a0,r1,r0)/*V_2.1 = System.Diagnostics.ObjectDebugger::BuildDebuggableObject(obj, V_1.1, $t14)*/;
		return r0/*V_2.1*/;

	}
	else
	{
		r0 = new Error("ObjectDebugger can only debug managed objects.")/*$t13 = new System.Void System.NativeError::.ctor(System.String)("ObjectDebugger can only debug managed objects.")*/
		throw r0/*$t13*/;

	}

},
function(a0/*nativeObject*/,a1/*vtable*/,a2/*fieldCounter*/)
 //219: System.NativeObject System.Diagnostics.ObjectDebugger::BuildDebuggableObject(System.NativeObject,System.NativeObject,System.Diagnostics.ObjectDebugger/IntRef)
{
	var r1,r2,r0,r3,r4;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r3 = new Object()/*$t0 = new System.Void System.NativeObject::.ctor()()*/;
				r1 = $[217]()/*$t2 = System.Diagnostics.ObjectDebugger::GetSystemObjectVTable()*/;
				r1 = (a1 == r1)/*V_5.1 = vtable ValueEquality $t2*/;
				if(r1)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 3
				r1 = a1["b"]/*$t10 = vtable.get_Item("b")*/;
				r1 = $[219](a0,r1,a2)/*$t13 = System.Diagnostics.ObjectDebugger::BuildDebuggableObject(nativeObject, $t10, fieldCounter)*/;
				r3["Base"] = r1/*$t0.set_Item("Base", $t13)*/;
			}
			case 3:
			{
				r2 = a1["d"]/*V_1.1 = vtable.get_Item("d")*/
				r1 = r2["FullName"]/*$t20 = V_1.1.get_Item("FullName")*/;
				r3["FullName"] = r1/*$t0.set_Item("FullName", $t20)*/;
				r4 = r2["Fields"]/*V_2.1 = V_1.1.get_Item("Fields")*/;
				r0 = 0/*V_3.1 = 0*/;
				__ep__ = 4;
			}
			case 4:
			{
				r1 = r4.length/*$t25 = V_2.1.get_Length()*/
				r1 = (r0 < r1)/*V_5.2 = V_3.3 LessThan $t25*/;
				if(r1)
				{
					__ep__ = 6;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 5

				}
			}
			case 5:
			{
				r2 = a2[0]/*$t30 = fieldCounter.Value*/
				r1 = r4.length/*$t31 = V_2.1.get_Length()*/;
				a2[0] = (r2 + r1)/*fieldCounter.Value = $t30 Add $t31*/;
				return r3/*$t0*/;
			}
			case 6:
			{
				r2 = r4[r0]/*$t34 = V_2.1.get_Item(V_3.3)*/
				r1 = a2[0]/*$t37 = fieldCounter.Value*/;
				r1 = a0[(r1 + r0)]/*$t40 = nativeObject.get_Item($t37 Add V_3.3)*/;
				r3[r2] = r1/*$t0.set_Item($t34, $t40)*/;
				r0 = (r0 + 1)/*V_3.2 = V_3.3 Add 1*/;
				__ep__ = 4;
				continue __ctrl__;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function()
 //220: System.Void System.Diagnostics.ObjectDebugger/IntRef::.ctor()
{
	this[0] = 0/*this.Value = 0*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 221: System.Int32 System.Collections.Queue::get_Count()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._internalArray*/;
					r0 = r0.length/*V_0.1 = $t1.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*V_0.1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 222: System.Boolean System.Collections.Queue::get_IsSynchronized()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[1]/*V_0.1 = this.<IsSynchronized>k__BackingField*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 223: System.Void System.Collections.Queue::set_IsSynchronized(System.Boolean)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[1] = __f__[3]/*this.<IsSynchronized>k__BackingField = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 224: System.Object System.Collections.Queue::get_SyncRoot()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[2]/*V_0.1 = this.<SyncRoot>k__BackingField*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 225: System.Void System.Collections.Queue::set_SyncRoot(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[2] = __f__[3]/*this.<SyncRoot>k__BackingField = value*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 226: System.Void System.Collections.Queue::Clear()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = new Array()/*$t1 = new System.Void System.NativeArray`1<System.Object>::.ctor()()*/;
					this[0] = r0/*this._internalArray = $t1*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 227: System.Object System.Collections.Queue::Clone()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[160],0:null,1:0,2:null}/*$t1 = new System.Void System.Collections.Queue::.ctor(System.Collections.ICollection)(this)*/;
					$[238].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1)
// 228: System.Boolean System.Collections.Queue::Contains(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = 0/*V_0.1 = 0*/;
					__ep__ = 2;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = this[0]/*$t2 = this._internalArray*/;
					r2 = r2.length/*$t3 = $t2.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r2 = (r0 < r2)/*V_2.1 = V_0.3 LessThan $t3*/
					if(r2)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					r1 = 0/*V_1.1 = 0*/
					__ep__ = 9;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					r2 = this[0]/*$t8 = this._internalArray*/;
					r2 = r2[r0]/*$t10 = $t8.get_Item(V_0.3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = r2.$[2].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1],[null,null,0,__f__[3]])/*__rv__ = $t10.Equals(obj)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					r2 = __rv__/*$t12 = __rv__*/
					r2 = (!r2)/*V_2.2 = BooleanNot $t12*/;
					if(r2)
					{
						__ep__ = 10;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 8
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 8:
				{
					r1 = 1/*V_1.2 = 1*/
					__ep__ = 9;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					return r1/*V_1.3*/
				}
				case 10:
				{
					r0 = (r0 + 1)/*V_0.2 = V_0.3 Add 1*/
					__ep__ = 2;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 229: System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 230: System.Object System.Collections.Queue::Dequeue()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._internalArray*/;
					__rv__ = r0.shift()/*__rv__ = $t1.Shift()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 231: System.Void System.Collections.Queue::Enqueue(System.Object)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this._internalArray*/;
					r0.push(__f__[3])/*$t1.Push(obj)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 232: System.Collections.IEnumerator System.Collections.Queue::GetEnumerator()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0)
// 233: System.Object System.Collections.Queue::Peek()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = this.$[3].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0])/*__rv__ = this.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r1 = __rv__/*$t1 = __rv__*/
					r1 = (!(r1 > 0))/*V_1.1 = BooleanNot $t1 GreaterThan 0*/;
					if(r1)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 5
					r1 = this[0]/*$t9 = this._internalArray*/;
					r0 = r1[0]/*V_0.1 = $t9.get_Item(0)*/;
					continue __ctrl__;
				}
				case 4:
				{
					r0 = null/*V_0.2 = null*/
					__ep__ = 5;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					return r0/*V_0.3*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 234: System.Collections.Queue System.Collections.Queue::Synchronized(System.Collections.Queue)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 235: System.Object[] System.Collections.Queue::ToArray()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 236: System.Void System.Collections.Queue::TrimToSize()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 237: System.Void System.Collections.Queue::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = new Array()/*$t2 = new System.Void System.NativeArray`1<System.Object>::.ctor()()*/;
					this[0] = r0/*this._internalArray = $t2*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 238: System.Void System.Collections.Queue::.ctor(System.Collections.ICollection)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[237].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function()
 //239: System.Void XaeiOS.OSCorlib::Initialize()
{
	var r0;
	r0 = _[182]/*$t0 = XaeiOS.OSCorlib._initializing*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t0*/;
	if(r0)
	{
		r0 = _[181]/*$t6 = XaeiOS.OSCorlib._initialized*/;
		r0 = (!r0)/*V_0.2 = BooleanNot $t6*/;
		if(r0)
		{
			_[182] = 1/*XaeiOS.OSCorlib._initializing = 1*/;
			$[200](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*System.String::Initialize()*/;
			$[3](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*System.ObjectHelper::Initialize()*/;
			$[118]()/*System.Threading.ThreadManager::Initialize()*/;
			$[167](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*XaeiOS.Process.SIPManager::Initialize()*/;
			$[211](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*XaeiOS.Process.DynamicLinker::Initialize()*/;
			$[29]()/*System.Resources.ResourceManager::Initialize()*/;
			_[181] = 1/*XaeiOS.OSCorlib._initialized = 1*/;
			return;

		}
		else
		{
			r0 = new Error("OSCorlib already initialized")/*$t11 = new System.Void System.NativeError::.ctor(System.String)("OSCorlib already initialized")*/
			throw r0/*$t11*/;

		}

	}
	else
	{
		r0 = new Error("OSCorlib already initializing")/*$t5 = new System.Void System.NativeError::.ctor(System.String)("OSCorlib already initializing")*/
		throw r0/*$t5*/;

	}

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 240: System.Void System.Threading.Semaphore::Acquire()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[241].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,1])/*this.Acquire(1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3)
// 241: System.Void System.Threading.Semaphore::Acquire(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__end__ = Number.POSITIVE_INFINITY;
	__ctrl__:
	while(true)
	{
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = new Array(5)/*V_2.1 = new System.Object[5]*/;
					r1[0] = "Task "/*V_2.1[0] = "Task "*/;
					__rv__ = $[306]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t5 = __rv__*/;
					r1[1] = r0/*V_2.1[1] = $t5*/;
					r1[2] = " acquiring "/*V_2.1[2] = " acquiring "*/;
					r1[3] = __f__[3]/*V_2.1[3] = resources*/;
					r1[4] = " resources"/*V_2.1[4] = " resources"*/;
					__rv__ = $[208](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,r1])/*__rv__ = System.String::Concat(V_2.1)*/;
				}
				case 3:
				{
					r0 = __rv__/*$t12 = __rv__*/
					console.debug(r0)/*System.Diagnostics.Logging::Debug($t12)*/;
					r0 = (!(__f__[3] < 0))/*V_3.1 = BooleanNot resources LessThan 0*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t21 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot acquire a negative number of resources")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"Cannot acquire a negative number of resources"])/*$t21..ctor("Cannot acquire a negative number of resources")*/;
				}
				case 5:
				{
					throw r0/*$t21*/
				}
				case 6:
				{
					r1 = this[0]/*$t23 = this._resources*/
					r0 = (!((r1 - __f__[3]) < 0))/*V_3.2 = BooleanNot $t23 Subtract resources LessThan 0*/;
					if(r0)
					{
						__ep__ = 11;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 7

					}
				}
				case 7:
				{
					__ep__ = 8
					this[0] = 0/*this._resources = 0*/;
					__rv__ = $[306]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 8:
				{
					__ep__ = 9
					r3 = __rv__/*V_1.1 = __rv__*/;
					r0 = this[2]/*$t36 = this._waitingTasks*/;
					r2 = {$:_[250],0:0,1:0}/*$t38 = new System.Void System.Threading.Semaphore/WaitingTask::.ctor(System.Int32,System.Int32)(V_1.1, Negate $t23 Subtract resources)*/;
					$[245].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,r3,(-(r1 - __f__[3]))])/*$t38..ctor(V_1.1, Negate $t23 Subtract resources)*/;
				}
				case 9:
				{
					__ep__ = 10
					r0.push(r2)/*$t36.Push($t38)*/;
					$[302](r3)/*XaeiOS.SystemCalls::BlockTask(V_1.1)*/;
				}
				case 10:
				{
					__ep__ = 12
					$[304](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					continue __ctrl__;
				}
				case 11:
				{
					this[0] = (r1 - __f__[3])/*this._resources = $t23 Subtract resources*/
					__ep__ = 12;
				}
				case 12:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 242: System.Void System.Threading.Semaphore::Release()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					$[243].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,1])/*this.Release(1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 243: System.Void System.Threading.Semaphore::Release(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__end__ = Number.POSITIVE_INFINITY;
	__ctrl__:
	while(true)
	{
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = new Array(5)/*V_1.1 = new System.Object[5]*/;
					r1[0] = "Task "/*V_1.1[0] = "Task "*/;
					__rv__ = $[306]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t5 = __rv__*/;
					r1[1] = r0/*V_1.1[1] = $t5*/;
					r1[2] = " releasing "/*V_1.1[2] = " releasing "*/;
					r1[3] = __f__[3]/*V_1.1[3] = resources*/;
					r1[4] = " resources"/*V_1.1[4] = " resources"*/;
					__rv__ = $[208](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
				}
				case 3:
				{
					r0 = __rv__/*$t12 = __rv__*/
					console.debug(r0)/*System.Diagnostics.Logging::Debug($t12)*/;
					r0 = (!(__f__[3] < 0))/*V_2.1 = BooleanNot resources LessThan 0*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 4

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t21 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot release a negative number of resources")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Cannot release a negative number of resources"])/*$t21..ctor("Cannot release a negative number of resources")*/;
				}
				case 5:
				{
					throw r0/*$t21*/
				}
				case 6:
				{
					r1 = this[0]/*$t24 = this._resources*/
					r0 = this[1]/*$t27 = this._totalResources*/;
					r0 = (!((__f__[3] + r1) > r0))/*V_2.2 = BooleanNot resources Add $t24 GreaterThan $t27*/;
					if(r0)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 7

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t34 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot release more resources this semaphore holds")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Cannot release more resources this semaphore holds"])/*$t34..ctor("Cannot release more resources this semaphore holds")*/;
				}
				case 8:
				{
					throw r0/*$t34*/
				}
				case 9:
				{
					__ep__ = 10
					r0 = this[2]/*$t36 = this._waitingTasks*/;
					r0 = r0.length/*$t37 = $t36.get_Length()*/;
				}
				case 10:
				{
					r0 = (!(r0 > 0))/*V_2.3 = BooleanNot $t37 GreaterThan 0*/
					if(r0)
					{
						__ep__ = 18;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 11

					}
				}
				case 11:
				{
					__ep__ = 12
					r0 = this[2]/*$t45 = this._waitingTasks*/;
					r1 = r0[0]/*V_0.1 = $t45.get_Item(0)*/;
				}
				case 12:
				{
					r0 = r1[1]/*$t49 = V_0.1.Resources*/
					r0 = (r0 > __f__[3])/*V_2.4 = $t49 GreaterThan resources*/;
					if(r0)
					{
						__ep__ = 17;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 13

					}
				}
				case 13:
				{
					__ep__ = 14
					r0 = this[2]/*$t54 = this._waitingTasks*/;
					r0.shift()/*$t54.Shift()*/;
				}
				case 14:
				{
					__ep__ = 15
					r0 = r1[1]/*$t57 = V_0.1.Resources*/;
					__f__[3] = (__f__[3] - r0)/*resources = resources Subtract $t57*/;
					r0 = r1[0]/*$t59 = V_0.1.ID*/;
					$[301](r0)/*XaeiOS.SystemCalls::ScheduleTask($t59)*/;
				}
				case 15:
				{
					__ep__ = 16
					r0 = this[2]/*$t61 = this._waitingTasks*/;
					r0 = r0.length/*$t62 = $t61.get_Length()*/;
				}
				case 16:
				{
					r0 = (r0 > 0)/*V_2.5 = $t62 GreaterThan 0*/
					if(r0)
					{
						__ep__ = 11;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 19
						continue __ctrl__;

					}
				}
				case 17:
				{
					r0 = r1[1]/*$t67 = V_0.1.Resources*/
					r1[1] = (r0 - __f__[3])/*V_0.1.Resources = $t67 Subtract resources*/;
					__ep__ = 19;
					continue __ctrl__;
				}
				case 18:
				{
					r0 = this[0]/*$t72 = this._resources*/
					this[0] = (r0 + __f__[3])/*this._resources = $t72 Add resources*/;
					__ep__ = 19;
				}
				case 19:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 244: System.Void System.Threading.Semaphore::.ctor(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = (!(__f__[3] < 1))/*V_0.1 = BooleanNot resources LessThan 1*/;
					if(r0)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[120],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Must have at least 1 resource for a semaphore")*/;
					$[139].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Must have at least 1 resource for a semaphore"])/*$t9..ctor("Must have at least 1 resource for a semaphore")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t9*/
				}
				case 4:
				{
					this[0] = __f__[3]/*this._resources = resources*/
					this[1] = __f__[3]/*this._totalResources = resources*/;
					r0 = new Array()/*$t15 = new System.Void System.NativeArray`1<System.Threading.Semaphore/WaitingTask>::.ctor()()*/;
					this[2] = r0/*this._waitingTasks = $t15*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 245: System.Void System.Threading.Semaphore/WaitingTask::.ctor(System.Int32,System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					this[0] = __f__[3]/*this.ID = id*/;
					this[1] = __f__[4]/*this.Resources = resources*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 246: System.Void System.NativeArray`1::RemoveAt(System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = {$:_[117],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[134].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					throw r0/*$t0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 247: System.Void System.Array::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 248: System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t2 = this.initProcess*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Process ",r0," exited"])/*__rv__ = System.String::Concat("Process ", $t2, " exited")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					console.log(r0)/*System.Diagnostics.Logging::Log($t4)*/;
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 249: System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 250: System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r0 = this[0]/*$t1 = this.<>4__this*/;
					r1 = this[1]/*$t3 = this.thread*/;
					$[154].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*$t1.ThreadExited($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 251: System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


}

/************
Object image XaeiOS.Kernel - Code: 252	Data: 256
**********/

,function()
 //0: System.Void XaeiOS.Kernel.TaskPriorityQueue::Initialize()
{
	var r0;
	r0 = new Array()/*$t0 = new System.Void System.NativeArray`1<XaeiOS.Kernel.Task>::.ctor()()*/;
	_[257] = r0/*XaeiOS.Kernel.TaskPriorityQueue._heap = $t0*/;
	_[258] = 0/*XaeiOS.Kernel.TaskPriorityQueue._count = 0*/;
	return;

},
function(a0/*t*/)
 //1: System.Void XaeiOS.Kernel.TaskPriorityQueue::Add(XaeiOS.Kernel.Task)
{
	var r0;
	r0 = _[258]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	_[258] = (r0 + 1)/*XaeiOS.Kernel.TaskPriorityQueue._count = $t0 Add 1*/;
	r0 = _[258]/*$t3 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	$[256]((r0 - 1),a0)/*XaeiOS.Kernel.TaskPriorityQueue::BubbleUp($t3 Subtract 1, t)*/;
	return;

},
function()
 //2: XaeiOS.Kernel.Task XaeiOS.Kernel.TaskPriorityQueue::Remove()
{
	var r0,r1,r2;
	r0 = _[257]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
	r2 = r0[0]/*V_0.1 = $t0.get_Item(0)*/;
	r0 = _[258]/*$t4 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	_[258] = (r0 - 1)/*XaeiOS.Kernel.TaskPriorityQueue._count = $t4 Subtract 1*/;
	r0 = _[257]/*$t8 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
	r1 = _[258]/*$t10 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	r0 = r0[r1]/*$t11 = $t8.get_Item($t10)*/;
	$[255](0,r0)/*XaeiOS.Kernel.TaskPriorityQueue::TrickleDown(0, $t11)*/;
	return r2/*V_0.1*/;

},
function(a0/*index*/,a1/*t*/)
 //3: System.Void XaeiOS.Kernel.TaskPriorityQueue::TrickleDown(System.Int32,XaeiOS.Kernel.Task)
{
	var r1,r2,r0,r3;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = ((a0 * 2) + 1)/*V_0.1 = index Multiply 2 Add 1*/;
				__ep__ = 2;
			}
			case 2:
			{
				r1 = _[258]/*$t5 = XaeiOS.Kernel.TaskPriorityQueue._count*/
				r1 = (r0 < r1)/*V_1.1 = V_0.4 LessThan $t5*/;
				if(r1)
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				$[256](a0,a1)/*XaeiOS.Kernel.TaskPriorityQueue::BubbleUp(index, t)*/
				return;
			}
			case 4:
			{
				r1 = _[258]/*$t13 = XaeiOS.Kernel.TaskPriorityQueue._count*/
				r1 = ((r0 + 1) >= r1)/*$t14 = V_0.4 Add 1 GreaterThanOrEqual $t13*/;
				if(r1)
				{
					__ep__ = 6;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 5

				}
			}
			case 5:
			{
				r1 = _[257]/*$t15 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1 = r1[r0]/*$t17 = $t15.get_Item(V_0.4)*/;
				r2 = r1[5]/*$t18 = $t17.Priority*/;
				r1 = _[257]/*$t19 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = r1[(r0 + 1)]/*$t23 = $t19.get_Item(V_0.4 Add 1)*/;
				r1 = r1[5]/*$t24 = $t23.Priority*/;
				r1 = (!(r2 < r1))/*$ts0 = BooleanNot $t18 LessThan $t24*/;
				__ep__ = 7;
				continue __ctrl__;
			}
			case 6:
			{
				r1 = 1/*$ts0 = 1*/
				__ep__ = 7;
			}
			case 7:
			{
				r1 = r1/*V_1.2 = $ts0*/
				if(r1)
				{
					__ep__ = 9;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 8

				}
			}
			case 8:
			{
				r0 = (r0 + 1)/*V_0.2 = V_0.4 Add 1*/
				__ep__ = 9;
			}
			case 9:
			{
				r2 = _[257]/*$t32 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1 = _[257]/*$t35 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = r1[r0]/*$t37 = $t35.get_Item(V_0.5)*/;
				r2[a0] = r1/*$t32.set_Item(index, $t37)*/;
				a0 = r0/*index = V_0.5*/;
				r0 = ((a0 * 2) + 1)/*V_0.3 = index Multiply 2 Add 1*/;
				__ep__ = 2;
				continue __ctrl__;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*index*/,a1/*t*/)
 //4: System.Void XaeiOS.Kernel.TaskPriorityQueue::BubbleUp(System.NativeNumber,XaeiOS.Kernel.Task)
{
	var r1,r2,r0,r3;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				__ep__ = 2;
				__rv__ = Math.floor(((a0 - 1) / 2))/*__rv__ = System.Math::Floor(index Subtract 1 Divide 2)*/;
			}
			case 2:
			{
				r0 = __rv__/*V_0.1 = __rv__*/
				r1 = (a0 > 0)/*$t8 = index GreaterThan 0*/;
				if((!r1))
				{
					__ep__ = 4;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 3

				}
			}
			case 3:
			{
				r1 = _[257]/*$t9 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1 = r1[r0]/*$t10 = $t9.get_Item(V_0.3)*/;
				r2 = r1[5]/*$t11 = $t10.Priority*/;
				r1 = a1[5]/*$t13 = t.Priority*/;
				r1 = (r2 < r1)/*$ts0 = $t11 LessThan $t13*/;
				__ep__ = 5;
				continue __ctrl__;
			}
			case 4:
			{
				r1 = 0/*$ts0 = 0*/
				__ep__ = 5;
			}
			case 5:
			{
				r1 = r1/*V_1.1 = $ts0*/
				if(r1)
				{
					__ep__ = 6;

				}
				else
				{
					__ep__ = 7
					continue __ctrl__;

				}
			}
			case 6:
			{
				__ep__ = 2
				r2 = _[257]/*$t19 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = _[257]/*$t21 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = r1[r0]/*$t22 = $t21.get_Item(V_0.3)*/;
				r2[a0] = r1/*$t19.set_Item(index, $t22)*/;
				a0 = r0/*index = V_0.3*/;
				__rv__ = Math.floor(((a0 - 1) / 2))/*__rv__ = System.Math::Floor(index Subtract 1 Divide 2)*/;
				continue __ctrl__;
			}
			case 7:
			{
				r1 = _[257]/*$t16 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1[a0] = a1/*$t16.set_Item(index, t)*/;
				return;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function()
 //5: System.Boolean XaeiOS.Kernel.TaskPriorityQueue::IsEmpty()
{
	var r0;
	r0 = _[258]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	return (r0 == 0)/*$t0 ValueEquality 0*/;

},
function()
 //6: System.Void XaeiOS.Kernel.TaskPriorityQueue::Cleanup()
{
	_[258] = 0/*XaeiOS.Kernel.TaskPriorityQueue._count = 0*/;
	_[257] = null/*XaeiOS.Kernel.TaskPriorityQueue._heap = null*/;
	return;

},
function()
 //7: System.Void XaeiOS.Kernel.TaskPriorityQueue::Test()
{
	var r0,r1,r2;
	r0 = {$:_[259],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 1")*/;
	$[270].call(r0,null,null,null,3,"Task 1")/*$t5..ctor(null, null, null, 3, "Task 1")*/;
	r1 = {$:_[259],0:null,1:null,2:null,3:0,4:null,5:0}/*$t11 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 2")*/;
	$[270].call(r1,null,null,null,3,"Task 2")/*$t11..ctor(null, null, null, 3, "Task 2")*/;
	r2 = {$:_[259],0:null,1:null,2:null,3:0,4:null,5:0}/*$t17 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 3")*/;
	$[270].call(r2,null,null,null,3,"Task 3")/*$t17..ctor(null, null, null, 3, "Task 3")*/;
	$[253](r0)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t5)*/;
	$[253](r1)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t11)*/;
	$[253](r2)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t17)*/;
	r0 = $[254]()/*V_3.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
	r1 = $[254]()/*V_4.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
	$[253](r1)/*XaeiOS.Kernel.TaskPriorityQueue::Add(V_4.1)*/;
	$[253](r0)/*XaeiOS.Kernel.TaskPriorityQueue::Add(V_3.1)*/;
	return;

},
function()
 //8: System.Int32 XaeiOS.Kernel.Task::get_TaskCount()
{
	var r0;
	r0 = _[263]/*V_0.1 = XaeiOS.Kernel.Task._taskCount*/;
	return r0/*V_0.1*/;

},
function(a0/*id*/)
 //9: XaeiOS.Kernel.Task XaeiOS.Kernel.Task::GetTaskById(System.Int32)
{
	var r1,r0;
	r1 = _[260]/*$t0 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = a0 in r1/*V_1.1 = $t0.ContainsKey(id)*/;
	if(r1)
	{
		r1 = _[260]/*$t5 = XaeiOS.Kernel.Task.IdMap*/;
		r0 = r1[a0]/*V_0.2 = $t5.get_Item(id)*/;

	}
	else
	{
		r0 = null/*V_0.1 = null*/

	}
	return r0/*V_0.3*/;

},
function()
 //10: System.Void XaeiOS.Kernel.Task::Initialize()
{
	var r0;
	_[262] = 1/*XaeiOS.Kernel.Task._idCounter = 1*/;
	_[263] = 0/*XaeiOS.Kernel.Task._taskCount = 0*/;
	r0 = new Object()/*$t2 = new System.Void System.NativeObject::.ctor()()*/;
	_[260] = r0/*XaeiOS.Kernel.Task.IdMap = $t2*/;
	r0 = new Object()/*$t3 = new System.Void System.NativeObject::.ctor()()*/;
	_[261] = r0/*XaeiOS.Kernel.Task.NameMap = $t3*/;
	return;

},
function()
 //11: System.String XaeiOS.Kernel.Task::get_Name()
{
	var r0,r1;
	r0 = _[261]/*$t0 = XaeiOS.Kernel.Task.NameMap*/;
	r1 = this[3]/*$t3 = this.Id*/;
	r0 = r0[r1]/*V_0.1 = $t0.get_Item($t3)*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 12: System.Int32 XaeiOS.Kernel.Task::GetHashCode()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = this[3]/*V_0.1 = this.Id*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 13: System.String XaeiOS.Kernel.Task::ToString()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r0 = $[263].call(this)/*V_0.1 = this.get_Name()*/;
					return r0/*V_0.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*t*/)
 //14: System.Void XaeiOS.Kernel.Task::RemoveTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[263]/*$t0 = XaeiOS.Kernel.Task._taskCount*/;
	_[263] = (r0 - 1)/*XaeiOS.Kernel.Task._taskCount = $t0 Subtract 1*/;
	r0 = _[261]/*$t3 = XaeiOS.Kernel.Task.NameMap*/;
	r1 = a0[3]/*$t6 = t.Id*/;
	delete r0[r1]/*$t3.RemoveKey($t6)*/;
	r0 = _[260]/*$t7 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = a0[3]/*$t10 = t.Id*/;
	delete r0[r1]/*$t7.RemoveKey($t10)*/;
	return;

},
function()
 //15: System.Void XaeiOS.Kernel.Task::Cleanup()
{
	_[261] = null/*XaeiOS.Kernel.Task.NameMap = null*/;
	_[260] = null/*XaeiOS.Kernel.Task.IdMap = null*/;
	_[263] = 0/*XaeiOS.Kernel.Task._taskCount = 0*/;
	return;

},
function()
 //16: System.Void XaeiOS.Kernel.Task::Test()
{
	var r0,r1,r2;
	r2 = new Object()/*$t0 = new System.Void System.NativeObject::.ctor()()*/;
	"yo" in r2/*$t0.ContainsKey("yo")*/;
	"yo2" in r2/*$t0.ContainsKey("yo2")*/;
	delete r2["6"]/*$t0.RemoveKey("6")*/;
	r0 = _[262]/*$t7 = XaeiOS.Kernel.Task._idCounter*/;
	delete r2[r0]/*$t0.RemoveKey($t7)*/;
	r0 = _[260]/*$t8 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = _[262]/*$t10 = XaeiOS.Kernel.Task._idCounter*/;
	delete r0[r1]/*$t8.RemoveKey($t10)*/;
	r0 = _[262]/*$t12 = XaeiOS.Kernel.Task._idCounter*/;
	delete r2[r0]/*$t0.RemoveKey($t12)*/;
	r0 = _[260]/*$t13 = XaeiOS.Kernel.Task.IdMap*/;
	delete r0[6]/*$t13.RemoveKey(6)*/;
	r0 = _[260]/*$t16 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = _[262]/*$t18 = XaeiOS.Kernel.Task._idCounter*/;
	r1 in r0/*$t16.ContainsKey($t18)*/;
	r0 = _[262]/*$t21 = XaeiOS.Kernel.Task._idCounter*/;
	r0 in r2/*$t0.ContainsKey($t21)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/,a4/*name*/,a5/*id*/)
 //17: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String,System.Int32)
{
	var r0;
	r0 = $[297](a0,a1)/*$t6 = XaeiOS.Kernel.Continuation::Create(self, function)*/;
	this[0] = r0/*this.Continuation = $t6*/;
	this[1] = a0/*this.This = self*/;
	this[2] = a1/*this.Function = function*/;
	this[4] = a2/*this.Callback = callback*/;
	r0 = $[289](a3)/*$t15 = XaeiOS.Kernel.Scheduler::DynamicPriority(priority)*/;
	this[5] = r0/*this.Priority = $t15*/;
	this[3] = a5/*this.Id = id*/;
	r0 = _[261]/*$t18 = XaeiOS.Kernel.Task.NameMap*/;
	r0[a5] = a4/*$t18.set_Item(id, name)*/;
	r0 = _[260]/*$t23 = XaeiOS.Kernel.Task.IdMap*/;
	r0[a5] = this/*$t23.set_Item(id, this)*/;
	r0 = _[263]/*$t28 = XaeiOS.Kernel.Task._taskCount*/;
	_[263] = (r0 + 1)/*XaeiOS.Kernel.Task._taskCount = $t28 Add 1*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/,a4/*name*/)
 //18: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)
{
	var r0;
	r0 = _[262]/*$tf7 = XaeiOS.Kernel.Task._idCounter*/;
	_[262] = (r0 + 1)/*XaeiOS.Kernel.Task._idCounter = $tf7 Add 1*/;
	$[269].call(this,a0,a1,a2,a3,a4,r0)/*this..ctor(self, function, callback, priority, name, $tf7)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/)
 //19: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority)
{
	var r0,r1;
	r0 = _[262]/*$t6 = &XaeiOS.Kernel.Task._idCounter*/;
	r0 = r0.toString()/*$t7 = $t6.ToString()*/;
	r1 = ("anonymous" + r0)/*$t8 = System.String::Concat("anonymous", $t7)*/;
	r0 = _[262]/*$tf10 = XaeiOS.Kernel.Task._idCounter*/;
	_[262] = (r0 + 1)/*XaeiOS.Kernel.Task._idCounter = $tf10 Add 1*/;
	$[269].call(this,a0,a1,a2,a3,r1,r0)/*this..ctor(self, function, callback, priority, $t8, $tf10)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/)
 //20: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback)
{
	$[271].call(this,a0,a1,a2,3)/*this..ctor(self, function, callback, 3)*/;
	return;

},
function(a0/*self*/,a1/*function*/)
 //21: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction)
{
	$[272].call(this,a0,a1,null)/*this..ctor(self, function, null)*/;
	return;

},
function(a0/*self*/,a1/*function*/)
 //22: System.Void XaeiOS.Kernel.Frame::.ctor(System.Object,System.NativeFunction)
{
	this[0] = a0/*this.This = self*/;
	this[1] = a1/*this.Function = function*/;
	return;

},
function()
 //23: XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::get_KernelTask()
{
	var r0;
	r0 = _[284]/*V_0.1 = XaeiOS.Kernel.Scheduler._kernelTask*/;
	return r0/*V_0.1*/;

},
function()
 //24: XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::get_CurrentTask()
{
	var r0;
	r0 = _[283]/*V_0.1 = XaeiOS.Kernel.Scheduler._currentTask*/;
	return r0/*V_0.1*/;

},
function()
 //25: System.Boolean XaeiOS.Kernel.Scheduler::get_InCriticalSection()
{
	var r0;
	r0 = _[288]/*V_0.1 = XaeiOS.Kernel.Scheduler._inCriticalSection*/;
	return r0/*V_0.1*/;

},
function()
 //26: System.Void XaeiOS.Kernel.Scheduler::EnterCriticalSection()
{
	_[288] = 1/*XaeiOS.Kernel.Scheduler._inCriticalSection = 1*/;
	return;

},
function()
 //27: System.Void XaeiOS.Kernel.Scheduler::LeaveCriticalSection()
{
	_[288] = 0/*XaeiOS.Kernel.Scheduler._inCriticalSection = 0*/;
	return;

},
function()
 //28: System.Void XaeiOS.Kernel.Scheduler::Initialize()
{
	var r0;
	r0 = {$:_[259],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Kernel Task")*/;
	$[270].call(r0,null,null,null,3,"Kernel Task")/*$t5..ctor(null, null, null, 3, "Kernel Task")*/;
	_[284] = r0/*XaeiOS.Kernel.Scheduler._kernelTask = $t5*/;
	r0 = new Object()/*$t6 = new System.Void System.NativeObject::.ctor()()*/;
	_[287] = r0/*XaeiOS.Kernel.Scheduler._taskStatusMap = $t6*/;
	_[288] = 0/*XaeiOS.Kernel.Scheduler._inCriticalSection = 0*/;
	$[283]()/*XaeiOS.Kernel.Scheduler::StartCpu()*/;
	return;

},
function()
 //29: System.Void XaeiOS.Kernel.Scheduler::CpuCycle()
{
	var r1,r2,r3,r0,r4,r5,r6;
	r1 = $[257]()/*$t0 = XaeiOS.Kernel.TaskPriorityQueue::IsEmpty()*/;
	r1 = (!r1)/*V_8.1 = BooleanNot $t0*/;
	if(r1)
	{
		r6 = $[254]()/*V_0.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
		r2 = $[263].call(r6)/*$t7 = V_0.1.get_Name()*/;
		r1 = new Date()/*$t9 = new System.Void System.NativeDate::.ctor()()*/;
		r1 = r1.getTime()/*V_9.1 = $t9.GetTime()*/;
		r1 = r1.toString()/*$t11 = V_9.1.ToString()*/;
		r1 = ["Executing task: ", r2, " @ ", r1].join('')/*$t12 = System.String::Concat("Executing task: ", $t7, " @ ", $t11)*/;
		window.status = r1/*XaeiOS.Kernel.Scheduler::SetWindowStatus($t12)*/;
		r1 = new Date()/*$t13 = new System.Void System.NativeDate::.ctor()()*/;
		r1 = r1.getTime()/*V_1.1 = $t13.GetTime()*/;
		r5 = r6[0]/*V_2.1 = V_0.1.Continuation*/;
		r5[1] = (r1 + 35)/*V_2.1.TimeSliceEnd = V_1.1 Add (System.Int64)35*/;
		r1 = r5[6]/*V_3.1 = V_2.1.Frame*/;
		_[283] = r6/*XaeiOS.Kernel.Scheduler._currentTask = V_0.1*/;
		try {/*XaeiOS.Kernel.Scheduler::GenerateStartTryBlockCode()*/;
		r2 = r1[1]/*$t20 = V_3.1.Function*/;
		r1 = r1[0]/*$t22 = V_3.1.This*/;
		r3 = r2.apply(r1, r5)/*V_4.1 = $t20.Apply($t22, V_2.1)*/;
		r1 = $[275]()/*$t26 = XaeiOS.Kernel.Scheduler::get_KernelTask()*/;
		_[283] = r1/*XaeiOS.Kernel.Scheduler._currentTask = $t26*/;
		r2 = r5[5]/*$t27 = V_2.1.ParentContinuation*/;
		r1 = $[295]()/*$t28 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
		r1 = (!(r2 == r1))/*V_8.2 = BooleanNot $t27 ValueEquality $t28*/;
		if(r1)
		{
			r1 = r5[5]/*V_2.2 = V_2.1.ParentContinuation*/;
			r6[0] = r1/*V_0.1.Continuation = V_2.2*/;
			if(typeof(r3) != "undefined") {/*XaeiOS.Kernel.Scheduler::GenerateIfValueIsDefinedCode(V_4.1)*/;
			r1[4] = r3/*V_2.2.ReturnValue = V_4.1*/;
			}/*XaeiOS.Kernel.Scheduler::GenerateEndBlockCode()*/;
			$[291](r6)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

		}
		else
		{
			$[282](r6,r3,0)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_4.1, 0)*/

		}
		} catch(r4) {/*XaeiOS.Kernel.Scheduler::GenerateStartCatchBlockCode(V_5)*/;
		r1 = _[284]/*$t35 = XaeiOS.Kernel.Scheduler._kernelTask*/;
		_[283] = r1/*XaeiOS.Kernel.Scheduler._currentTask = $t35*/;
		r1 = r4 instanceof Array/*V_8.3 = V_5.InstanceOf("Array")*/;
		if(r1)
		{
			r1 = $[295]()/*$t61 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
			r1 = (!(r4 == r1))/*V_8.7 = BooleanNot V_5 ValueEquality $t61*/;
			if(r1)
			{
				r6[0] = r4/*V_0.1.Continuation = V_5*/;
				$[291](r6)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

			}
			else
			{
				r1 = r4[3]/*$t67 = V_5.Exception*/
				r1 = (r1 == null)/*V_8.8 = $t67 ValueEquality null*/;
				if(r1)
				{
					$[282](r6,r3,0)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_4.1, 0)*/;

				}
				else
				{
					r1 = r4[3]/*$t72 = V_5.Exception*/
					$[282](r6,r1,1)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, $t72, 1)*/;

				}

			}

		}
		else
		{
			r1 = "$" in r4/*$t40 = V_5.ContainsKey("$")*/
			r1 = (!r1)/*V_8.4 = BooleanNot $t40*/;
			if(r1)
			{
				r0 = null/*V_6.2 = null*/;

			}
			else
			{
				r0 = $[6](r4,_[13],false)/*V_6.1 = V_5 is System.Exception*/

			}
			r1 = (r0 == null)/*V_8.5 = V_6.3 ValueEquality null*/;
			if(r1)
			{
				$[282](r6,r4,3)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_5, 3)*/;

			}
			else
			{
				r2 = r5[5]/*V_7.1 = V_2.1.ParentContinuation*/
				r1 = $[295]()/*$t50 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
				r1 = (!(r2 == r1))/*V_8.6 = BooleanNot V_7.1 ValueEquality $t50*/;
				if(r1)
				{
					r6[0] = r2/*V_0.1.Continuation = V_7.1*/;
					r2[3] = r0/*V_7.1.Exception = V_6.3*/;
					$[291](r6)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

				}
				else
				{
					$[282](r6,r0,1)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_6.3, 1)*/

				}

			}
			}/*XaeiOS.Kernel.Scheduler::GenerateEndBlockCode()*/;

		}

	}
	else
	{
		_[285] = 1/*XaeiOS.Kernel.Scheduler._awaitingTask = 1*/
		$[284]()/*XaeiOS.Kernel.Scheduler::PauseCpu()*/;

	}
	return;

},
function(a0/*t*/,a1/*returnValue*/,a2/*exitStatus*/)
 //30: System.Void XaeiOS.Kernel.Scheduler::CleanupTask(XaeiOS.Kernel.Task,System.var,XaeiOS.Kernel.TaskExitStatus)
{
	var r0,r1,r2;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r2 = $[263].call(a0)/*V_0.1 = t.get_Name()*/;
				r0 = _[287]/*$t2 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
				r1 = a0[3]/*$t5 = t.Id*/;
				delete r0[r1]/*$t2.RemoveKey($t5)*/;
				$[266](a0)/*XaeiOS.Kernel.Task::RemoveTask(t)*/;
				r0 = a0[4]/*$t8 = t.Callback*/;
				r0 = (r0 == null)/*V_1.1 = $t8 ValueEquality null*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 3
				r0 = a0[4]/*$t13 = t.Callback*/;
				r1 = a0[3]/*$t15 = t.Id*/;
				r0(r1,r2,a1,a2)/*$t13.Invoke($t15, V_0.1, returnValue, exitStatus)*/;
			}
			case 3:
			{
				return
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function()
 //31: System.Void XaeiOS.Kernel.Scheduler::StartCpu()
{
	var r0;
	r0 = $[281]/*$t2 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Kernel.Scheduler::CpuCycle)*/;
	/*$t2..ctor(null, XaeiOS.Kernel.Scheduler::CpuCycle)*/r0 = setInterval(r0, 1)/*$t5 = XaeiOS.Kernel.Scheduler::SetInterval($t2, (System.Int64)1)*/;
	_[286] = r0/*XaeiOS.Kernel.Scheduler._cpuIntervalId = $t5*/;
	return;

},
function()
 //32: System.Void XaeiOS.Kernel.Scheduler::PauseCpu()
{
	var r0;
	r0 = _[286]/*$t0 = XaeiOS.Kernel.Scheduler._cpuIntervalId*/;
	clearInterval(r0)/*XaeiOS.Kernel.Scheduler::ClearInterval($t0)*/;
	return;

},
function()
 //33: System.Void XaeiOS.Kernel.Scheduler::ResumeCpu()
{
	$[283]()/*XaeiOS.Kernel.Scheduler::StartCpu()*/;
	return;

},
function()
 //34: System.Void XaeiOS.Kernel.Scheduler::Shutdown()
{
	$[287]()/*XaeiOS.Kernel.Scheduler::Cleanup()*/;
	$[288]()/*XaeiOS.Kernel.Scheduler::Halt()*/;
	return;

},
function()
 //35: System.Void XaeiOS.Kernel.Scheduler::Cleanup()
{
	$[258]()/*XaeiOS.Kernel.TaskPriorityQueue::Cleanup()*/;
	$[267]()/*XaeiOS.Kernel.Task::Cleanup()*/;
	_[283] = null/*XaeiOS.Kernel.Scheduler._currentTask = null*/;
	return;

},
function()
 //36: System.Void XaeiOS.Kernel.Scheduler::Halt()
{
	$[284]()/*XaeiOS.Kernel.Scheduler::PauseCpu()*/;
	return;

},
function(a0/*priority*/)
 //37: System.Int32 XaeiOS.Kernel.Scheduler::DynamicPriority(XaeiOS.Kernel.TaskPriority)
{
	return ((a0 + 1) * 1000)/*priority Add 1 Multiply 1000*/;

},
function(a0/*t*/)
 //38: System.Void XaeiOS.Kernel.Scheduler::ScheduleTask(XaeiOS.Kernel.Task)
{
	var r0;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				$[253](a0)/*XaeiOS.Kernel.TaskPriorityQueue::Add(t)*/;
				r0 = _[285]/*$t1 = XaeiOS.Kernel.Scheduler._awaitingTask*/;
				r0 = (!r0)/*V_0.1 = BooleanNot $t1*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 3
				_[285] = 0/*XaeiOS.Kernel.Scheduler._awaitingTask = 0*/;
				$[285]()/*XaeiOS.Kernel.Scheduler::ResumeCpu()*/;
			}
			case 3:
			{
				return
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*t*/)
 //39: System.Void XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[287]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0 = r1 in r0/*$t4 = $t0.ContainsKey($t3)*/;
	r0 = (!r0)/*V_1.1 = BooleanNot $t4*/;
	if(r0)
	{
		$[290](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;

	}
	else
	{
		r0 = _[287]/*$t8 = XaeiOS.Kernel.Scheduler._taskStatusMap*/
		r1 = a0[3]/*$t11 = t.Id*/;
		r1 = r0[r1]/*V_0.1 = $t8.get_Item($t11)*/;
		r0 = (!(r1 == 2))/*V_1.2 = BooleanNot V_0.1 ValueEquality 2*/;
		if(r0)
		{
			r0 = (r1 == 1)/*V_1.3 = V_0.1 ValueEquality 1*/;

		}
		else
		{
			$[282](a0,null,2)/*XaeiOS.Kernel.Scheduler::CleanupTask(t, null, 2)*/

		}
		if(r0)
		{
			r0 = _[287]/*$t23 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
			r1 = a0[3]/*$t26 = t.Id*/;
			delete r0[r1]/*$t23.RemoveKey($t26)*/;

		}
		else
		{
			r0 = new Error("XaeiOS general protection error: Illegal block type - ")/*$t31 = new System.Void System.NativeError::.ctor(System.String)("XaeiOS general protection error: Illegal block type - ")*/
			throw r0/*$t31*/;

		}

	}
	return;

},
function(a0/*t*/)
 //40: System.Void XaeiOS.Kernel.Scheduler::BlockTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[287]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0[r1] = 1/*$t0.set_Item($t3, 1)*/;
	return;

},
function(a0/*t*/)
 //41: System.Void XaeiOS.Kernel.Scheduler::UnblockTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[287]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0 = r0[r1]/*$t4 = $t0.get_Item($t3)*/;
	r0 = (r0 == 1)/*V_0.1 = $t4 ValueEquality 1*/;
	if(r0)
	{
		r0 = _[287]/*$t11 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
		r1 = a0[3]/*$t14 = t.Id*/;
		delete r0[r1]/*$t11.RemoveKey($t14)*/;
		$[290](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;
		return;

	}
	else
	{
		r0 = new Error("Task is not blocked")/*$t10 = new System.Void System.NativeError::.ctor(System.String)("Task is not blocked")*/
		throw r0/*$t10*/;

	}

},
function(a0/*t*/)
 //42: System.Void XaeiOS.Kernel.Scheduler::KillTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = _[287]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
				r1 = a0[3]/*$t3 = t.Id*/;
				r1 = r0[r1]/*V_0.1 = $t0.get_Item($t3)*/;
				r0 = (!(r1 == 1))/*V_1.1 = BooleanNot V_0.1 ValueEquality 1*/;
				if(r0)
				{
					__ep__ = 3;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 2

				}
			}
			case 2:
			{
				__ep__ = 5
				$[290](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;
				r0 = _[287]/*$t13 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
				r1 = a0[3]/*$t16 = t.Id*/;
				r0[r1] = 2/*$t13.set_Item($t16, 2)*/;
				continue __ctrl__;
			}
			case 3:
			{
				r0 = (r1 == 2)/*V_1.2 = V_0.1 ValueEquality 2*/
				if(r0)
				{
					__ep__ = 5;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 4

				}
			}
			case 4:
			{
				__ep__ = 5
				r0 = _[287]/*$t22 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
				r1 = a0[3]/*$t25 = t.Id*/;
				r0[r1] = 2/*$t22.set_Item($t25, 2)*/;
			}
			case 5:
			{
				return
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function()
 //43: XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::get_RootContinuation()
{
	var r0;
	r0 = _[294]/*V_0.1 = XaeiOS.Kernel.Continuation._rootContinuation*/;
	return r0/*V_0.1*/;

},
function()
 //44: System.Void XaeiOS.Kernel.Continuation::Initialize()
{
	var r0;
	r0 = new Array()/*$t0 = new System.Void XaeiOS.Kernel.Continuation::.ctor()()*/;
	_[294] = r0/*XaeiOS.Kernel.Continuation._rootContinuation = $t0*/;
	return;

},
function(a0/*self*/,a1/*function*/)
 //45: XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::Create(System.Object,System.NativeFunction)
{
	var r0,r1;
	r1 = new Array()/*$t0 = new System.Void XaeiOS.Kernel.Continuation::.ctor()()*/;
	r1[0] = 1/*$t0.ExecutionPointer = 1*/;
	r0 = $[295]()/*$t2 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
	r1[5] = r0/*$t0.ParentContinuation = $t2*/;
	r0 = {$:_[277],0:null,1:null,2:0}/*$t5 = new System.Void XaeiOS.Kernel.Frame::.ctor(System.Object,System.NativeFunction)(self, function)*/;
	$[274].call(r0,a0,a1)/*$t5..ctor(self, function)*/;
	r1[6] = r0/*$t0.Frame = $t5*/;
	return r1/*$t0*/;

},
function()
 //46: System.Void XaeiOS.Kernel.Continuation::.ctor()
{
	return;

},
function(a0/*taskId*/)
 //47: XaeiOS.Kernel.Task XaeiOS.SystemCalls::GetTask(System.Int32)
{
	var r0,r1;
	r1 = $[261](a0)/*V_0.1 = XaeiOS.Kernel.Task::GetTaskById(taskId)*/;
	r0 = (!(r1 == null))/*V_2.1 = BooleanNot V_0.1 ValueEquality null*/;
	if(r0)
	{
		return r1/*V_0.1*/;

	}
	else
	{
		r0 = {$:_[13],0:null,1:null,2:null}/*$t9 = new System.Void System.Exception::.ctor(System.String)("Task does not exist.")*/
		$[22].call(r0,"Task does not exist.")/*$t9..ctor("Task does not exist.")*/;
		throw r0/*$t9*/;

	}

},
function()
 //48: System.Void XaeiOS.SystemCalls::InitializeKernel()
{
	$[262]()/*XaeiOS.Kernel.Task::Initialize()*/;
	$[296]()/*XaeiOS.Kernel.Continuation::Initialize()*/;
	$[252]()/*XaeiOS.Kernel.TaskPriorityQueue::Initialize()*/;
	$[280]()/*XaeiOS.Kernel.Scheduler::Initialize()*/;
	return;

},
function(a0/*taskId*/)
 //49: System.Void XaeiOS.SystemCalls::ScheduleTask(System.Int32)
{
	var r0;
	r0 = $[299](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[291](r0)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked($t1)*/;
	return;

},
function(a0/*taskId*/)
 //50: System.Void XaeiOS.SystemCalls::BlockTask(System.Int32)
{
	var r0;
	r0 = $[299](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[292](r0)/*XaeiOS.Kernel.Scheduler::BlockTask($t1)*/;
	return;

},
function(a0/*taskId*/)
 //51: System.Void XaeiOS.SystemCalls::UnblockTask(System.Int32)
{
	var r0;
	r0 = $[299](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[293](r0)/*XaeiOS.Kernel.Scheduler::UnblockTask($t1)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 52: System.Void XaeiOS.SystemCalls::Yield()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					throw __pco__;/*XaeiOS.SystemCalls::InternalYield()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*taskId*/)
 //53: System.Void XaeiOS.SystemCalls::KillTask(System.Int32)
{
	var r0;
	r0 = $[299](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[294](r0)/*XaeiOS.Kernel.Scheduler::KillTask($t1)*/;
	return;

},
function()
 //54: System.Int32 XaeiOS.SystemCalls::GetCurrentTaskId()
{
	var r0;
	r0 = $[276]()/*$t0 = XaeiOS.Kernel.Scheduler::get_CurrentTask()*/;
	r0 = r0[3]/*V_0.1 = $t0.Id*/;
	return r0/*V_0.1*/;

},
function(a0/*self*/,a1/*fn*/,a2/*Callback*/,a3/*priority*/,a4/*name*/)
 //55: System.Int32 XaeiOS.SystemCalls::CreateTask(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)
{
	var r0;
	r0 = {$:_[259],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(self, fn, Callback, priority, name)*/;
	$[270].call(r0,a0,a1,a2,a3,a4)/*$t5..ctor(self, fn, Callback, priority, name)*/;
	r0 = r0[3]/*V_1.1 = $t5.Id*/;
	return r0/*V_1.1*/;

}

/************
Object image XaeiO.Compiler2.Tests - Code: 308	Data: 296
**********/

,function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 0: System.Void XaeiO.Compiler2.Tests.QuickSort::Sort(System.Collections.Generic.List`1<T>,XaeiO.Compiler2.Tests.QuickSort/Comparison`1<T>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[9].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = array.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t3 = __rv__*/;
					$[309](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],0,(r0 - 1),__f__[4]])/*XaeiO.Compiler2.Tests.QuickSort::InternalSort(array, 0, $t3 Subtract 1, comparison)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					return
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4)
// 1: System.Void XaeiO.Compiler2.Tests.QuickSort::InternalSort(System.Collections.Generic.List`1<T>,System.Int32,System.Int32,XaeiO.Compiler2.Tests.QuickSort/Comparison`1<T>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[3].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[4]])/*__rv__ = array.get_Item(left)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r4 = __rv__/*V_0.1 = __rv__*/
					r0 = (__f__[4] < __f__[5])/*V_4.1 = left LessThan right*/;
					if(r0)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 3
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 3:
				{
					__ep__ = 4
					__f__[3].$[4].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[4],r4])/*array.set_Item(left, V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__f__[4] = __f__[4]/*left = left*/
					__f__[5] = __f__[5]/*right = right*/;
					r0 = (!(__f__[4] < __f__[4]))/*V_4.2 = BooleanNot left LessThan left*/;
					if(r0)
					{
						__ep__ = 6;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					__ep__ = 6
					$[309](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[3],__f__[4],(__f__[4] - 1),__f__[6]])/*XaeiO.Compiler2.Tests.QuickSort::InternalSort(array, left, left Subtract 1, comparison)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r0 = (!(__f__[5] > __f__[4]))/*V_4.3 = BooleanNot right GreaterThan left*/
					if(r0)
					{
						__ep__ = 8;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 7
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 7:
				{
					__ep__ = 8
					$[309](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[3],(__f__[4] + 1),__f__[5],__f__[6]])/*XaeiO.Compiler2.Tests.QuickSort::InternalSort(array, left Add 1, right, comparison)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					return
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = __f__[3].$[3].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[5]])/*__rv__ = array.get_Item(right)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r0 = __rv__/*$t36 = __rv__*/;
					__rv__ = $[310](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0,r4,__f__[6]])/*__rv__ = XaeiO.Compiler2.Tests.QuickSort::GreaterThanOrEqualTo($t36, V_0.1, comparison)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					r0 = __rv__/*$t38 = __rv__*/
					if((!r0))
					{
						__ep__ = 13;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 12
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 12:
				{
					r0 = (__f__[4] < __f__[5])/*$ts0 = left LessThan right*/
					__ep__ = 14;
					continue __ctrl__;
				}
				case 13:
				{
					r0 = 0/*$ts0 = 0*/
					__ep__ = 14;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					r0 = r0/*V_4.4 = $ts0*/
					if(r0)
					{
						__ep__ = 30;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 15
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 15:
				{
					r0 = (__f__[4] == __f__[5])/*V_4.5 = left ValueEquality right*/
					if(r0)
					{
						__ep__ = 19;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 16
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 16:
				{
					__ep__ = 17
					__rv__ = __f__[3].$[3].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[5]])/*__rv__ = array.get_Item(right)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 17:
				{
					__ep__ = 18
					r0 = __rv__/*$t51 = __rv__*/;
					__f__[3].$[4].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[4],r0])/*array.set_Item(left, $t51)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					__f__[4] = (__f__[4] + 1)/*left = left Add 1*/
					__ep__ = 19;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 19:
				{
					__ep__ = 20
					__rv__ = __f__[3].$[3].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[5]])/*__rv__ = array.get_Item(right)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 20:
				{
					__ep__ = 21
					r0 = __rv__/*$t57 = __rv__*/;
					__rv__ = $[311](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0,r4,__f__[6]])/*__rv__ = XaeiO.Compiler2.Tests.QuickSort::LessThanOrEqualTo($t57, V_0.1, comparison)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 21:
				{
					r0 = __rv__/*$t59 = __rv__*/
					if((!r0))
					{
						__ep__ = 23;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 22
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 22:
				{
					r0 = (__f__[4] < __f__[5])/*$ts0 = left LessThan right*/
					__ep__ = 24;
					continue __ctrl__;
				}
				case 23:
				{
					r0 = 0/*$ts0 = 0*/
					__ep__ = 24;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 24:
				{
					r0 = r0/*V_4.6 = $ts0*/
					if(r0)
					{
						__ep__ = 29;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 25
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 25:
				{
					r0 = (__f__[4] == __f__[5])/*V_4.7 = left ValueEquality right*/
					if(r0)
					{
						__ep__ = 2;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 26
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 26:
				{
					__ep__ = 27
					__rv__ = __f__[3].$[3].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[4]])/*__rv__ = array.get_Item(left)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 27:
				{
					__ep__ = 28
					r0 = __rv__/*$t72 = __rv__*/;
					__f__[3].$[4].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[5],r0])/*array.set_Item(right, $t72)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 28:
				{
					__f__[5] = (__f__[5] - 1)/*right = right Subtract 1*/
					__ep__ = 2;
					continue __ctrl__;
				}
				case 29:
				{
					__f__[4] = (__f__[4] + 1)/*left = left Add 1*/
					__ep__ = 19;
					continue __ctrl__;
				}
				case 30:
				{
					__f__[5] = (__f__[5] - 1)/*right = right Subtract 1*/
					__ep__ = 9;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 2: System.Boolean XaeiO.Compiler2.Tests.QuickSort::GreaterThanOrEqualTo(T,T,XaeiO.Compiler2.Tests.QuickSort/Comparison`1<T>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[5].$[3].call(__f__[5],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = comparison.Invoke(a, b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t3 = __rv__*/
					return (r0 > -1)/*$t3 GreaterThan -1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 3: System.Boolean XaeiO.Compiler2.Tests.QuickSort::LessThanOrEqualTo(T,T,XaeiO.Compiler2.Tests.QuickSort/Comparison`1<T>)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[5].$[3].call(__f__[5],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = comparison.Invoke(a, b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t3 = __rv__*/
					return (r0 < 1)/*$t3 LessThan 1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 4: System.Void XaeiO.Compiler2.Tests.QuickSort::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(a0/*args*/)
 //5: System.Void XaeiO.Compiler2.Tests.Program::Main(System.String[])
{
	var r0;
	r0 = $[314]/*$t2 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(null, XaeiO.Compiler2.Tests.Program::Start)*/;
	/*$t2..ctor(null, XaeiO.Compiler2.Tests.Program::Start)*/$[121](r0)/*XaeiOS.Boot.BootManager::Boot($t2)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 6: System.Void XaeiO.Compiler2.Tests.Program::Start()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r2 = {$:_[137],0:null,1:0}/*$t0 = new System.Void System.Collections.Generic.List`1<System.Int32>::.ctor()()*/;
					$[191].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,5])/*$t0.Add(5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,53])/*$t0.Add(53)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,25])/*$t0.Add(25)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,2])/*$t0.Add(2)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,32131])/*$t0.Add(32131)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2.$[7].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,142])/*$t0.Add(142)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = 0/*V_1.1 = 0*/
					__ep__ = 9;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = r2.$[9].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t0.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r1 = __rv__/*$t8 = __rv__*/
					r1 = (r0 < r1)/*V_2.1 = V_1.5 LessThan $t8*/;
					if(r1)
					{
						__ep__ = 26;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 11
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 11:
				{
					__ep__ = 12
					__rv__ = r2.$[9].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t0.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					r1 = __rv__/*$t12 = __rv__*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Sorting ",r1," elements."])/*__rv__ = System.String::Concat("Sorting ", $t12, " elements.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					r1 = __rv__/*$t14 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*System.Console::WriteLine($t14)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					r1 = {$:_[297],0:null,1:null,2:null,3:null}/*$t17 = new System.Void XaeiO.Compiler2.Tests.QuickSort/Comparison`1<System.Int32>::.ctor(System.Object,System.IntPtr)(null, XaeiO.Compiler2.Tests.Program::CompareInts)*/;
					$[69](r1,null,$[315])/*$t17..ctor(null, XaeiO.Compiler2.Tests.Program::CompareInts)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					__ep__ = 16
					$[308](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r2,r1])/*XaeiO.Compiler2.Tests.QuickSort::Sort($t0, $t17)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					__ep__ = 17
					__rv__ = r2.$[9].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t0.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 17:
				{
					__ep__ = 18
					r1 = __rv__/*$t19 = __rv__*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Done sorting ",r1," elements."])/*__rv__ = System.String::Concat("Done sorting ", $t19, " elements.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					__ep__ = 19
					r1 = __rv__/*$t21 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*System.Console::WriteLine($t21)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 19:
				{
					r0 = 0/*V_1.2 = 0*/
					__ep__ = 20;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 20:
				{
					__ep__ = 21
					__rv__ = r2.$[9].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t0.get_Count()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 21:
				{
					r1 = __rv__/*$t23 = __rv__*/
					r1 = (r0 < r1)/*V_2.2 = V_1.6 LessThan $t23*/;
					if(r1)
					{
						__ep__ = 23;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 22
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 22:
				{
					return
				}
				case 23:
				{
					__ep__ = 24
					__rv__ = r2.$[3].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r0])/*__rv__ = $t0.get_Item(V_1.6)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 24:
				{
					__ep__ = 25
					r1 = __rv__/*V_3.1 = __rv__*/;
					r1 = r1.toString()/*$t27 = V_3.1.ToString()*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*System.Console::WriteLine($t27)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 25:
				{
					r0 = (r0 + 1)/*V_1.3 = V_1.6 Add 1*/
					__ep__ = 20;
					continue __ctrl__;
				}
				case 26:
				{
					__ep__ = 27
					__rv__ = r2.$[3].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r0])/*__rv__ = $t0.get_Item(V_1.5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 27:
				{
					__ep__ = 28
					r1 = __rv__/*$t31 = __rv__*/;
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Added ",r1,"."])/*__rv__ = System.String::Concat("Added ", $t31, ".")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 28:
				{
					__ep__ = 29
					r1 = __rv__/*$t33 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*System.Console::WriteLine($t33)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 29:
				{
					r0 = (r0 + 1)/*V_1.4 = V_1.5 Add 1*/
					__ep__ = 9;
					continue __ctrl__;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0)
// 7: System.Int32 XaeiO.Compiler2.Tests.Program::CompareInts(System.Int32,System.Int32)
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r1 = (!(__f__[3] == __f__[4]))/*V_1.1 = BooleanNot a ValueEquality b*/;
					if(r1)
					{
						__ep__ = 5;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,__f__[3]," == ",__f__[4]])/*__rv__ = System.String::Concat(a, " == ", b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r1 = __rv__/*$t10 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,r1])/*System.Console::WriteLine($t10)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0 = 0/*V_0.1 = 0*/
					__ep__ = 12;
					continue __ctrl__;
				}
				case 5:
				{
					r1 = (!(__f__[3] > __f__[4]))/*V_1.2 = BooleanNot a GreaterThan b*/
					if(r1)
					{
						__ep__ = 9;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,__f__[3]," > ",__f__[4]])/*__rv__ = System.String::Concat(a, " > ", b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r1 = __rv__/*$t22 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,r1])/*System.Console::WriteLine($t22)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = 1/*V_0.2 = 1*/
					__ep__ = 12;
					continue __ctrl__;
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = $[206](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,__f__[3]," < ",__f__[4]])/*__rv__ = System.String::Concat(a, " < ", b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r1 = __rv__/*$t27 = __rv__*/;
					$[39](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,r1])/*System.Console::WriteLine($t27)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					r0 = -1/*V_0.3 = -1*/
					__ep__ = 12;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					return r0/*V_0.4*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 8: System.Void XaeiO.Compiler2.Tests.Program::.ctor()
{
	if(__ex__)
	{
		if(__ecp__)
		{
			__ep__ = __ecp__;

		}
		else
		{
			__pco__[3] = __ex__
			throw __pco__;

		}

	}
	if(!__f__[2])
	{
		__f__[0] = this;
		__f__[1] = arguments.callee;
		__f__[2] = 1;

	}
	__ctrl__:
	while(true)
	{
		if(new Date() > __end__)
		{
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					return;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*e._throwContext = [dynamic expression]*/;

			}
			if((!__ecp__))
			{
				throw e/*e*/;

			}
			__ep__ = __ecp__;
			__ex__ = e;

		}


	}


}];var _=[
// 0: System.Object
{
	f: 0,
	d:
	{
		FullName:"System.Object",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 1: System.ObjectHelper
{
	f: 0,
	d:
	{
		FullName:"System.ObjectHelper",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.ObjectHelper::DataSegmentName */,
null/* System.String System.ObjectHelper::VTableFieldName */,
null/* System.String System.ObjectHelper::HashCodeFieldName */,
null/* System.String System.ObjectHelper::BaseVTableFieldName */,
null/* System.String System.ObjectHelper::InterfacesFieldName */,
null/* System.String System.ObjectHelper::FlagsFieldName */,
null/* System.Int32 System.ObjectHelper::_hashCodeCounter */,

// 9: System.ObjectHelper/VTableFlags
{
	f: 0,
	d:
	{
		FullName:"System.ObjectHelper/VTableFlags",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.ObjectHelper/VTableFlags System.ObjectHelper/VTableFlags::None */,
1/* System.ObjectHelper/VTableFlags System.ObjectHelper/VTableFlags::IsInterface */,

// 12: System.NativeObject
{
	f: 0,
	d:
	{
		FullName:"System.NativeObject",
		Fields:
		[

		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 13: System.Exception
{
	f: 0,
	d:
	{
		FullName:"System.Exception",
		Fields:
		[
			"_throwContext",
			"_message",
			"_innerException",
			"_stackTrace"
		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 14: System.SystemException
{
	f: 0,
	d:
	{
		FullName:"System.SystemException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 15: System.InvalidOperationException
{
	f: 0,
	d:
	{
		FullName:"System.InvalidOperationException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 16: System.Attribute
{
	f: 0,
	d:
	{
		FullName:"System.Attribute",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 17: System.Resources.ResourceManager
{
	f: 0,
	d:
	{
		FullName:"System.Resources.ResourceManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Collections.Generic.Dictionary`2<System.Int32,System.NativeArray`1<System.IDisposable>> System.Resources.ResourceManager::_resourceMap */,

// 19: System.Console
{
	f: 0,
	d:
	{
		FullName:"System.Console",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 20: System.Threading.Thread
{
	f: 0,
	d:
	{
		FullName:"System.Threading.Thread",
		Fields:
		[
			"_taskId",
			"_sip",
			"_threadStart",
			"_parametizedThreadStart",
			"_priority",
			"_blocked",
			"_running",
			"_unblockTimeoutId",
			"_parameter",
			"_unhandledException",
			"_callback",
			"_name",
			"_isBackground"
		]
	},
	0:$[57]/* System.String System.Threading.Thread::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 21: System.Delegate
{
	f: 0,
	d:
	{
		FullName:"System.Delegate",
		Fields:
		[
			"_target",
			"_function"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[66]/* System.Void System.Delegate::Invoke(System.Object[]) */,
	4:$[67]/* System.Void System.Delegate::InvokeNative(System.Object[]) */,
	5:$[68]/* System.Void System.Delegate::InternalCombine(System.Delegate) */
},

// 22: System.MulticastDelegate
{
	f: 0,
	d:
	{
		FullName:"System.MulticastDelegate",
		Fields:
		[
			"_next",
			"_prev"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */
},

// 23: System.Threading.ThreadCallback
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ThreadCallback",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[66]/* System.Void System.Threading.ThreadCallback::Invoke() */
},

// 24: System.Threading.ThreadStart
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ThreadStart",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[66]/* System.Void System.Threading.ThreadStart::Invoke() */
},

// 25: System.Threading.ParametizedThreadStart
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ParametizedThreadStart",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[66]/* System.Void System.Threading.ParametizedThreadStart::Invoke(System.Object) */
},

// 26: System.Threading.ThreadPriority
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ThreadPriority",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
1/* System.Threading.ThreadPriority System.Threading.ThreadPriority::Background */,
2/* System.Threading.ThreadPriority System.Threading.ThreadPriority::Low */,
3/* System.Threading.ThreadPriority System.Threading.ThreadPriority::Normal */,
4/* System.Threading.ThreadPriority System.Threading.ThreadPriority::High */,
5/* System.Threading.ThreadPriority System.Threading.ThreadPriority::Realtime */,

// 32: System.OverflowException
{
	f: 0,
	d:
	{
		FullName:"System.OverflowException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 33: System.Int32
{
	f: 0,
	d:
	{
		FullName:"System.Int32",
		Fields:
		[

		]
	},
	0:$[83]/* System.String System.Int32::ToString() */,
	1:$[84]/* System.Int32 System.Int32::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int32 System.Int32::MaxValue */,
null/* System.Int32 System.Int32::MinValue */,

// 36: System.Decimal
{
	f: 0,
	d:
	{
		FullName:"System.Decimal",
		Fields:
		[

		]
	},
	0:$[85]/* System.String System.Decimal::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 37: System.Collections.Generic.KeyValuePair`2
{
	f: 0,
	d:
	{
		FullName:"System.Collections.Generic.KeyValuePair`2",
		Fields:
		[
			"Key",
			"Value"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 38: System.Collections.IEnumerable
{
	f: 1,
	d:
	{
		FullName:"System.Collections.IEnumerable",
		Fields:
		[

		]
	},
	0:null/* System.Collections.IEnumerator System.Collections.IEnumerable::GetEnumerator() */
},

// 39: System.Collections.Generic.IEnumerable`1
{
	f: 1,
	i:
	{
		38:// Interface map: System.Collections.IEnumerable
		{
			0:$[-1]/* GetEnumerator -> System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.IEnumerable`1::GetEnumerator() */
		}
	},
	d:
	{
		FullName:"System.Collections.Generic.IEnumerable`1",
		Fields:
		[

		]
	},
	0:null/* System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.IEnumerable`1::GetEnumerator() */
},

// 40: System.Collections.Generic.ICollection`1
{
	f: 1,
	d:
	{
		FullName:"System.Collections.Generic.ICollection`1",
		Fields:
		[

		]
	},
	0:null/* System.Int32 System.Collections.Generic.ICollection`1::get_Count() */,
	1:null/* System.Boolean System.Collections.Generic.ICollection`1::get_IsReadOnly() */,
	2:null/* System.Void System.Collections.Generic.ICollection`1::Add(T) */,
	3:null/* System.Boolean System.Collections.Generic.ICollection`1::Contains(T) */,
	4:null/* System.Void System.Collections.Generic.ICollection`1::CopyTo(T[],System.Int32) */,
	5:null/* System.Boolean System.Collections.Generic.ICollection`1::Remove(T) */
},

// 41: System.Int64
{
	f: 0,
	d:
	{
		FullName:"System.Int64",
		Fields:
		[

		]
	},
	0:$[87]/* System.String System.Int64::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int64 System.Int64::MaxValue */,
null/* System.Int64 System.Int64::MinValue */,

// 44: System.EventHandler
{
	f: 0,
	d:
	{
		FullName:"System.EventHandler",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[66]/* System.Void System.EventHandler::Invoke(System.Object,System.EventArgs) */
},

// 45: System.IDisposable
{
	f: 1,
	d:
	{
		FullName:"System.IDisposable",
		Fields:
		[

		]
	},
	0:null/* System.Void System.IDisposable::Dispose() */
},

// 46: System.ICloneable
{
	f: 1,
	d:
	{
		FullName:"System.ICloneable",
		Fields:
		[

		]
	},
	0:null/* System.Object System.ICloneable::Clone() */
},

// 47: System.UInt32
{
	f: 0,
	d:
	{
		FullName:"System.UInt32",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.UInt32 System.UInt32::MinValue */,
null/* System.UInt32 System.UInt32::MaxValue */,

// 50: System.Boolean
{
	f: 0,
	d:
	{
		FullName:"System.Boolean",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.Boolean::FalseString */,
null/* System.String System.Boolean::TrueString */,
3/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::CodeTypeMask */,
0/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::IL */,
1/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::Native */,
2/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::OPTIL */,
3/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::Runtime */,
4/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::ManagedMask */,
4/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::Unmanaged */,
0/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::Managed */,
16/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::ForwardRef */,
128/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::PreserveSig */,
4096/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::InternalCall */,
32/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::Synchronized */,
8/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::NoInlining */,
65535/* System.Reflection.MethodImplAttributes System.Reflection.MethodImplAttributes::MaxMethodImplVal */,

// 67: System.Collections.IList
{
	f: 1,
	d:
	{
		FullName:"System.Collections.IList",
		Fields:
		[

		]
	},
	0:null/* System.Object System.Collections.IList::get_Item(System.Int32) */,
	1:null/* System.Void System.Collections.IList::set_Item(System.Int32,System.Object) */,
	2:null/* System.Void System.Collections.IList::Add(System.Object) */,
	3:null/* System.Int32 System.Collections.IList::get_Count() */
},

// 68: System.Collections.IEnumerator
{
	f: 1,
	d:
	{
		FullName:"System.Collections.IEnumerator",
		Fields:
		[

		]
	},
	0:null/* System.Object System.Collections.IEnumerator::get_Current() */,
	1:null/* System.Boolean System.Collections.IEnumerator::MoveNext() */,
	2:null/* System.Void System.Collections.IEnumerator::Reset() */
},

// 69: System.Collections.Generic.IEnumerator`1
{
	f: 1,
	i:
	{
		68:// Interface map: System.Collections.IEnumerator
		{
			0:$[-1]/* get_Current -> T System.Collections.Generic.IEnumerator`1::get_Current() */
		}
	},
	d:
	{
		FullName:"System.Collections.Generic.IEnumerator`1",
		Fields:
		[

		]
	},
	0:null/* T System.Collections.Generic.IEnumerator`1::get_Current() */
},

// 70: System.Collections.Generic.IDictionary`2
{
	f: 1,
	d:
	{
		FullName:"System.Collections.Generic.IDictionary`2",
		Fields:
		[

		]
	},
	0:null/* System.Int32 System.Collections.Generic.IDictionary`2::get_Count() */,
	1:null/* V System.Collections.Generic.IDictionary`2::get_Item(K) */,
	2:null/* System.Void System.Collections.Generic.IDictionary`2::set_Item(K,V) */,
	3:null/* System.Collections.Generic.ICollection`1<K> System.Collections.Generic.IDictionary`2::get_Keys() */,
	4:null/* System.Boolean System.Collections.Generic.IDictionary`2::ContainsKey(K) */,
	5:null/* System.Boolean System.Collections.Generic.IDictionary`2::ContainsValue(V) */,
	6:null/* System.Boolean System.Collections.Generic.IDictionary`2::Remove(K) */,
	7:null/* System.Void System.Collections.Generic.IDictionary`2::Clear() */
},

// 71: System.Collections.Generic.Dictionary`2
{
	f: 0,
	i:
	{
		70:// Interface map: System.Collections.Generic.IDictionary`2
		{
			0:$[89]/* get_Count -> System.Int32 System.Collections.Generic.Dictionary`2::get_Count() */,
			1:$[90]/* get_Item -> V System.Collections.Generic.Dictionary`2::get_Item(K) */,
			2:$[91]/* set_Item -> System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V) */,
			3:$[92]/* get_Keys -> System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys() */,
			4:$[93]/* ContainsKey -> System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K) */,
			5:$[94]/* ContainsValue -> System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V) */,
			6:$[95]/* Remove -> System.Boolean System.Collections.Generic.Dictionary`2::Remove(K) */,
			7:$[96]/* Clear -> System.Void System.Collections.Generic.Dictionary`2::Clear() */
		}
	},
	d:
	{
		FullName:"System.Collections.Generic.Dictionary`2",
		Fields:
		[
			"_keys",
			"_keysToIndexMapping",
			"_internalObject"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[89]/* System.Int32 System.Collections.Generic.Dictionary`2::get_Count() */,
	4:$[90]/* V System.Collections.Generic.Dictionary`2::get_Item(K) */,
	5:$[91]/* System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V) */,
	6:$[92]/* System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys() */,
	7:$[93]/* System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K) */,
	8:$[94]/* System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V) */,
	9:$[95]/* System.Boolean System.Collections.Generic.Dictionary`2::Remove(K) */,
	10:$[96]/* System.Void System.Collections.Generic.Dictionary`2::Clear() */
},

// 72: System.VoidDelegate
{
	f: 0,
	d:
	{
		FullName:"System.VoidDelegate",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void System.VoidDelegate::Invoke() */
},

// 73: System.var
{
	f: 0,
	d:
	{
		FullName:"System.var",
		Fields:
		[

		]
	},
	0:$[99]/* System.String System.var::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 74: System.UInt64
{
	f: 0,
	d:
	{
		FullName:"System.UInt64",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.UInt64 System.UInt64::MinValue */,
null/* System.UInt64 System.UInt64::MaxValue */,

// 77: System.Reflection.MethodInfo
{
	f: 0,
	d:
	{
		FullName:"System.Reflection.MethodInfo",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 78: System.WeakReference
{
	f: 0,
	d:
	{
		FullName:"System.WeakReference",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 79: System.Threading.Lock
{
	f: 0,
	d:
	{
		FullName:"System.Threading.Lock",
		Fields:
		[
			"_owner",
			"_waitingOwners"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 80: System.NullReferenceException
{
	f: 0,
	d:
	{
		FullName:"System.NullReferenceException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 81: System.EventArgs
{
	f: 0,
	d:
	{
		FullName:"System.EventArgs",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.EventArgs System.EventArgs::Empty */,

// 83: System.Runtime.InteropServices.LayoutKind
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.InteropServices.LayoutKind",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.Runtime.InteropServices.LayoutKind System.Runtime.InteropServices.LayoutKind::Sequential */,
2/* System.Runtime.InteropServices.LayoutKind System.Runtime.InteropServices.LayoutKind::Explicit */,
3/* System.Runtime.InteropServices.LayoutKind System.Runtime.InteropServices.LayoutKind::Auto */,

// 87: XaeiOS.Process.SIPState
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.SIPState",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* XaeiOS.Process.SIPState XaeiOS.Process.SIPState::NotStarted */,
1/* XaeiOS.Process.SIPState XaeiOS.Process.SIPState::Running */,
2/* XaeiOS.Process.SIPState XaeiOS.Process.SIPState::Exiting */,
3/* XaeiOS.Process.SIPState XaeiOS.Process.SIPState::Exited */,

// 92: System.Collections.Generic.IList`1
{
	f: 1,
	d:
	{
		FullName:"System.Collections.Generic.IList`1",
		Fields:
		[

		]
	},
	0:null/* T System.Collections.Generic.IList`1::get_Item(System.Int32) */,
	1:null/* System.Void System.Collections.Generic.IList`1::set_Item(System.Int32,T) */,
	2:null/* System.Void System.Collections.Generic.IList`1::Add(T) */,
	3:null/* System.Int32 System.Collections.Generic.IList`1::get_Count() */
},

// 93: System.Math
{
	f: 0,
	d:
	{
		FullName:"System.Math",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 94: System.Runtime.CompilerServices.MethodImplOptions
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.MethodImplOptions",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
4096/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::SystemCall */,
65536/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::CompilerImpl */,
1048576/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::NonPreemptive */,
16777216/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::CriticalSection */,
256/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::Inline */,
8/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::NoInlining */,
32/* System.Runtime.CompilerServices.MethodImplOptions System.Runtime.CompilerServices.MethodImplOptions::Synchronized */,

// 102: System.ArgumentOutOfRangeException
{
	f: 0,
	d:
	{
		FullName:"System.ArgumentOutOfRangeException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 103: System.Threading.ThreadManager
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ThreadManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Collections.Generic.Dictionary`2<System.Int32,System.Threading.Thread> System.Threading.ThreadManager::_threadsByTaskId */,

// 105: System.NativeFunction
{
	f: 0,
	d:
	{
		FullName:"System.NativeFunction",
		Fields:
		[

		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.AttributeUsageAttribute System.AttributeUsageAttribute::Default */,

// 107: XaeiOS.Boot.BootManager
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Boot.BootManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Boolean XaeiOS.Boot.BootManager::_booting */,
null/* System.Boolean XaeiOS.Boot.BootManager::_booted */,
null/* System.VoidDelegate XaeiOS.Boot.BootManager::_initDelegate */,

// 111: System.Diagnostics.Logging
{
	f: 0,
	d:
	{
		FullName:"System.Diagnostics.Logging",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 112: System.Global
{
	f: 0,
	d:
	{
		FullName:"System.Global",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 113: System.Threading.Condition
{
	f: 0,
	d:
	{
		FullName:"System.Threading.Condition",
		Fields:
		[
			"_lock",
			"_waitingList"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 114: System.Threading.TimedCondition
{
	f: 0,
	d:
	{
		FullName:"System.Threading.TimedCondition",
		Fields:
		[
			"_timeoutId",
			"_taskId",
			"_timedOut"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 115: System.Threading.ConditionTimedOutException
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ConditionTimedOutException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 116: System.NotSupportedException
{
	f: 0,
	d:
	{
		FullName:"System.NotSupportedException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 117: System.NotImplementedException
{
	f: 0,
	d:
	{
		FullName:"System.NotImplementedException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 118: System.Double
{
	f: 0,
	d:
	{
		FullName:"System.Double",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 119: System.ThreadAbortException
{
	f: 0,
	d:
	{
		FullName:"System.ThreadAbortException",
		Fields:
		[
			"_exceptionState"
		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 120: System.ArgumentException
{
	f: 0,
	d:
	{
		FullName:"System.ArgumentException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 121: System.NativeNumber
{
	f: 0,
	d:
	{
		FullName:"System.NativeNumber",
		Fields:
		[

		]
	},
	0:$[141]/* System.String System.NativeNumber::ToString() */,
	1:$[140]/* System.Int32 System.NativeNumber::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 122: System.MulticastNotSupportedException
{
	f: 0,
	d:
	{
		FullName:"System.MulticastNotSupportedException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 123: System.InvalidCastException
{
	f: 0,
	d:
	{
		FullName:"System.InvalidCastException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},
1/* System.Runtime.InteropServices.CallingConvention System.Runtime.InteropServices.CallingConvention::XaeiOS */,
2/* System.Runtime.InteropServices.CallingConvention System.Runtime.InteropServices.CallingConvention::Native */,

// 126: System.Runtime.InteropServices.ExposedCallbackDelegate
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.InteropServices.ExposedCallbackDelegate",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void System.Runtime.InteropServices.ExposedCallbackDelegate::Invoke(System.Object) */
},

// 127: XaeiOS.Process.SIP
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.SIP",
		Fields:
		[
			"_threads",
			"_parent",
			"_children",
			"_state",
			"_exitLock",
			"_id",
			"_name",
			"_callback"
		]
	},
	0:$[151]/* System.String XaeiOS.Process.SIP::ToString() */,
	1:$[150]/* System.Int32 XaeiOS.Process.SIP::GetHashCode() */,
	2:$[152]/* System.Boolean XaeiOS.Process.SIP::Equals(System.Object) */
},

// 128: XaeiOS.Process.DoublyLinkedList`1
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.DoublyLinkedList`1",
		Fields:
		[
			"_head",
			"_tail",
			"_lock",
			"_count"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 129: XaeiOS.Process.DoublyLinkedListItem`1
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.DoublyLinkedListItem`1",
		Fields:
		[
			"Data",
			"Previous",
			"Next"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 130: XaeiOS.Process.SIPManager
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.SIPManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Collections.Generic.Dictionary`2<System.Int32,XaeiOS.Process.SIP> XaeiOS.Process.SIPManager::_sips */,
null/* System.Int32 XaeiOS.Process.SIPManager::_pidCounter */,

// 133: XaeiOS.Process.ImageFormat.ObjectImage
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.ImageFormat.ObjectImage",
		Fields:
		[
			"Name",
			"Header",
			"MethodCount",
			"CodeStreamLength",
			"CodeStream",
			"DataCount",
			"DataStreamLength",
			"DataStream",
			"InitializationStreamLength",
			"InitializationStream",
			"ModuleImageCodeStoreIndex",
			"ModuleImageDataStoreIndex",
			"CodeSectionFixups",
			"DataSectionFixups",
			"InitializationSectionFixups"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 134: XaeiOS.Process.ImageFormat.AssemblyName
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.ImageFormat.AssemblyName",
		Fields:
		[
			"_name",
			"_version",
			"_culture"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 135: System.ExecutionEngineException
{
	f: 0,
	d:
	{
		FullName:"System.ExecutionEngineException",
		Fields:
		[

		]
	},
	0:$[20]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 136: System.Collections.ICollection
{
	f: 1,
	d:
	{
		FullName:"System.Collections.ICollection",
		Fields:
		[

		]
	},
	0:null/* System.Int32 System.Collections.ICollection::get_Count() */,
	1:null/* System.Boolean System.Collections.ICollection::get_IsSynchronized() */,
	2:null/* System.Object System.Collections.ICollection::get_SyncRoot() */,
	3:null/* System.Void System.Collections.ICollection::CopyTo(System.Array,System.Int32) */
},

// 137: System.Collections.Generic.List`1
{
	f: 0,
	i:
	{
		92:// Interface map: System.Collections.Generic.IList`1
		{
			0:$[182]/* get_Item -> T System.Collections.Generic.List`1::get_Item(System.Int32) */,
			1:$[183]/* set_Item -> System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
			2:$[186]/* Add -> System.Void System.Collections.Generic.List`1::Add(T) */,
			3:$[188]/* get_Count -> System.Int32 System.Collections.Generic.List`1::get_Count() */
		},
		39:// Interface map: System.Collections.Generic.IEnumerable`1
		{
			0:$[189]/* GetEnumerator -> System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */
		}
	},
	d:
	{
		FullName:"System.Collections.Generic.List`1",
		Fields:
		[
			"_array",
			"_count"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[182]/* T System.Collections.Generic.List`1::get_Item(System.Int32) */,
	4:$[183]/* System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
	5:$[184]/* System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32) */,
	6:$[185]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object) */,
	7:$[186]/* System.Void System.Collections.Generic.List`1::Add(T) */,
	8:$[187]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object) */,
	9:$[188]/* System.Int32 System.Collections.Generic.List`1::get_Count() */,
	10:$[189]/* System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */,
	11:$[190]/* System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator() */
},

// 138: System.Collections.Generic.List`1/Enumerator
{
	f: 0,
	i:
	{
		69:// Interface map: System.Collections.Generic.IEnumerator`1
		{
			0:$[192]/* get_Current -> T System.Collections.Generic.List`1/Enumerator::get_Current() */
		},
		68:// Interface map: System.Collections.IEnumerator
		{
			1:$[194]/* MoveNext -> System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext() */,
			2:$[195]/* Reset -> System.Void System.Collections.Generic.List`1/Enumerator::Reset() */
		},
		45:// Interface map: System.IDisposable
		{
			0:$[196]/* Dispose -> System.Void System.Collections.Generic.List`1/Enumerator::Dispose() */
		}
	},
	d:
	{
		FullName:"System.Collections.Generic.List`1/Enumerator",
		Fields:
		[
			"_currentIndex",
			"_list"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[192]/* T System.Collections.Generic.List`1/Enumerator::get_Current() */,
	4:$[193]/* System.Object System.Collections.Generic.List`1/Enumerator::System.Collections.IEnumerator.get_Current() */,
	5:$[194]/* System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext() */,
	6:$[195]/* System.Void System.Collections.Generic.List`1/Enumerator::Reset() */,
	7:$[196]/* System.Void System.Collections.Generic.List`1/Enumerator::Dispose() */
},

// 139: System.Collections.ArrayList
{
	f: 0,
	i:
	{
		92:// Interface map: System.Collections.Generic.IList`1
		{
			0:$[182]/* get_Item -> T System.Collections.Generic.List`1::get_Item(System.Int32) */,
			1:$[183]/* set_Item -> System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
			2:$[186]/* Add -> System.Void System.Collections.Generic.List`1::Add(T) */,
			3:$[188]/* get_Count -> System.Int32 System.Collections.Generic.List`1::get_Count() */
		},
		39:// Interface map: System.Collections.Generic.IEnumerable`1
		{
			0:$[189]/* GetEnumerator -> System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */
		}
	},
	d:
	{
		FullName:"System.Collections.ArrayList",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[182]/* T System.Collections.Generic.List`1::get_Item(System.Int32) */,
	4:$[183]/* System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
	5:$[184]/* System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32) */,
	6:$[185]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object) */,
	7:$[186]/* System.Void System.Collections.Generic.List`1::Add(T) */,
	8:$[187]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object) */,
	9:$[188]/* System.Int32 System.Collections.Generic.List`1::get_Count() */,
	10:$[189]/* System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */,
	11:$[190]/* System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator() */
},

// 140: System.String
{
	f: 0,
	d:
	{
		FullName:"System.String",
		Fields:
		[

		]
	},
	0:$[204]/* System.String System.String::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.String::_empty */,

// 142: System.SByte
{
	f: 0,
	d:
	{
		FullName:"System.SByte",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.SByte System.SByte::MinValue */,
null/* System.SByte System.SByte::MaxValue */,

// 145: System.Byte
{
	f: 0,
	d:
	{
		FullName:"System.Byte",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Byte System.Byte::MinValue */,
null/* System.Byte System.Byte::MaxValue */,

// 148: XaeiOS.Process.DynamicLinker
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.DynamicLinker",
		Fields:
		[
			"_entryPointImage"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Boolean XaeiOS.Process.DynamicLinker::_initialized */,
null/* System.Boolean XaeiOS.Process.DynamicLinker::_initializing */,
null/* System.String XaeiOS.Process.DynamicLinker::_osCorlibObjectImageData */,

// 152: System.NativeError
{
	f: 0,
	d:
	{
		FullName:"System.NativeError",
		Fields:
		[

		]
	},
	0:$[216]/* System.String System.NativeError::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[14]/* System.Exception System.Exception::GetBaseException() */,
	4:$[15]/* System.String System.Exception::get_HelpLink() */,
	5:$[16]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[17]/* System.String System.Exception::get_Source() */,
	7:$[18]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[19]/* System.String System.Exception::get_StackTrace() */
},

// 153: System.Diagnostics.ObjectDebugger
{
	f: 0,
	d:
	{
		FullName:"System.Diagnostics.ObjectDebugger",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.Diagnostics.ObjectDebugger::VTableDebugFieldName */,
null/* System.String System.Diagnostics.ObjectDebugger::DebugFullNameKey */,
null/* System.String System.Diagnostics.ObjectDebugger::DebugFieldsKey */,
null/* System.String System.Diagnostics.ObjectDebugger::DebugBaseKey */,
null/* System.Object System.Diagnostics.ObjectDebugger::_object */,

// 159: System.Diagnostics.ObjectDebugger/IntRef
{
	f: 0,
	d:
	{
		FullName:"System.Diagnostics.ObjectDebugger/IntRef",
		Fields:
		[
			"Value"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 160: System.Collections.Queue
{
	f: 0,
	i:
	{
		136:// Interface map: System.Collections.ICollection
		{
			0:$[221]/* get_Count -> System.Int32 System.Collections.Queue::get_Count() */,
			1:$[222]/* get_IsSynchronized -> System.Boolean System.Collections.Queue::get_IsSynchronized() */,
			2:$[224]/* get_SyncRoot -> System.Object System.Collections.Queue::get_SyncRoot() */,
			3:$[229]/* CopyTo -> System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32) */
		},
		46:// Interface map: System.ICloneable
		{
			0:$[227]/* Clone -> System.Object System.Collections.Queue::Clone() */
		},
		38:// Interface map: System.Collections.IEnumerable
		{
			0:$[232]/* GetEnumerator -> System.Collections.IEnumerator System.Collections.Queue::GetEnumerator() */
		}
	},
	d:
	{
		FullName:"System.Collections.Queue",
		Fields:
		[
			"_internalArray",
			"<IsSynchronized>k__BackingField",
			"<SyncRoot>k__BackingField"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[221]/* System.Int32 System.Collections.Queue::get_Count() */,
	4:$[222]/* System.Boolean System.Collections.Queue::get_IsSynchronized() */,
	5:$[224]/* System.Object System.Collections.Queue::get_SyncRoot() */,
	6:$[226]/* System.Void System.Collections.Queue::Clear() */,
	7:$[227]/* System.Object System.Collections.Queue::Clone() */,
	8:$[228]/* System.Boolean System.Collections.Queue::Contains(System.Object) */,
	9:$[229]/* System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32) */,
	10:$[230]/* System.Object System.Collections.Queue::Dequeue() */,
	11:$[231]/* System.Void System.Collections.Queue::Enqueue(System.Object) */,
	12:$[232]/* System.Collections.IEnumerator System.Collections.Queue::GetEnumerator() */,
	13:$[233]/* System.Object System.Collections.Queue::Peek() */,
	14:$[235]/* System.Object[] System.Collections.Queue::ToArray() */,
	15:$[236]/* System.Void System.Collections.Queue::TrimToSize() */
},

// 161: System.Single
{
	f: 0,
	d:
	{
		FullName:"System.Single",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Single System.Single::MaxValue */,
null/* System.Single System.Single::MinValue */,

// 164: System.Int16
{
	f: 0,
	d:
	{
		FullName:"System.Int16",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int16 System.Int16::MinValue */,
null/* System.Int16 System.Int16::MaxValue */,

// 167: XaeiOS.TaskCallback
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.TaskCallback",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void XaeiOS.TaskCallback::Invoke(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus) */
},

// 168: XaeiOS.TaskFunction
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.TaskFunction",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void XaeiOS.TaskFunction::Invoke() */
},

// 169: XaeiOS.TaskPriority
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.TaskPriority",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
1/* XaeiOS.TaskPriority XaeiOS.TaskPriority::Background */,
2/* XaeiOS.TaskPriority XaeiOS.TaskPriority::Low */,
3/* XaeiOS.TaskPriority XaeiOS.TaskPriority::Normal */,
4/* XaeiOS.TaskPriority XaeiOS.TaskPriority::High */,
5/* XaeiOS.TaskPriority XaeiOS.TaskPriority::Realtime */,

// 175: XaeiOS.TaskExitStatus
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.TaskExitStatus",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* XaeiOS.TaskExitStatus XaeiOS.TaskExitStatus::Normal */,
1/* XaeiOS.TaskExitStatus XaeiOS.TaskExitStatus::UnhandledException */,
2/* XaeiOS.TaskExitStatus XaeiOS.TaskExitStatus::Killed */,
3/* XaeiOS.TaskExitStatus XaeiOS.TaskExitStatus::CriticalError */,

// 180: XaeiOS.OSCorlib
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.OSCorlib",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Boolean XaeiOS.OSCorlib::_initialized */,
null/* System.Boolean XaeiOS.OSCorlib::_initializing */,

// 183: System.UInt16
{
	f: 0,
	d:
	{
		FullName:"System.UInt16",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.UInt16 System.UInt16::MaxValue */,
null/* System.UInt16 System.UInt16::MinValue */,

// 186: System.TypeCode
{
	f: 0,
	d:
	{
		FullName:"System.TypeCode",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
3/* System.TypeCode System.TypeCode::Boolean */,
6/* System.TypeCode System.TypeCode::Byte */,
4/* System.TypeCode System.TypeCode::Char */,
16/* System.TypeCode System.TypeCode::DateTime */,
2/* System.TypeCode System.TypeCode::DBNull */,
15/* System.TypeCode System.TypeCode::Decimal */,
14/* System.TypeCode System.TypeCode::Double */,
0/* System.TypeCode System.TypeCode::Empty */,
7/* System.TypeCode System.TypeCode::Int16 */,
9/* System.TypeCode System.TypeCode::Int32 */,
11/* System.TypeCode System.TypeCode::Int64 */,
1/* System.TypeCode System.TypeCode::Object */,
5/* System.TypeCode System.TypeCode::SByte */,
13/* System.TypeCode System.TypeCode::Single */,
18/* System.TypeCode System.TypeCode::String */,
8/* System.TypeCode System.TypeCode::UInt16 */,
10/* System.TypeCode System.TypeCode::UInt32 */,
12/* System.TypeCode System.TypeCode::UInt64 */,

// 205: System.Char
{
	f: 0,
	d:
	{
		FullName:"System.Char",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Char System.Char::MaxValue */,
null/* System.Char System.Char::MinValue */,
32767/* System.AttributeTargets System.AttributeTargets::All */,
1/* System.AttributeTargets System.AttributeTargets::Assembly */,
4/* System.AttributeTargets System.AttributeTargets::Class */,
32/* System.AttributeTargets System.AttributeTargets::Constructor */,
4096/* System.AttributeTargets System.AttributeTargets::Delegate */,
16/* System.AttributeTargets System.AttributeTargets::Enum */,
512/* System.AttributeTargets System.AttributeTargets::Event */,
256/* System.AttributeTargets System.AttributeTargets::Field */,
16384/* System.AttributeTargets System.AttributeTargets::GenericParameter */,
1024/* System.AttributeTargets System.AttributeTargets::Interface */,
64/* System.AttributeTargets System.AttributeTargets::Method */,
2/* System.AttributeTargets System.AttributeTargets::Module */,
2048/* System.AttributeTargets System.AttributeTargets::Parameter */,
128/* System.AttributeTargets System.AttributeTargets::Property */,
8192/* System.AttributeTargets System.AttributeTargets::ReturnValue */,
8/* System.AttributeTargets System.AttributeTargets::Struct */,
7/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::MemberAccessMask */,
0/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::PrivateScope */,
1/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Private */,
2/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::FamANDAssem */,
3/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Assembly */,
4/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Family */,
5/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::FamORAssem */,
6/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Public */,
16/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Static */,
32/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Final */,
64/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Virtual */,
128/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::HideBySig */,
126/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::VtableLayoutMask */,
512/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::CheckAccessOnOverride */,
0/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::ReuseSlot */,
256/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::NewSlot */,
1024/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::Abstract */,
2048/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::SpecialName */,
8192/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::PinvokeImpl */,
8/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::UnmanagedExport */,
4096/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::RTSpecialName */,
53248/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::ReservedMask */,
16384/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::HasSecurity */,
32768/* System.Reflection.MethodAttributes System.Reflection.MethodAttributes::RequiredSecObject */,

// 248: System.NativeDate
{
	f: 0,
	d:
	{
		FullName:"System.NativeDate",
		Fields:
		[

		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 249: System.Threading.Semaphore
{
	f: 0,
	d:
	{
		FullName:"System.Threading.Semaphore",
		Fields:
		[
			"_resources",
			"_totalResources",
			"_waitingTasks"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 250: System.Threading.Semaphore/WaitingTask
{
	f: 0,
	d:
	{
		FullName:"System.Threading.Semaphore/WaitingTask",
		Fields:
		[
			"ID",
			"Resources"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 251: System.NativeArray`1
{
	f: 0,
	d:
	{
		FullName:"System.NativeArray`1",
		Fields:
		[

		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 252: System.NativeArray
{
	f: 0,
	d:
	{
		FullName:"System.NativeArray",
		Fields:
		[

		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 253: System.Array
{
	f: 0,
	d:
	{
		FullName:"System.Array",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 254: XaeiOS.Boot.BootManager/<>c__DisplayClass1
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Boot.BootManager/<>c__DisplayClass1",
		Fields:
		[
			"initProcess"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 255: XaeiOS.Process.SIP/<>c__DisplayClass1
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Process.SIP/<>c__DisplayClass1",
		Fields:
		[
			"<>4__this",
			"thread"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
// 0: XaeiOS.Kernel.TaskPriorityQueue
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskPriorityQueue",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.NativeArray`1<XaeiOS.Kernel.Task> XaeiOS.Kernel.TaskPriorityQueue::_heap */,
null/* System.Int32 XaeiOS.Kernel.TaskPriorityQueue::_count */,

// 3: XaeiOS.Kernel.Task
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.Task",
		Fields:
		[
			"Continuation",
			"This",
			"Function",
			"Id",
			"Callback",
			"Priority"
		]
	},
	0:$[265]/* System.String XaeiOS.Kernel.Task::ToString() */,
	1:$[264]/* System.Int32 XaeiOS.Kernel.Task::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.NativeObject XaeiOS.Kernel.Task::IdMap */,
null/* System.NativeObject XaeiOS.Kernel.Task::NameMap */,
null/* System.Int32 XaeiOS.Kernel.Task::_idCounter */,
null/* System.Int32 XaeiOS.Kernel.Task::_taskCount */,

// 8: XaeiOS.Kernel.TaskCallback
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskCallback",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void XaeiOS.Kernel.TaskCallback::Invoke(System.Int32,System.String,System.var,XaeiOS.Kernel.TaskExitStatus) */
},

// 9: XaeiOS.Kernel.TaskFunction
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskFunction",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void XaeiOS.Kernel.TaskFunction::Invoke() */
},

// 10: XaeiOS.Kernel.TaskExitStatus
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskExitStatus",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* XaeiOS.Kernel.TaskExitStatus XaeiOS.Kernel.TaskExitStatus::Normal */,
1/* XaeiOS.Kernel.TaskExitStatus XaeiOS.Kernel.TaskExitStatus::UnhandledException */,
2/* XaeiOS.Kernel.TaskExitStatus XaeiOS.Kernel.TaskExitStatus::Killed */,
3/* XaeiOS.Kernel.TaskExitStatus XaeiOS.Kernel.TaskExitStatus::CriticalError */,

// 15: XaeiOS.Kernel.TaskPriority
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskPriority",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
1/* XaeiOS.Kernel.TaskPriority XaeiOS.Kernel.TaskPriority::Background */,
2/* XaeiOS.Kernel.TaskPriority XaeiOS.Kernel.TaskPriority::Low */,
3/* XaeiOS.Kernel.TaskPriority XaeiOS.Kernel.TaskPriority::Normal */,
4/* XaeiOS.Kernel.TaskPriority XaeiOS.Kernel.TaskPriority::High */,
5/* XaeiOS.Kernel.TaskPriority XaeiOS.Kernel.TaskPriority::Realtime */,

// 21: XaeiOS.Kernel.Frame
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.Frame",
		Fields:
		[
			"This",
			"Function",
			"Flags"
		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 22: XaeiOS.Kernel.FrameFlags
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.FrameFlags",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* XaeiOS.Kernel.FrameFlags XaeiOS.Kernel.FrameFlags::Uninitialized */,
1/* XaeiOS.Kernel.FrameFlags XaeiOS.Kernel.FrameFlags::Initialized */,

// 25: XaeiOS.Kernel.Scheduler
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.Scheduler",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int64 XaeiOS.Kernel.Scheduler::TimeSliceLength */,
null/* XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::_currentTask */,
null/* XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::_kernelTask */,
null/* System.Boolean XaeiOS.Kernel.Scheduler::_awaitingTask */,
null/* System.var XaeiOS.Kernel.Scheduler::_cpuIntervalId */,
null/* System.NativeObject XaeiOS.Kernel.Scheduler::_taskStatusMap */,
null/* System.Boolean XaeiOS.Kernel.Scheduler::_inCriticalSection */,

// 33: XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[67]/* System.Void XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate::Invoke(XaeiOS.Kernel.Task) */
},

// 34: XaeiOS.Kernel.TaskStatus
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.TaskStatus",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
1/* XaeiOS.Kernel.TaskStatus XaeiOS.Kernel.TaskStatus::Blocked */,
2/* XaeiOS.Kernel.TaskStatus XaeiOS.Kernel.TaskStatus::Killed */,

// 37: XaeiOS.Kernel.Continuation
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.Kernel.Continuation",
		Fields:
		[
			"ExecutionPointer",
			"TimeSliceEnd",
			"ExceptionClausePointer",
			"Exception",
			"ReturnValue",
			"ParentContinuation",
			"Frame"
		]
	},
	0:$[10]/* System.String System.NativeObject::ToString() */,
	1:$[11]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::_rootContinuation */,

// 39: XaeiOS.SystemCalls
{
	f: 0,
	d:
	{
		FullName:"XaeiOS.SystemCalls",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
// 0: XaeiO.Compiler2.Tests.QuickSort
{
	f: 0,
	d:
	{
		FullName:"XaeiO.Compiler2.Tests.QuickSort",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},

// 1: XaeiO.Compiler2.Tests.QuickSort/Comparison`1
{
	f: 0,
	d:
	{
		FullName:"XaeiO.Compiler2.Tests.QuickSort/Comparison`1",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[76]/* System.Void System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[77]/* System.Void System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[78]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[66]/* System.Int32 XaeiO.Compiler2.Tests.QuickSort/Comparison`1::Invoke(T,T) */
},

// 2: XaeiO.Compiler2.Tests.Program
{
	f: 0,
	d:
	{
		FullName:"XaeiO.Compiler2.Tests.Program",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
}];var __module__={Initialize:function(){_[1].b = _[0];// System.ObjectHelper extends System.Object
_[12].b = _[0];// System.NativeObject extends System.Object
Object.prototype.$ = _[12];
_[13].b = _[0];// System.Exception extends System.Object
_[14].b = _[13];// System.SystemException extends System.Exception
_[15].b = _[14];// System.InvalidOperationException extends System.SystemException
_[16].b = _[0];// System.Attribute extends System.Object
_[17].b = _[0];// System.Resources.ResourceManager extends System.Object
_[19].b = _[0];// System.Console extends System.Object
_[20].b = _[0];// System.Threading.Thread extends System.Object
_[21].b = _[0];// System.Delegate extends System.Object
_[22].b = _[21];// System.MulticastDelegate extends System.Delegate
_[23].b = _[22];// System.Threading.ThreadCallback extends System.MulticastDelegate
_[24].b = _[22];// System.Threading.ThreadStart extends System.MulticastDelegate
_[25].b = _[22];// System.Threading.ParametizedThreadStart extends System.MulticastDelegate
_[32].b = _[13];// System.OverflowException extends System.Exception
_[37].b = _[0];// System.Collections.Generic.KeyValuePair`2 extends System.Object
_[44].b = _[22];// System.EventHandler extends System.MulticastDelegate
_[71].b = _[0];// System.Collections.Generic.Dictionary`2 extends System.Object
_[72].b = _[22];// System.VoidDelegate extends System.MulticastDelegate
_[73].b = _[0];// System.var extends System.Object
_[77].b = _[0];// System.Reflection.MethodInfo extends System.Object
_[78].b = _[0];// System.WeakReference extends System.Object
_[79].b = _[0];// System.Threading.Lock extends System.Object
_[80].b = _[14];// System.NullReferenceException extends System.SystemException
_[81].b = _[0];// System.EventArgs extends System.Object
_[93].b = _[0];// System.Math extends System.Object
_[102].b = _[13];// System.ArgumentOutOfRangeException extends System.Exception
_[103].b = _[0];// System.Threading.ThreadManager extends System.Object
_[105].b = _[12];// System.NativeFunction extends System.NativeObject
Function.prototype.$ = _[105];
_[107].b = _[0];// XaeiOS.Boot.BootManager extends System.Object
_[111].b = _[0];// System.Diagnostics.Logging extends System.Object
_[112].b = _[0];// System.Global extends System.Object
_[113].b = _[0];// System.Threading.Condition extends System.Object
_[114].b = _[113];// System.Threading.TimedCondition extends System.Threading.Condition
_[115].b = _[13];// System.Threading.ConditionTimedOutException extends System.Exception
_[116].b = _[14];// System.NotSupportedException extends System.SystemException
_[117].b = _[13];// System.NotImplementedException extends System.Exception
_[119].b = _[13];// System.ThreadAbortException extends System.Exception
_[120].b = _[13];// System.ArgumentException extends System.Exception
Number.prototype.$ = _[121];
_[122].b = _[13];// System.MulticastNotSupportedException extends System.Exception
_[123].b = _[13];// System.InvalidCastException extends System.Exception
_[126].b = _[22];// System.Runtime.InteropServices.ExposedCallbackDelegate extends System.MulticastDelegate
_[127].b = _[0];// XaeiOS.Process.SIP extends System.Object
_[128].b = _[0];// XaeiOS.Process.DoublyLinkedList`1 extends System.Object
_[129].b = _[0];// XaeiOS.Process.DoublyLinkedListItem`1 extends System.Object
_[130].b = _[0];// XaeiOS.Process.SIPManager extends System.Object
_[133].b = _[0];// XaeiOS.Process.ImageFormat.ObjectImage extends System.Object
_[134].b = _[0];// XaeiOS.Process.ImageFormat.AssemblyName extends System.Object
_[135].b = _[13];// System.ExecutionEngineException extends System.Exception
_[137].b = _[0];// System.Collections.Generic.List`1 extends System.Object
_[138].b = _[0];// System.Collections.Generic.List`1/Enumerator extends System.Object
_[139].b = _[137];// System.Collections.ArrayList extends System.Collections.Generic.List`1<System.Object>
_[140].b = _[0];// System.String extends System.Object
String.prototype.$ = _[140];
_[148].b = _[0];// XaeiOS.Process.DynamicLinker extends System.Object
_[152].b = _[13];// System.NativeError extends System.Exception
_[153].b = _[0];// System.Diagnostics.ObjectDebugger extends System.Object
_[159].b = _[0];// System.Diagnostics.ObjectDebugger/IntRef extends System.Object
_[160].b = _[0];// System.Collections.Queue extends System.Object
_[167].b = _[22];// XaeiOS.TaskCallback extends System.MulticastDelegate
_[168].b = _[22];// XaeiOS.TaskFunction extends System.MulticastDelegate
_[180].b = _[0];// XaeiOS.OSCorlib extends System.Object
_[248].b = _[12];// System.NativeDate extends System.NativeObject
Date.prototype.$ = _[248];
_[249].b = _[0];// System.Threading.Semaphore extends System.Object
_[250].b = _[0];// System.Threading.Semaphore/WaitingTask extends System.Object
_[251].b = _[12];// System.NativeArray`1 extends System.NativeObject
_[252].b = _[251];// System.NativeArray extends System.NativeArray`1<System.var>
_[253].b = _[0];// System.Array extends System.Object
_[254].b = _[0];// XaeiOS.Boot.BootManager/<>c__DisplayClass1 extends System.Object
_[255].b = _[0];// XaeiOS.Process.SIP/<>c__DisplayClass1 extends System.Object
_[256].b = _[0];// XaeiOS.Kernel.TaskPriorityQueue extends System.Object
_[259].b = _[12];// XaeiOS.Kernel.Task extends System.NativeObject
_[264].b = _[22];// XaeiOS.Kernel.TaskCallback extends System.MulticastDelegate
_[265].b = _[22];// XaeiOS.Kernel.TaskFunction extends System.MulticastDelegate
_[277].b = _[12];// XaeiOS.Kernel.Frame extends System.NativeObject
_[281].b = _[0];// XaeiOS.Kernel.Scheduler extends System.Object
_[289].b = _[22];// XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate extends System.MulticastDelegate
_[293].b = _[252];// XaeiOS.Kernel.Continuation extends System.NativeArray
_[295].b = _[0];// XaeiOS.SystemCalls extends System.Object
_[296].b = _[0];// XaeiO.Compiler2.Tests.QuickSort extends System.Object
_[297].b = _[22];// XaeiO.Compiler2.Tests.QuickSort/Comparison`1 extends System.MulticastDelegate
_[298].b = _[0];// XaeiO.Compiler2.Tests.Program extends System.Object
},EntryPoint:$[313]};