var $=[

/************
Object image OSCorlib - Code: 0	Data: 0
**********/

function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[3].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = this.GetType()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t1 = __rv__*/;
					__rv__ = r0.$[0].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = $t1.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
					r0 = $[31](this)/*V_0.1 = System.Runtime.CompilerServices.RuntimeHelpers::NativeGetHashCode(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 3: System.Type System.Object::GetType()
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
					__rv__ = $[276](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*__rv__ = System.Reflection.ReflectionHelpers::GetType(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 4: System.String[] System.NativeObject::GetKeys()
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
					r0 = (function(obj){var keys = []; for(var i in obj){  if(i == "$"){ continue; } keys.push(i);}; return keys;})(this)/*V_0.1 = System.Runtime.CompilerServices.RuntimeHelpers::GetKeys(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //5: System.String System.NativeObject::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.NativeToString()*/;
	return r0/*V_0.1*/;

},
function()
 //6: System.Int32 System.NativeObject::GetHashCode()
{
	var r0;
	r0 = $[31](this)/*V_0.1 = System.Runtime.CompilerServices.RuntimeHelpers::NativeGetHashCode(this)*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 7: System.String System.Exception::get_Message()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 8: System.Exception System.Exception::get_InnerException()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 9: System.Exception System.Exception::GetBaseException()
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
					__rv__ = $[8].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0],[null,null,0])/*__rv__ = this.get_InnerException()*/;
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
					__rv__ = $[8].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r1,r0],[null,null,0])/*__rv__ = V_0.3.get_InnerException()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 10: System.String System.Exception::get_HelpLink()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 11: System.Void System.Exception::set_HelpLink(System.String)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 12: System.String System.Exception::get_Source()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 13: System.Void System.Exception::set_Source(System.String)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 14: System.String System.Exception::get_StackTrace()
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
					LogWrite("DEBUG", "_stackTrace is null.  Calling SystemCalls.GetStackTrace()")/*System.Diagnostics.Logging::Debug("_stackTrace is null.  Calling SystemCalls.GetStackTrace()")*/;
					r0 = this[0]/*$t11 = this._throwContext*/;
					__rv__ = $[344](r0)/*__rv__ = XaeiOS.SystemCalls::GetStackTrace($t11)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t12 = __rv__*/;
					this[3] = r0/*this._stackTrace = $t12*/;
					LogWrite("DEBUG", "_stackTrace is set!")/*System.Diagnostics.Logging::Debug("_stackTrace is set!")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 15: System.String System.Exception::ToString()
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
					__rv__ = $[3].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.GetType()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t1 = __rv__*/;
					__rv__ = $[7].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Message()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t4 = __rv__*/;
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,": ",r0])/*__rv__ = System.String::Concat($t1, ": ", $t4)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //16: System.Void System.Exception::.ctor()
{
	var r0;
	r0 = _[202].Empty/*$t1 = System.String::get_Empty()*/;
	$[18].call(this,r0,null)/*this..ctor($t1, null)*/;
	return;

},
function(a0/*message*/)
 //17: System.Void System.Exception::.ctor(System.String)
{
	$[18].call(this,a0,null)/*this..ctor(message, null)*/;
	return;

},
function(a0/*message*/,a1/*innerException*/)
 //18: System.Void System.Exception::.ctor(System.String,System.Exception)
{
	this[1] = a0/*this._message = message*/;
	this[2] = a1/*this._innerException = innerException*/;
	return;

},
function()
 //19: System.Void System.SystemException::.ctor()
{
	$[16].call(this)/*this..ctor()*/;
	return;

},
function(a0/*message*/)
 //20: System.Void System.SystemException::.ctor(System.String)
{
	$[17].call(this,a0)/*this..ctor(message)*/;
	return;

},
function(a0/*message*/,a1/*innerException*/)
 //21: System.Void System.SystemException::.ctor(System.String,System.Exception)
{
	$[18].call(this,a0,a1)/*this..ctor(message, innerException)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 22: System.Void System.InvalidOperationException::.ctor(System.String)
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
					$[20].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 23: System.Void System.Attribute::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //24: System.Void System.Resources.ResourceManager::Initialize()
{
	var r0;
	r0 = {$:_[89],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.NativeArray`1<System.IDisposable>>::.ctor()()*/;
	$[110].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*$t0..ctor()*/;
	_[13] = r0/*System.Resources.ResourceManager._resourceMap = $t0*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 25: System.Void System.Resources.ResourceManager::RegisterSIP(XaeiOS.Process.SIP)
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
					r0 = _[13]/*$t0 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
					r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t8 = new System.Void System.Exception::.ctor(System.String)("SIP is already set up")*/;
					$[17].call(r0,"SIP is already set up")/*$t8..ctor("SIP is already set up")*/;
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
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,"Registering SIP with ResourceManager: ",__f__[3]])/*__rv__ = System.String::Concat("Registering SIP with ResourceManager: ", sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = __rv__/*$t11 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t11)*/;
					r0 = _[13]/*$t12 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 26: System.Void System.Resources.ResourceManager::CleanupAndUnregisterSIP(XaeiOS.Process.SIP)
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
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,"Cleaning up SIP: ",__f__[3]])/*__rv__ = System.String::Concat("Cleaning up SIP: ", sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t2 = __rv__*/;
					LogWrite("INFO", r1)/*System.Diagnostics.Logging::Log($t2)*/;
					r1 = _[13]/*$t3 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
					r1 = _[13]/*$t11 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0,r2])/*__rv__ = System.String::Concat(V_2.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r1 = __rv__/*$t26 = __rv__*/;
					LogWrite("INFO", r1)/*System.Diagnostics.Logging::Log($t26)*/;
					r1 = r3[r0]/*$t28 = V_0.1.get_Item(V_1.3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					r1.$.i[67][0].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3],[null,null,0])/*$t28.Dispose()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 27: System.Void System.Resources.ResourceManager::RegisterResource(System.IDisposable)
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
					__rv__ = $[174](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::get_CurrentSIP()*/;
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
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t10 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t10)*/;
					r1 = _[13]/*$t11 = System.Resources.ResourceManager._resourceMap*/;
					__rv__ = $[174](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::get_CurrentSIP()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t12 = __rv__*/;
					__rv__ = $[161].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t12.get_ID()*/;
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
					LogWrite("INFO", "Resource successfully registered")/*System.Diagnostics.Logging::Log("Resource successfully registered")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 28: System.Void System.Resources.ResourceManager::FreeResource(System.IDisposable)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 29: System.Void System.Runtime.CompilerServices.RuntimeHelpers::Initialize()
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
					_[22] = 1/*System.Runtime.CompilerServices.RuntimeHelpers._hashCodeCounter = 1*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //30: System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::GenerateHashCode()
{
	var r0;
	r0 = _[22]/*$tf1 = System.Runtime.CompilerServices.RuntimeHelpers._hashCodeCounter*/;
	_[22] = (r0 + 1)/*System.Runtime.CompilerServices.RuntimeHelpers._hashCodeCounter = $tf1 Add 1*/;
	return r0/*$tf1*/;

},
function(a0/*obj*/)
 //31: System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::NativeGetHashCode(System.Object)
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
				r0 = $[30]()/*$t7 = System.Runtime.CompilerServices.RuntimeHelpers::GenerateHashCode()*/;
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
 //32: System.Object System.Runtime.CompilerServices.RuntimeHelpers::Cast(System.Runtime.CompilerServices.XaeiOSObject,System.Runtime.CompilerServices.VTable,System.Boolean)
{
	var r2,r0,r3,r4,r1;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r2 = (!(a0 == null))/*V_3.1 = BooleanNot obj ValueEquality null*/;
				if(r2)
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
				r2 = (!a2)/*V_3.2 = BooleanNot throwError*/
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
				r2 = {$:_[174],0:null,1:null,2:null,3:null}/*$t11 = new System.Void System.InvalidCastException::.ctor()()*/
				$[160].call(r2)/*$t11..ctor()*/;
				throw r2/*$t11*/;
			}
			case 4:
			{
				r1 = null/*V_2.1 = null*/
				__ep__ = 18;
				continue __ctrl__;
			}
			case 5:
			{
				__ep__ = 6
				r2 = a1.f/*$t14 = typeVtable.get_Flags()*/;
				r4 = (!((r2 & 1) == 0))/*V_0.1 = BooleanNot $t14 BitwiseAnd 1 ValueEquality 0*/;
				__rv__ = a0.$/*__rv__ = obj.get_VTable()*/;
			}
			case 6:
			{
				r0 = __rv__/*V_1.1 = __rv__*/
				r2 = (!(r0 == null))/*V_3.3 = BooleanNot V_1.3 ValueEquality null*/;
				if(r2)
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
				r2 = (!a2)/*V_3.4 = BooleanNot throwError*/
				if(r2)
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
				r2 = {$:_[174],0:null,1:null,2:null,3:null}/*$t35 = new System.Void System.InvalidCastException::.ctor()()*/
				$[160].call(r2)/*$t35..ctor()*/;
				throw r2/*$t35*/;
			}
			case 9:
			{
				r1 = null/*V_2.2 = null*/
				__ep__ = 18;
				continue __ctrl__;
			}
			case 10:
			{
				r2 = (!(r0 == a1))/*V_3.5 = BooleanNot V_1.3 ValueEquality typeVtable*/
				if(r2)
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
				r1 = a0/*V_2.3 = obj*/
				__ep__ = 18;
				continue __ctrl__;
			}
			case 12:
			{
				if((!r4))
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
				r2 = $[35](r0,a1)/*$t45 = System.Runtime.CompilerServices.RuntimeHelpers::ImplementsInterface(V_1.3, typeVtable)*/
				r2 = (!r2)/*$ts0 = BooleanNot $t45*/;
				__ep__ = 15;
				continue __ctrl__;
			}
			case 14:
			{
				r2 = 1/*$ts0 = 1*/
				__ep__ = 15;
			}
			case 15:
			{
				r2 = r2/*V_3.6 = $ts0*/
				if(r2)
				{
					__ep__ = 16;

				}
				else
				{
					__ep__ = 17
					continue __ctrl__;

				}
			}
			case 16:
			{
				__ep__ = 6
				__rv__ = r0.b/*__rv__ = V_1.3.get_BaseVTable()*/;
				continue __ctrl__;
			}
			case 17:
			{
				r1 = a0/*V_2.4 = obj*/
				__ep__ = 18;
			}
			case 18:
			{
				return r1/*V_2.5*/
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*obj*/,a1/*typeVtable*/,a2/*throwError*/)
 //33: System.Object System.Runtime.CompilerServices.RuntimeHelpers::DeprecatedCast(System.NativeObject,System.NativeObject,System.Boolean)
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
				r1 = {$:_[174],0:null,1:null,2:null,3:null}/*$t11 = new System.Void System.InvalidCastException::.ctor()()*/
				$[160].call(r1)/*$t11..ctor()*/;
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
				r1 = {$:_[174],0:null,1:null,2:null,3:null}/*$t39 = new System.Void System.InvalidCastException::.ctor()()*/
				$[160].call(r1)/*$t39..ctor()*/;
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
				r1 = $[35](r4,a1)/*$t49 = System.Runtime.CompilerServices.RuntimeHelpers::ImplementsInterface(V_1.1, typeVtable)*/
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
				r4 = r4["b"]/*System.Runtime.CompilerServices.RuntimeHelpers::GenerateCodeToAssignToBaseVTable(V_1.1)*/;
				continue __ctrl__;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*obj*/,a1/*typeVTable*/)
 //34: System.Object System.Runtime.CompilerServices.RuntimeHelpers::TryCast(System.Runtime.CompilerServices.XaeiOSObject,System.Runtime.CompilerServices.VTable)
{
	var r0;
	r0 = $[32](a0,a1,0)/*V_0.1 = System.Runtime.CompilerServices.RuntimeHelpers::Cast(obj, typeVTable, 0)*/;
	return r0/*V_0.1*/;

},
function(a0/*vtable*/,a1/*interfaceVtable*/)
 //35: System.Boolean System.Runtime.CompilerServices.RuntimeHelpers::ImplementsInterface(System.NativeObject,System.NativeObject)
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
				r3 = (function(obj){var keys = []; for(var i in obj){  if(i == "$"){ continue; } keys.push(i);}; return keys;})(r2)/*V_1.1 = System.Runtime.CompilerServices.RuntimeHelpers::GetKeys(V_0.1)*/;
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
				r2 = _[r3[r0]]/*$t12 = System.Runtime.CompilerServices.RuntimeHelpers::GenerateCodeToDereferenceDataPointer(V_1.1[V_2.3])*/
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
// 36: System.Boolean System.Runtime.CompilerServices.RuntimeHelpers::TypesEqual(System.Object,System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(a0/*ns*/,a1/*name*/)
 //37: System.Runtime.CompilerServices.Class System.Runtime.CompilerServices.RuntimeHelpers::CreateClass(System.String,System.String)
{
	var r0;
	r0 = {$:_[302],0:null,1:null,2:null}/*$t0 = new System.Void System.Runtime.CompilerServices.Class::.ctor()()*/;
	$[273].call(r0)/*$t0..ctor()*/;
	$[268].call(r0,a1)/*$t0.set_Name(name)*/;
	$[270].call(r0,a0)/*$t0.set_Namespace(ns)*/;
	return r0/*$t0*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 38: System.String System.Console::ReadLine()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 39: System.Int32 System.Console::Read()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 40: System.String System.Console::get_Title()
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotSupportedException::.ctor()()*/;
					$[146].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 41: System.Void System.Console::set_Title(System.String)
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotSupportedException::.ctor()()*/;
					$[146].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 42: System.Void System.Console::Write(System.String)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 43: System.Void System.Console::WriteLine(System.String)
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
					$[42](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*System.Console::Write($t2)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 44: System.Void System.Console::WriteLine()
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
					$[42](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,"\n"])/*System.Console::Write("
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 45: System.Int32 System.Threading.Thread::get_ID()
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
					r0 = this[0]/*V_0.1 = this._taskId*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 46: XaeiOS.Process.SIP System.Threading.Thread::get_SIP()
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
					r0 = this[1]/*V_0.1 = this._sip*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 47: System.Threading.ThreadPriority System.Threading.Thread::get_Priority()
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
					r0 = this[4]/*V_0.1 = this._priority*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 48: System.Boolean System.Threading.Thread::get_Blocked()
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
					r0 = this[5]/*V_0.1 = this._blocked*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 49: System.Exception System.Threading.Thread::get_UnhandledException()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 50: System.Threading.ThreadCallback System.Threading.Thread::get_Callback()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 51: System.Void System.Threading.Thread::set_Callback(System.Threading.ThreadCallback)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 52: System.String System.Threading.Thread::get_Name()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 53: System.Void System.Threading.Thread::set_Name(System.String)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 54: System.Boolean System.Threading.Thread::get_IsBackground()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 55: System.Void System.Threading.Thread::set_IsBackground(System.Boolean)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t2..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 56: System.Void System.Threading.Thread::Start()
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotSupportedException::.ctor(System.String)("The thread start delegate was parametized.  Cannot start this thread without a parameter.")*/;
					$[147].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"The thread start delegate was parametized.  Cannot start this thread without a parameter."])/*$t9..ctor("The thread start delegate was parametized.  Cannot start this thread without a parameter.")*/;
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
					r0 = this[1]/*$t25 = this._sip*/
					r0 = (!(r0 == null))/*V_0.3 = BooleanNot $t25 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 11;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 9
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = $[174](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::get_CurrentSIP()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r0 = __rv__/*$t33 = __rv__*/
					this[1] = r0/*this._sip = $t33*/;
					__ep__ = 11;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r0 = this[2]/*$t37 = this._threadStart*/;
					r3 = $[134].call($[75],r0)/*$t39 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)($t37, System.Threading.ThreadStart::Invoke)*/;
					/*$t39..ctor($t37, System.Threading.ThreadStart::Invoke)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					r2 = $[134].call($[61],this)/*$t42 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::InternalCallback)*/;
					/*$t42..ctor(this, System.Threading.Thread::InternalCallback)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					r1 = this[4]/*$t44 = this._priority*/;
					r0 = this[11]/*$t46 = this._name*/;
					__rv__ = $[343](null,r3,r2,r1,r0)/*__rv__ = XaeiOS.SystemCalls::CreateTask(null, $t39, $t42, $t44, $t46)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					r0 = __rv__/*$t47 = __rv__*/;
					this[0] = r0/*this._taskId = $t47*/;
					r1 = this[11]/*$t50 = this._name*/;
					r0 = this[0]/*$t53 = this._taskId*/;
					r0 = r0.toString()/*$t54 = $t53.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					__ep__ = 16
					r0 = ["Creating thread ", r1, " with task id: ", r0].join('')/*$t55 = System.String::Concat("Creating thread ", $t50, " with task id: ", $t54)*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t55)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					__ep__ = 17
					$[129](this)/*System.Threading.ThreadManager::RegisterThread(this)*/;
					this[6] = 1/*this._running = 1*/;
					r0 = this[0]/*$t60 = this._taskId*/;
					$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t60)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 17:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 57: System.Void System.Threading.Thread::Start(System.Object)
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotSupportedException::.ctor(System.String)("The thread start delegate was not parametized.  Cannot start this thread with a parameter.")*/;
					$[147].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"The thread start delegate was not parametized.  Cannot start this thread with a parameter."])/*$t9..ctor("The thread start delegate was not parametized.  Cannot start this thread with a parameter.")*/;
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
					r3 = $[134].call($[60],this)/*$t26 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::ParametizedTaskFunction)*/;
					/*$t26..ctor(this, System.Threading.Thread::ParametizedTaskFunction)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2 = $[134].call($[61],this)/*$t29 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::InternalCallback)*/;
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
					__rv__ = $[343](null,r3,r2,r1,r0)/*__rv__ = XaeiOS.SystemCalls::CreateTask(null, $t26, $t29, $t31, $t33)*/;
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
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t42)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					$[129](this)/*System.Threading.ThreadManager::RegisterThread(this)*/;
					this[6] = 1/*this._running = 1*/;
					r0 = this[0]/*$t47 = this._taskId*/;
					$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t47)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 58: System.Void System.Threading.Thread::Abort()
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
					$[59].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,null])/*this.Abort(null)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 59: System.Void System.Threading.Thread::Abort(System.Object)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 60: System.Void System.Threading.Thread::ParametizedTaskFunction()
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
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,[r1]])/*$t1.Invoke($t3)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //61: System.Void System.Threading.Thread::InternalCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)
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
				LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t5)*/;
				this[6] = 0/*this._running = 0*/;
				LogWrite("INFO", "Unregistering thread")/*System.Diagnostics.Logging::Log("Unregistering thread")*/;
				$[130](this)/*System.Threading.ThreadManager::UnregisterThread(this)*/;
				r0 = this[10]/*$t11 = this._callback*/;
				r0 = (r0 == null)/*V_1.1 = $t11 ValueEquality null*/;
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
				LogWrite("INFO", "Creating seperate task for thread callback")/*System.Diagnostics.Logging::Log("Creating seperate task for thread callback")*/
				r0 = (!(a3 == 1))/*V_1.2 = BooleanNot exitStatus ValueEquality 1*/;
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
				this[9] = $[34](a2,_[4])/*this._unhandledException = returnValue is System.Exception*/
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
				r0 = a2.toString()/*$t47 = returnValue.NativeToString()*/
				r1 = {$:_[192],0:null,1:null,2:null,3:null}/*$t48 = new System.Void System.ExecutionEngineException::.ctor(System.String)($t47)*/;
				$[199].call(r1,r0)/*$t48..ctor($t47)*/;
				this[9] = r1/*this._unhandledException = $t48*/;
				__ep__ = 6;
			}
			case 6:
			{
				__ep__ = 7
				LogWrite("INFO", "Creating a separate task for thread callback method")/*System.Diagnostics.Logging::Log("Creating a separate task for thread callback method")*/;
				r0 = this[10]/*$t30 = this._callback*/;
				r1 = $[134].call($[75],r0)/*$t32 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)($t30, System.Threading.ThreadCallback::Invoke)*/;
				/*$t32..ctor($t30, System.Threading.ThreadCallback::Invoke)*/r0 = $[343](null,r1,null,1,"Thread callback")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t32, null, 1, "Thread callback")*/;
				$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
			}
			case 7:
			{
				LogWrite("INFO", "Thread internal callback complete")/*System.Diagnostics.Logging::Log("Thread internal callback complete")*/
				return;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*milliseconds*/)
 //62: System.Void System.Threading.Thread::InternalSleep(System.Int32)
{
	var r0;
	r0 = this[5]/*$t1 = this._blocked*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t1*/;
	if(r0)
	{
		r0 = this[0]/*$t16 = this._taskId*/;
		$[338](r0)/*XaeiOS.SystemCalls::BlockTask($t16)*/;
		r0 = $[134].call($[64],this)/*$t20 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::WakeUp)*/;
		/*$t20..ctor(this, System.Threading.Thread::WakeUp)*/r0 = $[135](r0)/*$t21 = System.NativeFunction::op_Explicit($t20)*/;
		r0 = setTimeout(r0, a0)/*$t24 = System.Global::SetTimeout($t21, (System.Int64)milliseconds)*/;
		this[7] = r0/*this._unblockTimeoutId = $t24*/;
		this[5] = 1/*this._blocked = 1*/;
		this[6] = 0/*this._running = 0*/;

	}
	else
	{
		r0 = this[7]/*$t6 = this._unblockTimeoutId*/
		clearTimeout(r0)/*System.Global::ClearTimeout($t6)*/;
		r0 = $[134].call($[64],this)/*$t10 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.Thread::WakeUp)*/;
		/*$t10..ctor(this, System.Threading.Thread::WakeUp)*/r0 = $[135](r0)/*$t11 = System.NativeFunction::op_Explicit($t10)*/;
		r0 = setTimeout(r0, a0)/*$t14 = System.Global::SetTimeout($t11, (System.Int64)milliseconds)*/;
		this[7] = r0/*this._unblockTimeoutId = $t14*/;

	}
	return;

},
function()
 //63: System.Void System.Threading.Thread::InternalSleep()
{
	var r0;
	r0 = this[5]/*$t1 = this._blocked*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t1*/;
	if(r0)
	{
		r0 = this[0]/*$t8 = this._taskId*/;
		$[338](r0)/*XaeiOS.SystemCalls::BlockTask($t8)*/;
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
 //64: System.Void System.Threading.Thread::WakeUp()
{
	var r0;
	r0 = this[5]/*V_0.1 = this._blocked*/;
	if(r0)
	{
		this[5] = 0/*this._blocked = 0*/;
		this[6] = 1/*this._running = 1*/;
		r0 = this[0]/*$t9 = this._taskId*/;
		$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t9)*/;
		return;

	}
	else
	{
		r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t3 = new System.Void System.Exception::.ctor(System.String)("Illegal thread state.  Cannot unblock a thread that is not blocked.")*/
		$[17].call(r0,"Illegal thread state.  Cannot unblock a thread that is not blocked.")/*$t3..ctor("Illegal thread state.  Cannot unblock a thread that is not blocked.")*/;
		throw r0/*$t3*/;

	}

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 65: System.String System.Threading.Thread::ToString()
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,": ",r0])/*__rv__ = System.String::Concat($t1, ": ", $t4)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 66: System.Void System.Threading.Thread::Sleep(System.Int32)
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
					r0 = $[128]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
					$[62].call(r0,__f__[3])/*$t0.InternalSleep(milliseconds)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[340](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 67: System.Void System.Threading.Thread::Sleep()
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
					r0 = $[128]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
					$[63].call(r0)/*$t0.InternalSleep()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[340](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 68: System.Threading.Thread[] System.Threading.Thread::GetThreads()
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
					__rv__ = $[132](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = System.Threading.ThreadManager::GetThreads()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //69: System.Void System.Threading.Thread::ExecuteAsync(System.Threading.ThreadStart)
{
	var r0;
	r0 = $[134].call($[75],a0)/*$t3 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(threadStart, System.Threading.ThreadStart::Invoke)*/;
	/*$t3..ctor(threadStart, System.Threading.ThreadStart::Invoke)*/r0 = $[343](null,r0,null,3,"Thread pool thread")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t3, null, 3, "Thread pool thread")*/;
	$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 70: System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart)
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
					$[71].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],3])/*this..ctor(threadStart, 3)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 71: System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 72: System.Void System.Threading.Thread::.ctor(System.Threading.ParametizedThreadStart,System.Threading.ThreadPriority)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //73: System.Object System.Delegate::get_Target()
{
	var r0;
	r0 = this[0]/*V_0.1 = this._target*/;
	return r0/*V_0.1*/;

},
function()
 //74: System.NativeFunction System.Delegate::get_Function()
{
	var r0;
	r0 = this[1]/*V_0.1 = this._function*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 75: System.Object System.Delegate::Invoke(System.Object[])
{
	return this[1].apply(this[0], [1,__end__,0,null,null,__pco__,[null,null,0].concat(__f__[3])]);
},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 76: System.Object System.Delegate::InvokeNative(System.Object[])
{
	if(typeof(this) == 'function'){return this.apply(null, arguments);}else{return this[1].apply(this[0], arguments);}
},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 77: System.Void System.Delegate::InternalCombine(System.Delegate)
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
					r0 = {$:_[172],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.MulticastNotSupportedException::.ctor()()*/;
					$[159].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //78: System.Void System.Delegate::InternalCreate(System.Delegate,System.Object,System.NativeFunction)
{
	a0[0] = a1/*d._target = target*/;
	a0[1] = a2/*d._function = function*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0)
// 79: System.Delegate System.Delegate::BrokenCombine(System.Delegate,System.Delegate)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					r2 = (!(__f__[3] == null))/*V_2.1 = BooleanNot a ValueEquality null*/;
					if(r2)
					{
						__ep__ = 3;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

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
					r2 = (!(__f__[4] == null))/*V_2.2 = BooleanNot b ValueEquality null*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

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
					r1 = $[34](__f__[3],_[30])/*V_0.1 = a is System.MulticastDelegate*/
					r2 = (!($[34](__f__[3],_[30]) == null))/*V_2.3 = BooleanNot a is System.MulticastDelegate ValueEquality null*/;
					if(r2)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					r2 = __f__[3][0]/*$t25 = a._target*/;
					r3 = __f__[3][1]/*$t27 = a._function*/;
					__rv__ = $[90](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0],[null,null,0,r2,r3])/*__rv__ = System.MulticastDelegate::InternalCreate($t25, $t27)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r1 = __rv__/*V_0.2 = __rv__*/;
					r1.$[5].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0],[null,null,0,__f__[4]])/*V_0.3.InternalCombine(b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = r1/*V_1.3 = V_0.3*/
					__ep__ = 9;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r1,r0]/*e._throwContext = [dynamic expression]*/;

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
// 80: System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
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
					__ep__ = 11;
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
					__ep__ = 11;
					continue __ctrl__;
				}
				case 5:
				{
					r1 = (!($[34](__f__[3],_[30]) == null))/*V_2.3 = BooleanNot a is System.MulticastDelegate ValueEquality null*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					r2 = __f__[3][0]/*$t25 = a._target*/;
					r1 = __f__[3][1]/*$t27 = a._function*/;
					__rv__ = $[90](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0],[null,null,0,r2,r1])/*__rv__ = System.MulticastDelegate::InternalCreate($t25, $t27)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r1 = __rv__/*V_0.2 = __rv__*/;
					r1.$[5].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0],[null,null,0,__f__[4]])/*V_0.2.InternalCombine(b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = r1/*V_1.3 = V_0.2*/
					__ep__ = 11;
					continue __ctrl__;
				}
				case 9:
				{
					__ep__ = 10
					$[34](__f__[3],_[30]).$[5].call($[34](__f__[3],_[30]),1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0],[null,null,0,__f__[4]])/*a is System.MulticastDelegate.InternalCombine(b)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r0 = $[34](__f__[3],_[30])/*V_1.4 = a is System.MulticastDelegate*/
					__ep__ = 11;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					return r0/*V_1.5*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 81: System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
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
					r0 = {$:_[172],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.MulticastNotSupportedException::.ctor(System.String)("Delegate::Remove not yet implemented")*/;
					$[158].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Delegate::Remove not yet implemented"])/*$t1..ctor("Delegate::Remove not yet implemented")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 82: System.Boolean System.Delegate::op_Equality(System.Delegate,System.Delegate)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 83: System.Boolean System.Delegate::op_Inequality(System.Delegate,System.Delegate)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //84: System.Void System.Delegate::.ctor()
{
	return;

},
function(a0/*target*/,a1/*function*/)
 //85: System.Void System.Delegate::.ctor(System.Object,System.NativeFunction)
{
	$[78](this,a0,a1)/*System.Delegate::InternalCreate(this, target, function)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0)
// 86: System.Object System.MulticastDelegate::Invoke(System.Object[])
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
					__rv__ = $[75].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,__f__[3]])/*__rv__ = this.Invoke(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					r1 = this[2]/*$t4 = this._next*/;
					r1 = (r1 == null)/*V_2.1 = $t4 ValueEquality null*/;
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
					__ep__ = 4
					r1 = this[2]/*$t9 = this._next*/;
					__rv__ = r1.$[3].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,__f__[3]])/*__rv__ = $t9.Invoke(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0 = __rv__/*V_0.2 = __rv__*/
					return r0/*V_0.3*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 87: System.Object System.MulticastDelegate::InvokeNative(System.Object[])
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
					r0 = {$:_[172],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.MulticastNotSupportedException::.ctor(System.String)("Native multicast delegates are not supported")*/;
					$[158].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Native multicast delegates are not supported"])/*$t1..ctor("Native multicast delegates are not supported")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 88: System.Void System.MulticastDelegate::InternalCombine(System.Delegate)
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
					r1 = $[34](__f__[3],_[30])/*V_1.1 = d is System.MulticastDelegate*/
					r2 = (!($[34](__f__[3],_[30]) == null))/*V_2.2 = BooleanNot d is System.MulticastDelegate ValueEquality null*/;
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
					r3 = $[73].call(__f__[3])/*$t17 = d.get_Target()*/;
					__rv__ = $[74].call(__f__[3])/*__rv__ = d.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r2 = __rv__/*$t19 = __rv__*/;
					r4 = {$:_[30],0:null,1:null,2:null,3:null}/*$t20 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t17, $t19)*/;
					$[91].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0],[null,null,0,r3,r2])/*$t20..ctor($t17, $t19)*/;
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
					__rv__ = $[89].call($[34](__f__[3],_[30]),1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r4,r1,r0],[null,null,0])/*__rv__ = d is System.MulticastDelegate.Clone()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 89: System.MulticastDelegate System.MulticastDelegate::Clone()
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
					r3 = $[73].call(this)/*$t1 = this.get_Target()*/;
					__rv__ = $[74].call(this)/*__rv__ = this.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*$t3 = __rv__*/;
					r5 = {$:_[30],0:null,1:null,2:null,3:null}/*$t4 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t1, $t3)*/;
					$[91].call(r5,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5],[null,null,0,r3,r2])/*$t4..ctor($t1, $t3)*/;
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
					r3 = $[73].call(r1)/*$t12 = V_2.3.get_Target()*/;
					__rv__ = $[74].call(r1)/*__rv__ = V_2.3.get_Function()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r2 = __rv__/*$t13 = __rv__*/;
					r4 = {$:_[30],0:null,1:null,2:null,3:null}/*$t14 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)($t12, $t13)*/;
					$[91].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r3,r0,r4,r1,r5],[null,null,0,r3,r2])/*$t14..ctor($t12, $t13)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 90: System.MulticastDelegate System.MulticastDelegate::InternalCreate(System.Object,System.NativeFunction)
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
					r0 = {$:_[30],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)(target, function)*/;
					$[91].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4]])/*$t2..ctor(target, function)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 91: System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)
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
					$[85].call(this,__f__[3],__f__[4])/*this..ctor(target, function)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 92: System.Void System.OverflowException::.ctor()
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
					$[16].call(this)/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //93: System.String System.Int32::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 94: System.Int32 System.Int32::GetHashCode()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //95: System.String System.Decimal::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 96: System.Void System.Collections.Generic.KeyValuePair`2::.ctor(K,V)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //97: System.String System.Int64::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.ToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 98: System.String System.Type::ToString()
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
					__rv__ = this.$[4].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Namespace()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = __rv__/*$t1 = __rv__*/;
					__rv__ = this.$[3].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_Name()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t4 = __rv__*/
					r0 = (r1 + "." + r0)/*V_0.1 = System.String::Concat($t1, ".", $t4)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 99: System.Void System.Type::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //100: System.Void System.Boolean::.cctor()
{
	_[78] = "False"/*System.Boolean.FalseString = "False"*/;
	_[79] = "True"/*System.Boolean.TrueString = "True"*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 101: System.Int32 System.Collections.Generic.Dictionary`2::get_Count()
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
					__rv__ = r0.length/*__rv__ = $t1.get_Length()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 102: V System.Collections.Generic.Dictionary`2::get_Item(K)
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
					r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t7 = new System.Void System.Exception::.ctor(System.String)("Key not found")*/;
					$[17].call(r0,"Key not found")/*$t7..ctor("Key not found")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 103: System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V)
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
					__rv__ = r0.length/*__rv__ = $t10.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t12 = __rv__*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 104: System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 105: System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 106: System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6)
// 107: System.Boolean System.Collections.Generic.Dictionary`2::Remove(K)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = __f__[3].$[1].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6],[null,null,0])/*__rv__ = key.GetHashCode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r3 = __rv__/*V_0.1 = __rv__*/;
					r2 = this[2]/*$t3 = this._internalObject*/;
					r2 = r3 in r2/*V_7.1 = $t3.ContainsKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					r0 = 0/*V_6.1 = 0*/
					__ep__ = 13;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					r2 = this[1]/*$t8 = this._keysToIndexMapping*/;
					r5 = r2[r3]/*V_1.1 = $t8.get_Item(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r2 = this[1]/*$t13 = this._keysToIndexMapping*/;
					delete r2[r3]/*$t13.RemoveKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r4 = new Array()/*$t15 = new System.Void System.NativeArray`1<K>::.ctor()()*/;
					r2 = this[0]/*$t17 = this._keys*/;
					r2.length/*$t17.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r2 = this[0]/*$t20 = this._keys*/;
					__rv__ = r2.length/*__rv__ = $t20.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					r6 = __rv__/*$t21 = __rv__*/
					r1 = 0/*V_5.1 = 0*/;
					__ep__ = 10;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r2 = (r1 < (r6 - 1))/*V_7.2 = V_5.3 LessThan $t21 Subtract 1*/
					if(r2)
					{
						__ep__ = 14;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 11
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

						}

					}
				}
				case 11:
				{
					__ep__ = 12
					this[0] = r4/*this._keys = $t15*/;
					r2 = this[2]/*$t29 = this._internalObject*/;
					delete r2[r3]/*$t29.RemoveKey(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					r0 = 1/*V_6.2 = 1*/
					__ep__ = 13;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					return r0/*V_6.3*/
				}
				case 14:
				{
					r2 = (!(r1 == r5))/*V_7.3 = BooleanNot V_5.3 ValueEquality V_1.1*/
					if(r2)
					{
						__ep__ = 15;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 17
						continue __ctrl__;

					}
				}
				case 15:
				{
					__ep__ = 16
					r2 = this[0]/*$t40 = this._keys*/;
					r2 = r2[r1]/*$t42 = $t40.get_Item(V_5.3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					__ep__ = 17
					r4.push(r2)/*$t15.Push($t42)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*[dynamic expression]*/;

					}
				}
				case 17:
				{
					r1 = (r1 + 1)/*V_5.2 = V_5.3 Add 1*/
					__ep__ = 10;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1,r3,r4,r5,r6]/*e._throwContext = [dynamic expression]*/;

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
// 108: System.Void System.Collections.Generic.Dictionary`2::Clear()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3)
// 109: V[] System.Collections.Generic.Dictionary`2::GetValues()
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
					r1 = this[2]/*$t1 = this._internalObject*/;
					__rv__ = $[4].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0])/*__rv__ = $t1.GetKeys()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r2 = __rv__/*V_0.1 = __rv__*/
					r3 = new Array(r2.length)/*V_1.1 = new V[(System.Int32)V_0.1.Length]*/;
					r0 = 0/*V_2.1 = 0*/;
					__ep__ = 3;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r1 = (r0 < r2.length)/*V_4.1 = V_2.3 LessThan (System.Int32)V_0.1.Length*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					return r3/*V_1.1*/
				}
				case 5:
				{
					__ep__ = 6
					r1 = this[2]/*$t12 = this._internalObject*/;
					r1 = r1[r2[r0]]/*$t15 = $t12.get_Item(V_0.1[V_2.3])*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r3[r0] = r1/*V_1.1[V_2.3] = $t15*/
					r0 = (r0 + 1)/*V_2.2 = V_2.3 Add 1*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 110: System.Void System.Collections.Generic.Dictionary`2::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 111: System.Void System.Collections.Generic.Dictionary`2::.ctor(System.Collections.Generic.Dictionary`2<K,V>)
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
					$[110].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //112: System.String System.var::ToString()
{
	var r0;
	r0 = this.toString()/*V_0.1 = this.NativeToString()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 113: System.Void System.var::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 114: System.Void System.Reflection.MethodInfo::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 115: System.Boolean System.WeakReference::get_IsAlive()
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[147].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t1..ctor("WeakReference not supported")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 116: System.Object System.WeakReference::get_Target()
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[147].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t1..ctor("WeakReference not supported")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 117: System.Void System.WeakReference::.ctor(System.Object)
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
					r0 = {$:_[154],0:null,1:null,2:null,3:null}/*$t2 = new System.Void System.NotSupportedException::.ctor(System.String)("WeakReference not supported")*/;
					$[147].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"WeakReference not supported"])/*$t2..ctor("WeakReference not supported")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 118: System.Void System.Threading.Lock::Acquire()
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
					__rv__ = $[342]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
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
					$[338](r2)/*XaeiOS.SystemCalls::BlockTask(V_0.1)*/;
					$[340](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 119: System.Boolean System.Threading.Lock::TryAcquire()
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
					r2 = $[342]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //120: System.Void System.Threading.Lock::Release()
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
				r0 = $[342]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
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
				$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($tf23)*/;
			}
			case 4:
			{
				return
			}
			case 5:
			{
				r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t25 = new System.Void System.Exception::.ctor(System.String)("Cannot release lock.  Current thread is not owner")*/
				$[17].call(r0,"Cannot release lock.  Current thread is not owner")/*$t25..ctor("Cannot release lock.  Current thread is not owner")*/;
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
// 121: System.Void System.Threading.Lock::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //122: System.Void System.NullReferenceException::.ctor()
{
	$[19].call(this)/*this..ctor()*/;
	return;

},
function(a0/*message*/)
 //123: System.Void System.NullReferenceException::.ctor(System.String)
{
	$[20].call(this,a0)/*this..ctor(message)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 124: System.Void System.NullReferenceException::.ctor(System.String,System.Exception)
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
					$[21].call(this,__f__[3],__f__[4])/*this..ctor(message, innerException)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 125: System.Void System.EventArgs::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 126: System.Void System.EventArgs::.cctor()
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
					r0 = {$:_[105]}/*$t0 = new System.Void System.EventArgs::.ctor()()*/;
					$[125].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					_[106] = r0/*System.EventArgs.Empty = $t0*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 127: System.Void System.ArgumentOutOfRangeException::.ctor(System.String)
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
					$[17].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //128: System.Threading.Thread System.Threading.ThreadManager::get_CurrentThread()
{
	var r0,r1;
	r0 = _[135]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = $[342]()/*$t1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
	r0 = r0.$[4].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1])/*V_0.1 = $t0.get_Item($t1)*/;
	return r0/*V_0.1*/;

},
function(a0/*thread*/)
 //129: System.Void System.Threading.ThreadManager::RegisterThread(System.Threading.Thread)
{
	var r0,r1;
	r0 = _[135]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = a0[0]/*$t2 = thread._taskId*/;
	r0.$[5].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1,a0])/*$t0.set_Item($t2, thread)*/;
	return;

},
function(a0/*thread*/)
 //130: System.Void System.Threading.ThreadManager::UnregisterThread(System.Threading.Thread)
{
	var r0,r1;
	LogWrite("INFO", "ThreadManager::UnregisterThread")/*System.Diagnostics.Logging::Log("ThreadManager::UnregisterThread")*/;
	r0 = _[135]/*$t1 = System.Threading.ThreadManager._threadsByTaskId*/;
	r1 = a0[0]/*$t3 = thread._taskId*/;
	r0.$[9].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0,r1])/*$t1.Remove($t3)*/;
	return;

},
function()
 //131: System.Void System.Threading.ThreadManager::Initialize()
{
	var r0;
	r0 = {$:_[89],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Threading.Thread>::.ctor()()*/;
	$[110].call(r0,1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*$t0..ctor()*/;
	_[135] = r0/*System.Threading.ThreadManager._threadsByTaskId = $t0*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 132: System.Threading.Thread[] System.Threading.ThreadManager::GetThreads()
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
					r0 = _[135]/*$t0 = System.Threading.ThreadManager._threadsByTaskId*/;
					__rv__ = $[109].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = $t0.GetValues()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 133: System.String System.NativeFunction::ToString()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(a0/*self*/)
 //134: System.NativeFunction System.NativeFunction::Bind(System.var)
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
 //135: System.NativeFunction System.NativeFunction::op_Explicit(System.Delegate)
{
	var r0;
	r0 = typeof(a0)/*$t2 = d.TypeOf()*/;
	r0 = (r0 == "function")/*$t4 = System.String::op_Equality($t2, "function")*/;
	r0 = (!r0)/*V_2.1 = BooleanNot $t4*/;
	if(r0)
	{
		r0 = {$:_[174],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.InvalidCastException::.ctor()()*/;
		$[160].call(r0)/*$t9..ctor()*/;
		throw r0/*$t9*/;

	}
	else
	{
		return a0/*d*/

	}

},
function(a0/*initDelegate*/)
 //136: System.Void XaeiOS.Boot.BootManager::Boot(System.VoidDelegate)
{
	var r0,r1;
	r0 = _[140]/*$t0 = XaeiOS.Boot.BootManager._booting*/;
	r0 = (!r0)/*V_1.1 = BooleanNot $t0*/;
	if(r0)
	{
		r0 = _[141]/*$t6 = XaeiOS.Boot.BootManager._booted*/;
		r0 = (!r0)/*V_1.2 = BooleanNot $t6*/;
		if(r0)
		{
			r0 = (!(a0 == null))/*V_1.3 = BooleanNot initDelegate ValueEquality null*/;
			if(r0)
			{
				_[140] = 1/*XaeiOS.Boot.BootManager._booting = 1*/;
				$[336]()/*XaeiOS.SystemCalls::InitializeKernel()*/;
				$[258]()/*XaeiOS.OSCorlib::Initialize()*/;
				_[142] = a0/*XaeiOS.Boot.BootManager._initDelegate = initDelegate*/;
				r1 = $[138]/*$t26 = new System.Void XaeiOS.TaskFunction::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Boot.BootManager::CreateInitProcess)*/;
				/*$t26..ctor(null, XaeiOS.Boot.BootManager::CreateInitProcess)*/r0 = $[137]/*$t29 = new System.Void XaeiOS.TaskCallback::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Boot.BootManager::BootCallback)*/;
				/*$t29..ctor(null, XaeiOS.Boot.BootManager::BootCallback)*/r0 = $[343](null,r1,r0,3,"XaeiOS.Boot")/*V_0.1 = XaeiOS.SystemCalls::CreateTask(null, $t26, $t29, 3, "XaeiOS.Boot")*/;
				$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask(V_0.1)*/;
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
 //137: System.Void XaeiOS.Boot.BootManager::BootCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)
{
	var r0;
	r0 = _[141]/*V_0.1 = XaeiOS.Boot.BootManager._booted*/;
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
// 138: System.Void XaeiOS.Boot.BootManager::CreateInitProcess()
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
					r2 = {$:_[311],0:null}/*$t0 = new System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::.ctor()()*/;
					$[282].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = _[142]/*$t1 = XaeiOS.Boot.BootManager._initDelegate*/;
					r1 = {$:_[34],0:null,1:null,2:null,3:null}/*$t3 = new System.Void System.Threading.ThreadStart::.ctor(System.Object,System.IntPtr)($t1, System.VoidDelegate::Invoke)*/;
					$[78](r1,r0,$[76])/*$t3..ctor($t1, System.VoidDelegate::Invoke)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = {$:_[178],0:null,1:null,2:null,3:0,4:null,5:0,6:null,7:null}/*$t6 = new System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)($t3, 3, "XaeiOS.Init")*/;
					$[176].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1,3,"XaeiOS.Init"])/*$t6..ctor($t3, 3, "XaeiOS.Init")*/;
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
					r1 = {$:_[32],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.Threading.ThreadCallback::.ctor(System.Object,System.IntPtr)($t0, XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0)*/;
					$[78](r1,r2,$[281])/*$t9..ctor($t0, XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[164].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t7.set_Callback($t9)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = r2[0]/*$t10 = $t0.initProcess*/;
					$[165].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t10.Start()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					_[141] = 1/*XaeiOS.Boot.BootManager._booted = 1*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 139: System.Void System.Threading.Condition::Signal()
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
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[1]/*$t3 = this._waitingList*/;
					__rv__ = r0.length/*__rv__ = $t3.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t4 = __rv__*/
					r0 = (!(r0 > 0))/*V_0.1 = BooleanNot $t4 GreaterThan 0*/;
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
					$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t13)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = this[0]/*$t15 = this._lock*/;
					$[120].call(r0)/*$t15.Release()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 140: System.Void System.Threading.Condition::Await()
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
					$[120].call(r0)/*$t1.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r1 = $[342]()/*V_0.1 = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
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
					$[338](r1)/*XaeiOS.SystemCalls::BlockTask(V_0.1)*/;
					$[340](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[0]/*$t6 = this._lock*/;
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t6.Acquire()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 141: System.Void System.Threading.Condition::.ctor(System.Threading.Lock)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 142: System.Void System.Threading.TimedCondition::Await(System.Int32)
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
					r0 = $[134].call($[143],this)/*$t3 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(this, System.Threading.TimedCondition::Unblock)*/;
					/*$t3..ctor(this, System.Threading.TimedCondition::Unblock)*/}
				case 2:
				{
					__ep__ = 3
					r0 = $[135](r0)/*$t4 = System.NativeFunction::op_Explicit($t3)*/;
					r0 = setTimeout(r0, __f__[3])/*$t7 = System.Global::SetTimeout($t4, (System.Int64)timeoutMs)*/;
				}
				case 3:
				{
					__ep__ = 4
					this[2] = r0/*this._timeoutId = $t7*/;
					__rv__ = $[342]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t9 = __rv__*/;
					this[3] = r0/*this._taskId = $t9*/;
					this[4] = 0/*this._timedOut = 0*/;
					$[140].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this.Await()*/;
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
					r0 = {$:_[152],0:null,1:null,2:null,3:null}/*$t24 = new System.Void System.Threading.ConditionTimedOutException::.ctor()()*/;
					$[145].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t24..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //143: System.Void System.Threading.TimedCondition::Unblock()
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
				$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t8)*/;
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
// 144: System.Void System.Threading.TimedCondition::.ctor(System.Threading.Lock)
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
					$[141].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this..ctor(l)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 145: System.Void System.Threading.ConditionTimedOutException::.ctor()
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
					$[16].call(this)/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 146: System.Void System.NotSupportedException::.ctor()
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
					$[19].call(this)/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 147: System.Void System.NotSupportedException::.ctor(System.String)
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
					$[20].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 148: System.Void System.NotSupportedException::.ctor(System.String,System.Exception)
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
					$[21].call(this,__f__[3],__f__[4])/*this..ctor(message, innerException)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 149: System.Void System.NotImplementedException::.ctor()
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
					$[16].call(this)/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 150: System.Void System.NotImplementedException::.ctor(System.String)
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
					$[17].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 151: System.Object System.ThreadAbortException::get_ExceptionState()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 152: System.Void System.ThreadAbortException::.ctor(System.Object)
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
					$[16].call(this)/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 153: System.Void System.ThreadAbortException::.ctor()
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
					$[152].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,null])/*this..ctor(null)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 154: System.Void System.Runtime.CompilerServices.VTable::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 155: System.Void System.ArgumentException::.ctor(System.String)
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
					$[17].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 156: System.Int32 System.NativeNumber::GetHashCode()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 157: System.String System.NativeNumber::ToString()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 158: System.Void System.MulticastNotSupportedException::.ctor(System.String)
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
					$[17].call(this,__f__[3])/*this..ctor(message)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 159: System.Void System.MulticastNotSupportedException::.ctor()
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
					$[158].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,"Multicast not supported"])/*this..ctor("Multicast not supported")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //160: System.Void System.InvalidCastException::.ctor()
{
	$[16].call(this)/*this..ctor()*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 161: System.Int32 XaeiOS.Process.SIP::get_ID()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 162: System.String XaeiOS.Process.SIP::get_Name()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 163: System.Threading.ThreadCallback XaeiOS.Process.SIP::get_Callback()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 164: System.Void XaeiOS.Process.SIP::set_Callback(System.Threading.ThreadCallback)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 165: System.Void XaeiOS.Process.SIP::Start()
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
					$[185](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*XaeiOS.Process.SIPManager::RegisterSIP(this)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[0]/*$t2 = this._threads*/;
					__rv__ = $[178].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = $t2.get_Head()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*V_0.1 = __rv__*/;
					$[56].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*V_0.1.Start()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 166: System.Int32 XaeiOS.Process.SIP::GetHashCode()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 167: System.String XaeiOS.Process.SIP::ToString()
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,": ",r0])/*__rv__ = System.String::Concat($t1, ": ", $t4)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 168: System.Boolean XaeiOS.Process.SIP::Equals(System.Object)
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
					r1 = (!($[34](__f__[3],_[178]) == null))/*V_2.1 = BooleanNot o is XaeiOS.Process.SIP ValueEquality null*/;
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
					r2 = $[34](__f__[3],_[178])[5]/*$t9 = o is XaeiOS.Process.SIP._id*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 169: System.Void XaeiOS.Process.SIP::InitializeThread(System.Threading.Thread)
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
					r2 = {$:_[313],0:null,1:null}/*$t0 = new System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::.ctor()()*/;
					$[284].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t0..ctor()*/;
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
					$[180].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t4.Add($t5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = r2[1]/*$t6 = $t0.thread*/;
					r1 = {$:_[32],0:null,1:null,2:null,3:null}/*$t8 = new System.Void System.Threading.ThreadCallback::.ctor(System.Object,System.IntPtr)($t0, XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0)*/;
					$[78](r1,r2,$[283])/*$t8..ctor($t0, XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[51].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r1])/*$t6.set_Callback($t8)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 170: System.Void XaeiOS.Process.SIP::ThreadExited(System.Threading.Thread)
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
					__rv__ = $[49].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = thread.get_UnhandledException()*/;
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
						__ep__ = 9;
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
					__rv__ = $[49].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = thread.get_UnhandledException()*/;
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
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t16 = __rv__*/;
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t16)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = $[49].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = thread.get_UnhandledException()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = __rv__/*$t18 = __rv__*/;
					__rv__ = r0.$[8].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t18.get_StackTrace()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r0 = __rv__/*$t19 = __rv__*/;
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t19)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Thread ",__f__[3]," exited"])/*__rv__ = System.String::Concat("Thread ", thread, " exited")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r0 = __rv__/*$t23 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t23)*/;
					r0 = this[4]/*$t25 = this._exitLock*/;
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t25.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r0 = this[0]/*$t27 = this._threads*/;
					$[181].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*$t27.Remove(thread)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					$[172].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*this.TryExit()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					r0 = this[4]/*$t31 = this._exitLock*/;
					$[120].call(r0)/*$t31.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 171: System.Void XaeiOS.Process.SIP::ChildExited(XaeiOS.Process.SIP)
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
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = this[2]/*$t3 = this._children*/;
					$[181].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*$t3.Remove(child)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[172].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this.TryExit()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = this[4]/*$t7 = this._exitLock*/;
					$[120].call(r0)/*$t7.Release()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 172: System.Void XaeiOS.Process.SIP::TryExit()
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Process ",this," trying to exit"])/*__rv__ = System.String::Concat("Process ", this, " trying to exit")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t3 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t3)*/;
					r0 = this[0]/*$t5 = this._threads*/;
					__rv__ = $[179].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t5.get_Count()*/;
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
					__rv__ = $[179].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t8.get_Count()*/;
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
					$[173].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*this.Exit()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 173: System.Void XaeiOS.Process.SIP::Exit()
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Process ",this," exiting"])/*__rv__ = System.String::Concat("Process ", this, " exiting")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t3 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t3)*/;
					this[3] = 2/*this._state = 2*/;
					$[186](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*XaeiOS.Process.SIPManager::UnregisterSIP(this)*/;
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Executing process ",this," callback"])/*__rv__ = System.String::Concat("Executing process ", this, " callback")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t17 = __rv__*/;
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t17)*/;
					r0 = this[7]/*$t19 = this._callback*/;
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,[]])/*$t19.Invoke()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 174: XaeiOS.Process.SIP XaeiOS.Process.SIP::get_CurrentSIP()
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
					r0 = $[128]()/*$t0 = System.Threading.ThreadManager::get_CurrentThread()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 175: XaeiOS.Process.SIP[] XaeiOS.Process.SIP::GetSIPs()
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
					__rv__ = $[187](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = XaeiOS.Process.SIPManager::GetSIPs()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 176: System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)
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
					r0 = {$:_[180],0:null,1:null,2:null,3:0}/*$t1 = new System.Void XaeiOS.Process.DoublyLinkedList`1<System.Threading.Thread>::.ctor()()*/;
					$[182].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					this[0] = r0/*this._threads = $t1*/;
					r0 = {$:_[180],0:null,1:null,2:null,3:0}/*$t3 = new System.Void XaeiOS.Process.DoublyLinkedList`1<XaeiOS.Process.SIP>::.ctor()()*/;
					$[182].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t3..ctor()*/;
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
					r0 = {$:_[101],0:0,1:null}/*$t7 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[121].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t7..ctor()*/;
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
					r0 = {$:_[26],0:0,1:null,2:null,3:null,4:0,5:0,6:0,7:null,8:null,9:null,10:null,11:null,12:0}/*$t13 = new System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority)(threadStart, priority)*/;
					$[71].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4]])/*$t13..ctor(threadStart, priority)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[53].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[5]])/*$t13.set_Name(name)*/;
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
					$[169].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*this.InitializeThread($t13)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 177: System.Void XaeiOS.Process.SIP::.ctor(System.String)
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
					r0 = {$:_[180],0:null,1:null,2:null,3:0}/*$t1 = new System.Void XaeiOS.Process.DoublyLinkedList`1<System.Threading.Thread>::.ctor()()*/;
					$[182].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					this[0] = r0/*this._threads = $t1*/;
					r0 = {$:_[180],0:null,1:null,2:null,3:0}/*$t3 = new System.Void XaeiOS.Process.DoublyLinkedList`1<XaeiOS.Process.SIP>::.ctor()()*/;
					$[182].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t3..ctor()*/;
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
					r0 = {$:_[101],0:0,1:null}/*$t7 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[121].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t7..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 178: T XaeiOS.Process.DoublyLinkedList`1::get_Head()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 179: System.Int32 XaeiOS.Process.DoublyLinkedList`1::get_Count()
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
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1.Acquire()*/;
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
					$[120].call(r0)/*$t5.Release()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 180: System.Void XaeiOS.Process.DoublyLinkedList`1::Add(T)
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
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1.Acquire()*/;
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
					r0 = {$:_[182],0:false,1:null,2:null}/*$t10 = new System.Void XaeiOS.Process.DoublyLinkedListItem`1<T>::.ctor()()*/;
					$[183].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t10..ctor()*/;
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
					r1 = {$:_[182],0:false,1:null,2:null}/*$t22 = new System.Void XaeiOS.Process.DoublyLinkedListItem`1<T>::.ctor()()*/;
					$[183].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t22..ctor()*/;
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
					$[120].call(r0)/*$t21.Release()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 181: System.Void XaeiOS.Process.DoublyLinkedList`1::Remove(T)
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
					$[118].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0])/*$t1.Acquire()*/;
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
					$[120].call(r1)/*$t11.Release()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r1 = {$:_[168],0:null,1:null,2:null,3:null}/*$t13 = new System.Void System.ArgumentException::.ctor(System.String)("Item is not in the list")*/;
					$[155].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3],[null,null,0,"Item is not in the list"])/*$t13..ctor("Item is not in the list")*/;
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
					$[120].call(r1)/*$t42.Release()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 182: System.Void XaeiOS.Process.DoublyLinkedList`1::.ctor()
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
					r0 = {$:_[101],0:0,1:null}/*$t8 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[121].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t8..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 183: System.Void XaeiOS.Process.DoublyLinkedListItem`1::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 184: System.Void XaeiOS.Process.SIPManager::Initialize()
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
					r0 = {$:_[89],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Int32,XaeiOS.Process.SIP>::.ctor()()*/;
					$[110].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					_[185] = r0/*XaeiOS.Process.SIPManager._sips = $t0*/
					_[186] = 0/*XaeiOS.Process.SIPManager._pidCounter = 0*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 185: System.Void XaeiOS.Process.SIPManager::RegisterSIP(XaeiOS.Process.SIP)
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
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t6 = new System.Void System.ArgumentException::.ctor(System.String)("SIP is already registered.")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"SIP is already registered."])/*$t6..ctor("SIP is already registered.")*/;
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
					r1 = $[188]()/*V_0.1 = XaeiOS.Process.SIPManager::GetPID()*/;
					__f__[3][5] = r1/*sip._id = V_0.1*/;
					r0 = _[185]/*$t9 = XaeiOS.Process.SIPManager._sips*/;
					r0.$[5].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1,__f__[3]])/*$t9.set_Item(V_0.1, sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[25](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*System.Resources.ResourceManager::RegisterSIP(sip)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 186: System.Void XaeiOS.Process.SIPManager::UnregisterSIP(XaeiOS.Process.SIP)
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
					$[26](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,__f__[3]])/*System.Resources.ResourceManager::CleanupAndUnregisterSIP(sip)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = _[185]/*$t1 = XaeiOS.Process.SIPManager._sips*/;
					__rv__ = $[161].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = sip.get_ID()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 187: XaeiOS.Process.SIP[] XaeiOS.Process.SIPManager::GetSIPs()
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
					r0 = _[185]/*$t0 = XaeiOS.Process.SIPManager._sips*/;
					__rv__ = $[109].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = $t0.GetValues()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //188: System.Int32 XaeiOS.Process.SIPManager::GetPID()
{
	var r0;
	r0 = _[186]/*$tf1 = XaeiOS.Process.SIPManager._pidCounter*/;
	_[186] = (r0 + 1)/*XaeiOS.Process.SIPManager._pidCounter = $tf1 Add 1*/;
	return r0/*$tf1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 189: System.NativeObject XaeiOS.Process.ImageFormat.ObjectImage::GetMetadata()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 190: System.NativeArray XaeiOS.Process.ImageFormat.ObjectImage::GetFixups()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 191: System.Void XaeiOS.Process.ImageFormat.ObjectImage::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 192: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Name()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 193: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Name(System.String)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 194: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Version()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 195: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Version(System.String)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 196: System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Culture()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 197: System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Culture(System.String)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 198: System.Void XaeiOS.Process.ImageFormat.AssemblyName::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //199: System.Void System.ExecutionEngineException::.ctor(System.String)
{
	$[20].call(this,a0)/*this..ctor(message)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 200: T System.Collections.Generic.List`1::get_Item(System.Int32)
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Argument out of range")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Argument out of range"])/*$t9..ctor("Argument out of range")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 201: System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T)
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Argument out of range")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Argument out of range"])/*$t9..ctor("Argument out of range")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 202: System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 203: System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 204: System.Void System.Collections.Generic.List`1::Add(T)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 205: System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 206: System.Int32 System.Collections.Generic.List`1::get_Count()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 207: System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator()
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
					r0 = {$:_[198],0:0,1:null}/*$t1 = new System.Void System.Collections.Generic.List`1/Enumerator<T>::.ctor(System.Collections.Generic.List`1<T>)(this)*/;
					$[215].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 208: System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator()
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
					r0 = {$:_[198],0:0,1:null}/*$t1 = new System.Void System.Collections.Generic.List`1/Enumerator<T>::.ctor(System.Collections.Generic.List`1<T>)(this)*/;
					$[215].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 209: System.Void System.Collections.Generic.List`1::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 210: T System.Collections.Generic.List`1/Enumerator::get_Current()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 211: System.Object System.Collections.Generic.List`1/Enumerator::System.Collections.IEnumerator.get_Current()
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
					__rv__ = $[210].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = this.get_Current()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 212: System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 213: System.Void System.Collections.Generic.List`1/Enumerator::Reset()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 214: System.Void System.Collections.Generic.List`1/Enumerator::Dispose()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 215: System.Void System.Collections.Generic.List`1/Enumerator::.ctor(System.Collections.Generic.List`1<T>)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 216: System.Void System.Collections.ArrayList::.ctor()
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
					$[209].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //217: System.String System.String::get_Empty()
{
	var r0;
	r0 = _[203]/*V_0.1 = System.String._empty*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 218: System.Void System.String::Initialize()
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
					_[203] = ""/*System.String._empty = ""*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 219: System.String[] System.String::Split(System.Char[])
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t9..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //220: System.Boolean System.String::StartsWith(System.String)
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
 //221: System.Boolean System.String::EndsWith(System.String)
{
	var r0;
	r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.Exception::.ctor(System.String)("Not yet implemented")*/;
	$[17].call(r0,"Not yet implemented")/*$t1..ctor("Not yet implemented")*/;
	throw r0/*$t1*/;

},
function()
 //222: System.String System.String::ToString()
{
	return this/*this*/;

},
function(a0/*needle*/)
 //223: System.Boolean System.String::Contains(System.String)
{
	var r0;
	r0 = this.indexOf(a0)/*$t2 = this.IndexOf(needle)*/;
	return (!(r0 == -1))/*BooleanNot $t2 ValueEquality -1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1)
// 224: System.String System.String::Concat(System.Object,System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 225: System.String System.String::Concat(System.Object,System.Object,System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 226: System.String System.String::Concat(System.Object,System.Object,System.Object,System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 227: System.String System.String::Concat(System.Object[])
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 228: System.Int32 System.String::Compare(System.String,System.String)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 229: System.Void System.String::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 230: System.Void XaeiOS.Process.DynamicLinker::Initialize()
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
					r0 = _[214]/*$t0 = XaeiOS.Process.DynamicLinker._initialized*/;
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
					r0 = _[215]/*$t6 = XaeiOS.Process.DynamicLinker._initializing*/
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
					_[215] = 1/*XaeiOS.Process.DynamicLinker._initializing = 1*/
					_[216] = null/*XaeiOS.Process.DynamicLinker._osCorlibObjectImageData = null*/;
					_[214] = 1/*XaeiOS.Process.DynamicLinker._initialized = 1*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 231: XaeiOS.Process.ImageFormat.AssemblyName XaeiOS.Process.DynamicLinker::LoadObjectImage(System.String)
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
					r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.Exception::.ctor(System.String)("Not yet implemented")*/;
					$[17].call(r0,"Not yet implemented")/*$t1..ctor("Not yet implemented")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 232: System.Void XaeiOS.Process.DynamicLinker::SetEntryPointObjectImage(XaeiOS.Process.ImageFormat.AssemblyName)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 233: System.Void XaeiOS.Process.DynamicLinker::Link()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 234: System.Void XaeiOS.Process.DynamicLinker::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 235: System.String System.NativeError::ToString()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //236: System.NativeObject System.Diagnostics.ObjectDebugger::GetSystemObjectVTable()
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
				r0 = _[225]/*$t0 = System.Diagnostics.ObjectDebugger._object*/;
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
				_[225] = r0/*System.Diagnostics.ObjectDebugger._object = $t7*/;
				__ep__ = 3;
			}
			case 3:
			{
				r0 = _[225]/*$t10 = System.Diagnostics.ObjectDebugger._object*/
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
 //237: System.NativeObject System.Diagnostics.ObjectDebugger::DebugObject(System.Object)
{
	var r0,r1;
	r1 = a0["$"]/*V_1.1 = obj.get_Item("$")*/;
	r0 = (!(r1 == null))/*V_3.1 = BooleanNot V_1.1 ValueEquality null*/;
	if(r0)
	{
		r0 = {$:_[227],0:0}/*$t14 = new System.Void System.Diagnostics.ObjectDebugger/IntRef::.ctor()()*/;
		$[239].call(r0)/*$t14..ctor()*/;
		r0 = $[238](a0,r1,r0)/*V_2.1 = System.Diagnostics.ObjectDebugger::BuildDebuggableObject(obj, V_1.1, $t14)*/;
		return r0/*V_2.1*/;

	}
	else
	{
		r0 = new Error("ObjectDebugger can only debug managed objects.")/*$t13 = new System.Void System.NativeError::.ctor(System.String)("ObjectDebugger can only debug managed objects.")*/
		throw r0/*$t13*/;

	}

},
function(a0/*nativeObject*/,a1/*vtable*/,a2/*fieldCounter*/)
 //238: System.NativeObject System.Diagnostics.ObjectDebugger::BuildDebuggableObject(System.NativeObject,System.NativeObject,System.Diagnostics.ObjectDebugger/IntRef)
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
				r1 = $[236]()/*$t2 = System.Diagnostics.ObjectDebugger::GetSystemObjectVTable()*/;
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
				r1 = $[238](a0,r1,a2)/*$t13 = System.Diagnostics.ObjectDebugger::BuildDebuggableObject(nativeObject, $t10, fieldCounter)*/;
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
 //239: System.Void System.Diagnostics.ObjectDebugger/IntRef::.ctor()
{
	this[0] = 0/*this.Value = 0*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 240: System.Int32 System.Collections.Queue::get_Count()
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
					__rv__ = r0.length/*__rv__ = $t1.get_Length()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 241: System.Boolean System.Collections.Queue::get_IsSynchronized()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 242: System.Void System.Collections.Queue::set_IsSynchronized(System.Boolean)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 243: System.Object System.Collections.Queue::get_SyncRoot()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 244: System.Void System.Collections.Queue::set_SyncRoot(System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 245: System.Void System.Collections.Queue::Clear()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 246: System.Object System.Collections.Queue::Clone()
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
					r0 = {$:_[229],0:null,1:0,2:null}/*$t1 = new System.Void System.Collections.Queue::.ctor(System.Collections.ICollection)(this)*/;
					$[257].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,this])/*$t1..ctor(this)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 247: System.Boolean System.Collections.Queue::Contains(System.Object)
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
					__rv__ = r2.length/*__rv__ = $t2.get_Length()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r2,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r2 = __rv__/*$t3 = __rv__*/
					r2 = (r0 < r2)/*V_2.1 = V_0.3 LessThan $t3*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 248: System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 249: System.Object System.Collections.Queue::Dequeue()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 250: System.Void System.Collections.Queue::Enqueue(System.Object)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 251: System.Collections.IEnumerator System.Collections.Queue::GetEnumerator()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 252: System.Object System.Collections.Queue::Peek()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 253: System.Collections.Queue System.Collections.Queue::Synchronized(System.Collections.Queue)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 254: System.Object[] System.Collections.Queue::ToArray()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 255: System.Void System.Collections.Queue::TrimToSize()
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 256: System.Void System.Collections.Queue::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 257: System.Void System.Collections.Queue::.ctor(System.Collections.ICollection)
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
					$[256].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t1 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //258: System.Void XaeiOS.OSCorlib::Initialize()
{
	var r0;
	r0 = _[258]/*$t0 = XaeiOS.OSCorlib._initializing*/;
	r0 = (!r0)/*V_0.1 = BooleanNot $t0*/;
	if(r0)
	{
		r0 = _[257]/*$t6 = XaeiOS.OSCorlib._initialized*/;
		r0 = (!r0)/*V_0.2 = BooleanNot $t6*/;
		if(r0)
		{
			_[258] = 1/*XaeiOS.OSCorlib._initializing = 1*/;
			$[218](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*System.String::Initialize()*/;
			$[29](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*System.Runtime.CompilerServices.RuntimeHelpers::Initialize()*/;
			$[131]()/*System.Threading.ThreadManager::Initialize()*/;
			$[184](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*XaeiOS.Process.SIPManager::Initialize()*/;
			$[230](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*XaeiOS.Process.DynamicLinker::Initialize()*/;
			$[24]()/*System.Resources.ResourceManager::Initialize()*/;
			$[275](1,Number.POSITIVE_INFINITY,null,null,null,[],[null,null,0])/*System.Reflection.ReflectionHelpers::Initialize()*/;
			_[257] = 1/*XaeiOS.OSCorlib._initialized = 1*/;
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
// 259: System.Void System.Threading.Semaphore::Acquire()
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
					$[260].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,1])/*this.Acquire(1)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 260: System.Void System.Threading.Semaphore::Acquire(System.Int32)
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
					__rv__ = $[342]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t5 = __rv__*/;
					r1[1] = r0/*V_2.1[1] = $t5*/;
					r1[2] = " acquiring "/*V_2.1[2] = " acquiring "*/;
					r1[3] = __f__[3]/*V_2.1[3] = resources*/;
					r1[4] = " resources"/*V_2.1[4] = " resources"*/;
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,r1])/*__rv__ = System.String::Concat(V_2.1)*/;
				}
				case 3:
				{
					r0 = __rv__/*$t12 = __rv__*/
					LogWrite("DEBUG", r0)/*System.Diagnostics.Logging::Debug($t12)*/;
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t21 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot acquire a negative number of resources")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,"Cannot acquire a negative number of resources"])/*$t21..ctor("Cannot acquire a negative number of resources")*/;
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
					__rv__ = $[342]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 8:
				{
					__ep__ = 9
					r3 = __rv__/*V_1.1 = __rv__*/;
					r0 = this[2]/*$t36 = this._waitingTasks*/;
					r2 = {$:_[292],0:0,1:0}/*$t38 = new System.Void System.Threading.Semaphore/WaitingTask::.ctor(System.Int32,System.Int32)(V_1.1, Negate $t23 Subtract resources)*/;
					$[264].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0,r3,(-(r1 - __f__[3]))])/*$t38..ctor(V_1.1, Negate $t23 Subtract resources)*/;
				}
				case 9:
				{
					__ep__ = 10
					r0.push(r2)/*$t36.Push($t38)*/;
					$[338](r3)/*XaeiOS.SystemCalls::BlockTask(V_1.1)*/;
				}
				case 10:
				{
					__ep__ = 12
					$[340](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3],[null,null,0])/*XaeiOS.SystemCalls::Yield()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 261: System.Void System.Threading.Semaphore::Release()
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
					$[262].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,1])/*this.Release(1)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 262: System.Void System.Threading.Semaphore::Release(System.Int32)
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
					__rv__ = $[342]()/*__rv__ = XaeiOS.SystemCalls::GetCurrentTaskId()*/;
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t5 = __rv__*/;
					r1[1] = r0/*V_1.1[1] = $t5*/;
					r1[2] = " releasing "/*V_1.1[2] = " releasing "*/;
					r1[3] = __f__[3]/*V_1.1[3] = resources*/;
					r1[4] = " resources"/*V_1.1[4] = " resources"*/;
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
				}
				case 3:
				{
					r0 = __rv__/*$t12 = __rv__*/
					LogWrite("DEBUG", r0)/*System.Diagnostics.Logging::Debug($t12)*/;
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t21 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot release a negative number of resources")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Cannot release a negative number of resources"])/*$t21..ctor("Cannot release a negative number of resources")*/;
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t34 = new System.Void System.ArgumentException::.ctor(System.String)("Cannot release more resources this semaphore holds")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Cannot release more resources this semaphore holds"])/*$t34..ctor("Cannot release more resources this semaphore holds")*/;
				}
				case 8:
				{
					throw r0/*$t34*/
				}
				case 9:
				{
					__ep__ = 10
					r0 = this[2]/*$t36 = this._waitingTasks*/;
					__rv__ = r0.length/*__rv__ = $t36.get_Length()*/;
				}
				case 10:
				{
					r0 = __rv__/*$t37 = __rv__*/
					r0 = (!(r0 > 0))/*V_2.3 = BooleanNot $t37 GreaterThan 0*/;
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
					$[337](r0)/*XaeiOS.SystemCalls::ScheduleTask($t59)*/;
				}
				case 15:
				{
					__ep__ = 16
					r0 = this[2]/*$t61 = this._waitingTasks*/;
					__rv__ = r0.length/*__rv__ = $t61.get_Length()*/;
				}
				case 16:
				{
					r0 = __rv__/*$t62 = __rv__*/
					r0 = (r0 > 0)/*V_2.5 = $t62 GreaterThan 0*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 263: System.Void System.Threading.Semaphore::.ctor(System.Int32)
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
					r0 = {$:_[168],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ArgumentException::.ctor(System.String)("Must have at least 1 resource for a semaphore")*/;
					$[155].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Must have at least 1 resource for a semaphore"])/*$t9..ctor("Must have at least 1 resource for a semaphore")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 264: System.Void System.Threading.Semaphore/WaitingTask::.ctor(System.Int32,System.Int32)
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 265: System.Void System.NativeArray`1::RemoveAt(System.Int32)
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
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t0 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 266: System.Void System.Array::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //267: System.String System.Runtime.CompilerServices.Class::get_Name()
{
	var r0;
	r0 = this[0]/*V_0.1 = this.<Name>k__BackingField*/;
	return r0/*V_0.1*/;

},
function(a0/*value*/)
 //268: System.Void System.Runtime.CompilerServices.Class::set_Name(System.String)
{
	this[0] = a0/*this.<Name>k__BackingField = value*/;
	return;

},
function()
 //269: System.String System.Runtime.CompilerServices.Class::get_Namespace()
{
	var r0;
	r0 = this[1]/*V_0.1 = this.<Namespace>k__BackingField*/;
	return r0/*V_0.1*/;

},
function(a0/*value*/)
 //270: System.Void System.Runtime.CompilerServices.Class::set_Namespace(System.String)
{
	this[1] = a0/*this.<Namespace>k__BackingField = value*/;
	return;

},
function()
 //271: System.Runtime.CompilerServices.Class System.Runtime.CompilerServices.Class::get_DeclaringType()
{
	var r0;
	r0 = this[2]/*V_0.1 = this.<DeclaringType>k__BackingField*/;
	return r0/*V_0.1*/;

},
function(a0/*value*/)
 //272: System.Void System.Runtime.CompilerServices.Class::set_DeclaringType(System.Runtime.CompilerServices.Class)
{
	this[2] = a0/*this.<DeclaringType>k__BackingField = value*/;
	return;

},
function()
 //273: System.Void System.Runtime.CompilerServices.Class::.ctor()
{
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 274: System.Void System.Runtime.CompilerServices.XaeiOSObject::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 275: System.Void System.Reflection.ReflectionHelpers::Initialize()
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
					r0 = {$:_[89],0:null,1:null,2:null}/*$t0 = new System.Void System.Collections.Generic.Dictionary`2<System.Runtime.CompilerServices.Class,System.Reflection.RuntimeType>::.ctor()()*/;
					$[110].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					_[307] = r0/*System.Reflection.ReflectionHelpers._runtimeTypeCache = $t0*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 276: System.Reflection.RuntimeType System.Reflection.ReflectionHelpers::GetType(System.Object)
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
					r0 = __f__[3].$/*$t3 = obj.get_VTable()*/;
					__rv__ = r0.c/*__rv__ = $t3.get_Class()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*V_1.1 = __rv__*/;
					r0 = _[307]/*$t5 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					__rv__ = r0.$[7].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r2])/*__rv__ = $t5.ContainsKey(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*V_4.1 = __rv__*/
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
					r1 = {$:_[309],0:null}/*$t7 = new System.Void System.Reflection.RuntimeType::.ctor(System.Runtime.CompilerServices.Class)(V_1.1)*/;
					$[280].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r2])/*$t7..ctor(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = _[307]/*$t8 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					r0.$[5].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r2,r1])/*$t8.set_Item(V_1.1, $t7)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = _[307]/*$t9 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					__rv__ = r0.$[4].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r2])/*__rv__ = $t9.get_Item(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					r0 = __rv__/*V_3.1 = __rv__*/
					return r0/*V_3.1*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0)
// 277: System.Reflection.RuntimeType System.Reflection.ReflectionHelpers::BrokenGetType(System.Object)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r1 = __f__[3].$/*$t3 = obj.get_VTable()*/;
					__rv__ = r1.c/*__rv__ = $t3.get_Class()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r2 = __rv__/*V_1.1 = __rv__*/;
					r1 = _[307]/*$t5 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					__rv__ = r1.$[7].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0],[null,null,0,r2])/*__rv__ = $t5.ContainsKey(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r1 = __rv__/*$t6 = __rv__*/
					r1 = (!r1)/*V_4.1 = BooleanNot $t6*/;
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 8
					r1 = _[307]/*$t10 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					__rv__ = r1.$[4].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0],[null,null,0,r2])/*__rv__ = $t10.get_Item(V_1.1)*/;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					r3 = {$:_[309],0:null}/*$t12 = new System.Void System.Reflection.RuntimeType::.ctor(System.Runtime.CompilerServices.Class)(V_1.1)*/;
					$[280].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0],[null,null,0,r2])/*$t12..ctor(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r1 = _[307]/*$t13 = System.Reflection.ReflectionHelpers._runtimeTypeCache*/;
					r1.$[5].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0],[null,null,0,r2,r3])/*$t13.set_Item(V_1.1, $t12)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					r0 = r3/*V_3.2 = $t12*/
					__ep__ = 8;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = __rv__/*V_3.1 = __rv__*/
					return r0/*V_3.3*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r3,r0]/*e._throwContext = [dynamic expression]*/;

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
// 278: System.String System.Reflection.RuntimeType::get_Name()
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
					r0 = this[0]/*$t1 = this._class*/;
					__rv__ = $[267].call(r0)/*__rv__ = $t1.get_Name()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 279: System.String System.Reflection.RuntimeType::get_Namespace()
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
					r0 = this[0]/*$t1 = this._class*/;
					__rv__ = $[269].call(r0)/*__rv__ = $t1.get_Namespace()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 280: System.Void System.Reflection.RuntimeType::.ctor(System.Runtime.CompilerServices.Class)
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
					$[99].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					this[0] = __f__[3]/*this._class = klass*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 281: System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0()
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"Process ",r0," exited"])/*__rv__ = System.String::Concat("Process ", $t2, " exited")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					LogWrite("INFO", r0)/*System.Diagnostics.Logging::Log($t4)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 282: System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 283: System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0()
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
					$[170].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*$t1.ThreadExited($t3)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 284: System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
Object image XaeiOS.Kernel - Code: 285	Data: 315
**********/

,function()
 //0: System.Void XaeiOS.Kernel.TaskPriorityQueue::Initialize()
{
	var r0;
	r0 = new Array()/*$t0 = new System.Void System.NativeArray`1<XaeiOS.Kernel.Task>::.ctor()()*/;
	_[316] = r0/*XaeiOS.Kernel.TaskPriorityQueue._heap = $t0*/;
	_[317] = 0/*XaeiOS.Kernel.TaskPriorityQueue._count = 0*/;
	return;

},
function(a0/*t*/)
 //1: System.Void XaeiOS.Kernel.TaskPriorityQueue::Add(XaeiOS.Kernel.Task)
{
	var r0;
	r0 = _[317]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	_[317] = (r0 + 1)/*XaeiOS.Kernel.TaskPriorityQueue._count = $t0 Add 1*/;
	r0 = _[317]/*$t3 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	$[289]((r0 - 1),a0)/*XaeiOS.Kernel.TaskPriorityQueue::BubbleUp($t3 Subtract 1, t)*/;
	return;

},
function()
 //2: XaeiOS.Kernel.Task XaeiOS.Kernel.TaskPriorityQueue::Remove()
{
	var r0,r1,r2;
	r0 = _[316]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
	r2 = r0[0]/*V_0.1 = $t0.get_Item(0)*/;
	r0 = _[317]/*$t4 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	_[317] = (r0 - 1)/*XaeiOS.Kernel.TaskPriorityQueue._count = $t4 Subtract 1*/;
	r0 = _[316]/*$t8 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
	r1 = _[317]/*$t10 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	r0 = r0[r1]/*$t11 = $t8.get_Item($t10)*/;
	$[288](0,r0)/*XaeiOS.Kernel.TaskPriorityQueue::TrickleDown(0, $t11)*/;
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
				r1 = _[317]/*$t5 = XaeiOS.Kernel.TaskPriorityQueue._count*/
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
				$[289](a0,a1)/*XaeiOS.Kernel.TaskPriorityQueue::BubbleUp(index, t)*/
				return;
			}
			case 4:
			{
				r1 = _[317]/*$t13 = XaeiOS.Kernel.TaskPriorityQueue._count*/
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
				r1 = _[316]/*$t15 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1 = r1[r0]/*$t17 = $t15.get_Item(V_0.4)*/;
				r2 = r1[5]/*$t18 = $t17.Priority*/;
				r1 = _[316]/*$t19 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
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
				r2 = _[316]/*$t32 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
				r1 = _[316]/*$t35 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
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
				r1 = _[316]/*$t9 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
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
				r2 = _[316]/*$t19 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = _[316]/*$t21 = XaeiOS.Kernel.TaskPriorityQueue._heap*/;
				r1 = r1[r0]/*$t22 = $t21.get_Item(V_0.3)*/;
				r2[a0] = r1/*$t19.set_Item(index, $t22)*/;
				a0 = r0/*index = V_0.3*/;
				__rv__ = Math.floor(((a0 - 1) / 2))/*__rv__ = System.Math::Floor(index Subtract 1 Divide 2)*/;
				continue __ctrl__;
			}
			case 7:
			{
				r1 = _[316]/*$t16 = XaeiOS.Kernel.TaskPriorityQueue._heap*/
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
	r0 = _[317]/*$t0 = XaeiOS.Kernel.TaskPriorityQueue._count*/;
	return (r0 == 0)/*$t0 ValueEquality 0*/;

},
function()
 //6: System.Void XaeiOS.Kernel.TaskPriorityQueue::Cleanup()
{
	_[317] = 0/*XaeiOS.Kernel.TaskPriorityQueue._count = 0*/;
	_[316] = null/*XaeiOS.Kernel.TaskPriorityQueue._heap = null*/;
	return;

},
function()
 //7: System.Void XaeiOS.Kernel.TaskPriorityQueue::Test()
{
	var r0,r1,r2;
	r0 = {$:_[319],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 1")*/;
	$[303].call(r0,null,null,null,3,"Task 1")/*$t5..ctor(null, null, null, 3, "Task 1")*/;
	r1 = {$:_[319],0:null,1:null,2:null,3:0,4:null,5:0}/*$t11 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 2")*/;
	$[303].call(r1,null,null,null,3,"Task 2")/*$t11..ctor(null, null, null, 3, "Task 2")*/;
	r2 = {$:_[319],0:null,1:null,2:null,3:0,4:null,5:0}/*$t17 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Task 3")*/;
	$[303].call(r2,null,null,null,3,"Task 3")/*$t17..ctor(null, null, null, 3, "Task 3")*/;
	$[286](r0)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t5)*/;
	$[286](r1)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t11)*/;
	$[286](r2)/*XaeiOS.Kernel.TaskPriorityQueue::Add($t17)*/;
	r0 = $[287]()/*V_3.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
	r1 = $[287]()/*V_4.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
	$[286](r1)/*XaeiOS.Kernel.TaskPriorityQueue::Add(V_4.1)*/;
	$[286](r0)/*XaeiOS.Kernel.TaskPriorityQueue::Add(V_3.1)*/;
	return;

},
function()
 //8: System.Int32 XaeiOS.Kernel.Task::get_TaskCount()
{
	var r0;
	r0 = _[323]/*V_0.1 = XaeiOS.Kernel.Task._taskCount*/;
	return r0/*V_0.1*/;

},
function(a0/*id*/)
 //9: XaeiOS.Kernel.Task XaeiOS.Kernel.Task::GetTaskById(System.Int32)
{
	var r1,r0;
	r1 = _[320]/*$t0 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = a0 in r1/*V_1.1 = $t0.ContainsKey(id)*/;
	if(r1)
	{
		r1 = _[320]/*$t5 = XaeiOS.Kernel.Task.IdMap*/;
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
	_[322] = 1/*XaeiOS.Kernel.Task._idCounter = 1*/;
	_[323] = 0/*XaeiOS.Kernel.Task._taskCount = 0*/;
	r0 = new Object()/*$t2 = new System.Void System.NativeObject::.ctor()()*/;
	_[320] = r0/*XaeiOS.Kernel.Task.IdMap = $t2*/;
	r0 = new Object()/*$t3 = new System.Void System.NativeObject::.ctor()()*/;
	_[321] = r0/*XaeiOS.Kernel.Task.NameMap = $t3*/;
	return;

},
function()
 //11: System.String XaeiOS.Kernel.Task::get_Name()
{
	var r0,r1;
	r0 = _[321]/*$t0 = XaeiOS.Kernel.Task.NameMap*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
					r0 = $[296].call(this)/*V_0.1 = this.get_Name()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
	r0 = _[323]/*$t0 = XaeiOS.Kernel.Task._taskCount*/;
	_[323] = (r0 - 1)/*XaeiOS.Kernel.Task._taskCount = $t0 Subtract 1*/;
	r0 = _[321]/*$t3 = XaeiOS.Kernel.Task.NameMap*/;
	r1 = a0[3]/*$t6 = t.Id*/;
	delete r0[r1]/*$t3.RemoveKey($t6)*/;
	r0 = _[320]/*$t7 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = a0[3]/*$t10 = t.Id*/;
	delete r0[r1]/*$t7.RemoveKey($t10)*/;
	return;

},
function()
 //15: System.Void XaeiOS.Kernel.Task::Cleanup()
{
	_[321] = null/*XaeiOS.Kernel.Task.NameMap = null*/;
	_[320] = null/*XaeiOS.Kernel.Task.IdMap = null*/;
	_[323] = 0/*XaeiOS.Kernel.Task._taskCount = 0*/;
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
	r0 = _[322]/*$t7 = XaeiOS.Kernel.Task._idCounter*/;
	delete r2[r0]/*$t0.RemoveKey($t7)*/;
	r0 = _[320]/*$t8 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = _[322]/*$t10 = XaeiOS.Kernel.Task._idCounter*/;
	delete r0[r1]/*$t8.RemoveKey($t10)*/;
	r0 = _[322]/*$t12 = XaeiOS.Kernel.Task._idCounter*/;
	delete r2[r0]/*$t0.RemoveKey($t12)*/;
	r0 = _[320]/*$t13 = XaeiOS.Kernel.Task.IdMap*/;
	delete r0[6]/*$t13.RemoveKey(6)*/;
	r0 = _[320]/*$t16 = XaeiOS.Kernel.Task.IdMap*/;
	r1 = _[322]/*$t18 = XaeiOS.Kernel.Task._idCounter*/;
	r1 in r0/*$t16.ContainsKey($t18)*/;
	r0 = _[322]/*$t21 = XaeiOS.Kernel.Task._idCounter*/;
	r0 in r2/*$t0.ContainsKey($t21)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/,a4/*name*/,a5/*id*/)
 //17: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String,System.Int32)
{
	var r0;
	r0 = $[333](a0,a1)/*$t6 = XaeiOS.Kernel.Continuation::Create(self, function)*/;
	this[0] = r0/*this.Continuation = $t6*/;
	this[1] = a0/*this.This = self*/;
	this[2] = a1/*this.Function = function*/;
	this[4] = a2/*this.Callback = callback*/;
	r0 = $[325](a3)/*$t15 = XaeiOS.Kernel.Scheduler::DynamicPriority(priority)*/;
	this[5] = r0/*this.Priority = $t15*/;
	this[3] = a5/*this.Id = id*/;
	r0 = _[321]/*$t18 = XaeiOS.Kernel.Task.NameMap*/;
	r0[a5] = a4/*$t18.set_Item(id, name)*/;
	r0 = _[320]/*$t23 = XaeiOS.Kernel.Task.IdMap*/;
	r0[a5] = this/*$t23.set_Item(id, this)*/;
	r0 = _[323]/*$t28 = XaeiOS.Kernel.Task._taskCount*/;
	_[323] = (r0 + 1)/*XaeiOS.Kernel.Task._taskCount = $t28 Add 1*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/,a4/*name*/)
 //18: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)
{
	var r0;
	r0 = _[322]/*$tf7 = XaeiOS.Kernel.Task._idCounter*/;
	_[322] = (r0 + 1)/*XaeiOS.Kernel.Task._idCounter = $tf7 Add 1*/;
	$[302].call(this,a0,a1,a2,a3,a4,r0)/*this..ctor(self, function, callback, priority, name, $tf7)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/,a3/*priority*/)
 //19: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority)
{
	var r0,r1;
	r0 = _[322]/*$t6 = &XaeiOS.Kernel.Task._idCounter*/;
	r0 = r0.toString()/*$t7 = $t6.ToString()*/;
	r1 = ("anonymous" + r0)/*$t8 = System.String::Concat("anonymous", $t7)*/;
	r0 = _[322]/*$tf10 = XaeiOS.Kernel.Task._idCounter*/;
	_[322] = (r0 + 1)/*XaeiOS.Kernel.Task._idCounter = $tf10 Add 1*/;
	$[302].call(this,a0,a1,a2,a3,r1,r0)/*this..ctor(self, function, callback, priority, $t8, $tf10)*/;
	return;

},
function(a0/*self*/,a1/*function*/,a2/*callback*/)
 //20: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback)
{
	$[304].call(this,a0,a1,a2,3)/*this..ctor(self, function, callback, 3)*/;
	return;

},
function(a0/*self*/,a1/*function*/)
 //21: System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction)
{
	$[305].call(this,a0,a1,null)/*this..ctor(self, function, null)*/;
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
	r0 = _[351]/*V_0.1 = XaeiOS.Kernel.Scheduler._kernelTask*/;
	return r0/*V_0.1*/;

},
function()
 //24: XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::get_CurrentTask()
{
	var r0;
	r0 = _[350]/*V_0.1 = XaeiOS.Kernel.Scheduler._currentTask*/;
	return r0/*V_0.1*/;

},
function()
 //25: System.Boolean XaeiOS.Kernel.Scheduler::get_InCriticalSection()
{
	var r0;
	r0 = _[355]/*V_0.1 = XaeiOS.Kernel.Scheduler._inCriticalSection*/;
	return r0/*V_0.1*/;

},
function()
 //26: System.Void XaeiOS.Kernel.Scheduler::EnterCriticalSection()
{
	_[355] = 1/*XaeiOS.Kernel.Scheduler._inCriticalSection = 1*/;
	return;

},
function()
 //27: System.Void XaeiOS.Kernel.Scheduler::LeaveCriticalSection()
{
	_[355] = 0/*XaeiOS.Kernel.Scheduler._inCriticalSection = 0*/;
	return;

},
function()
 //28: System.Void XaeiOS.Kernel.Scheduler::Initialize()
{
	var r0;
	r0 = {$:_[319],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(null, null, null, 3, "Kernel Task")*/;
	$[303].call(r0,null,null,null,3,"Kernel Task")/*$t5..ctor(null, null, null, 3, "Kernel Task")*/;
	_[351] = r0/*XaeiOS.Kernel.Scheduler._kernelTask = $t5*/;
	r0 = new Object()/*$t6 = new System.Void System.NativeObject::.ctor()()*/;
	_[354] = r0/*XaeiOS.Kernel.Scheduler._taskStatusMap = $t6*/;
	_[355] = 0/*XaeiOS.Kernel.Scheduler._inCriticalSection = 0*/;
	$[319]()/*XaeiOS.Kernel.Scheduler::StartCpu()*/;
	return;

},
function(a0/*t*/)
 //29: System.Void XaeiOS.Kernel.Scheduler::SetWindowStatus(XaeiOS.Kernel.Task)
{
	var r1,r2,r0;
	r0 = ""/*V_0.1 = ""*/;
	r1 = a0[0]/*$t2 = t.Continuation*/;
	r1 = r1[6]/*$t3 = $t2.Frame*/;
	r1 = r1[1]/*$t4 = $t3.Function*/;
	r2 = r1["d"]/*V_1.1 = $t4.get_Item("d")*/;
	r1 = (r2 == null)/*V_3.1 = V_1.1 ValueEquality null*/;
	if(r1)
	{
		r0 = ""/*V_0.3 = ""*/;

	}
	else
	{
		r1 = r2["Name"]/*$t12 = V_1.1.get_Item("Name")*/
		r0 = r1.toString()/*V_0.2 = $t12.NativeToString()*/;

	}
	r2 = new Array(5)/*V_4.1 = new System.String[5]*/;
	r2[0] = "Context switch to task: "/*V_4.1[0] = "Context switch to task: "*/;
	r1 = $[296].call(a0)/*$t20 = t.get_Name()*/;
	r2[1] = r1/*V_4.1[1] = $t20*/;
	r2[2] = r0/*V_4.1[2] = V_0.4*/;
	r2[3] = " @ "/*V_4.1[3] = " @ "*/;
	r1 = new Date()/*$t25 = new System.Void System.NativeDate::.ctor()()*/;
	r1 = r1.getTime()/*V_5.1 = $t25.GetTime()*/;
	r1 = r1.toString()/*$t27 = V_5.1.ToString()*/;
	r2[4] = r1/*V_4.1[4] = $t27*/;
	r1 = r2.join('')/*$t28 = System.String::Concat(V_4.1)*/;
	window.status = r1/*XaeiOS.Kernel.Scheduler::SetWindowStatus($t28)*/;
	return;

},
function()
 //30: System.Void XaeiOS.Kernel.Scheduler::CpuCycle()
{
	var r1,r2,r0,r3,r4,r5;
	r1 = $[290]()/*$t0 = XaeiOS.Kernel.TaskPriorityQueue::IsEmpty()*/;
	r1 = (!r1)/*V_8.1 = BooleanNot $t0*/;
	if(r1)
	{
		r5 = $[287]()/*V_0.1 = XaeiOS.Kernel.TaskPriorityQueue::Remove()*/;
		$[314](r5)/*XaeiOS.Kernel.Scheduler::SetWindowStatus(V_0.1)*/;
		r1 = new Date()/*$t6 = new System.Void System.NativeDate::.ctor()()*/;
		r1 = r1.getTime()/*V_1.1 = $t6.GetTime()*/;
		r0 = r5[0]/*V_2.1 = V_0.1.Continuation*/;
		r0[1] = (r1 + 35)/*V_2.1.TimeSliceEnd = V_1.1 Add (System.Int64)35*/;
		r1 = r0[6]/*V_3.1 = V_2.1.Frame*/;
		_[350] = r5/*XaeiOS.Kernel.Scheduler._currentTask = V_0.1*/;
		try {/*XaeiOS.Kernel.Scheduler::GenerateStartTryBlockCode()*/;
		r2 = r1[1]/*$t13 = V_3.1.Function*/;
		r1 = r1[0]/*$t15 = V_3.1.This*/;
		r3 = r2.apply(r1, r0)/*V_4.1 = $t13.Apply($t15, V_2.1)*/;
		r1 = $[308]()/*$t19 = XaeiOS.Kernel.Scheduler::get_KernelTask()*/;
		_[350] = r1/*XaeiOS.Kernel.Scheduler._currentTask = $t19*/;
		r2 = r0[5]/*$t20 = V_2.1.ParentContinuation*/;
		r1 = _[363].RootContinuation/*$t21 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
		r1 = (!(r2 == r1))/*V_8.2 = BooleanNot $t20 ValueEquality $t21*/;
		if(r1)
		{
			r0 = r0[5]/*V_2.2 = V_2.1.ParentContinuation*/;
			r5[0] = r0/*V_0.1.Continuation = V_2.2*/;
			if(typeof(r3) != "undefined") {/*XaeiOS.Kernel.Scheduler::GenerateIfValueIsDefinedCode(V_4.1)*/;
			r0[4] = r3/*V_2.2.ReturnValue = V_4.1*/;
			}/*XaeiOS.Kernel.Scheduler::GenerateEndBlockCode()*/;
			$[327](r5)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

		}
		else
		{
			$[318](r5,r3,0)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_4.1, 0)*/

		}
		} catch(r4) {/*XaeiOS.Kernel.Scheduler::GenerateStartCatchBlockCode(V_5)*/;
		r1 = _[351]/*$t28 = XaeiOS.Kernel.Scheduler._kernelTask*/;
		_[350] = r1/*XaeiOS.Kernel.Scheduler._currentTask = $t28*/;
		r1 = r4 instanceof Array/*V_8.3 = V_5.InstanceOf("Array")*/;
		if(r1)
		{
			r1 = _[363].RootContinuation/*$t42 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
			r1 = (!(r4 == r1))/*V_8.5 = BooleanNot V_5 ValueEquality $t42*/;
			if(r1)
			{
				r5[0] = r4/*V_0.1.Continuation = V_5*/;
				$[327](r5)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

			}
			else
			{
				r1 = r4[3]/*$t48 = V_5.Exception*/
				r1 = (r1 == null)/*V_8.6 = $t48 ValueEquality null*/;
				if(r1)
				{
					$[318](r5,r3,0)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_4.1, 0)*/;

				}
				else
				{
					r1 = r4[3]/*$t53 = V_5.Exception*/
					$[318](r5,r1,1)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, $t53, 1)*/;

				}

			}

		}
		else
		{
			r2 = $[316](r4)/*V_6.1 = XaeiOS.Kernel.Scheduler::ConvertToManagedException(V_5)*/
			r3 = r0[5]/*V_7.1 = V_2.5.ParentContinuation*/;
			r1 = _[363].RootContinuation/*$t33 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
			r1 = (!(r3 == r1))/*V_8.4 = BooleanNot V_7.1 ValueEquality $t33*/;
			if(r1)
			{
				r5[0] = r3/*V_0.1.Continuation = V_7.1*/;
				r3[3] = r2/*V_7.1.Exception = V_6.1*/;
				$[327](r5)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(V_0.1)*/;

			}
			else
			{
				$[318](r5,r2,1)/*XaeiOS.Kernel.Scheduler::CleanupTask(V_0.1, V_6.1, 1)*/

			}
			}/*XaeiOS.Kernel.Scheduler::GenerateEndBlockCode()*/;

		}

	}
	else
	{
		_[352] = 1/*XaeiOS.Kernel.Scheduler._awaitingTask = 1*/
		$[320]()/*XaeiOS.Kernel.Scheduler::PauseCpu()*/;

	}
	return;

},
function(a0/*e*/)
 //31: System.Exception XaeiOS.Kernel.Scheduler::ConvertToManagedException(System.var)
{
	var r1,r0;
	r1 = ($[34](a0,_[4]) == null)/*V_2.1 = e is System.Exception ValueEquality null*/;
	if(r1)
	{
		r0 = $[317](a0)/*V_1.2 = XaeiOS.Kernel.Scheduler::BuildManagedException(e)*/;

	}
	else
	{
		r0 = $[34](a0,_[4])/*V_1.1 = e is System.Exception*/

	}
	return r0/*V_1.3*/;

},
function(a0/*thrownObject*/)
 //32: System.Exception XaeiOS.Kernel.Scheduler::BuildManagedException(System.var)
{
	var r1,r2,r0;
	var __ep__ = 1;
	__ctrl__:
	while(true)
	{
		switch(__ep__)
		{
			case 1:
			{
				r0 = null/*V_0.1 = null*/;
				r1 = (!(a0 == null))/*V_2.1 = BooleanNot thrownObject ValueEquality null*/;
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
				r1 = {$:_[192],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.ExecutionEngineException::.ctor(System.String)("null")*/
				$[199].call(r1,"null")/*$t9..ctor("null")*/;
				r0 = r1/*V_0.2 = $t9*/;
				__ep__ = 11;
				continue __ctrl__;
			}
			case 3:
			{
				r1 = a0 instanceof Error/*$t15 = thrownObject.InstanceOf("Error")*/
				r1 = (!r1)/*V_2.2 = BooleanNot $t15*/;
				if(r1)
				{
					__ep__ = 10;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 4

				}
			}
			case 4:
			{
				r1 = a0 instanceof ReferenceError/*$t21 = thrownObject.InstanceOf("ReferenceError")*/
				r1 = (!r1)/*V_2.3 = BooleanNot $t21*/;
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
				r1 = a0.toString()/*$t26 = thrownObject.NativeToString()*/
				r2 = {$:_[103],0:null,1:null,2:null,3:null}/*$t27 = new System.Void System.NullReferenceException::.ctor(System.String)($t26)*/;
				$[123].call(r2,r1)/*$t27..ctor($t26)*/;
				r0 = r2/*V_0.3 = $t27*/;
				__ep__ = 11;
				continue __ctrl__;
			}
			case 6:
			{
				r1 = a0 instanceof TypeError/*$t30 = thrownObject.InstanceOf("TypeError")*/
				r1 = (!r1)/*V_2.4 = BooleanNot $t30*/;
				if(r1)
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
				r1 = a0.toString()/*$t35 = thrownObject.NativeToString()*/
				r1 = $[223].call(r1,"has no properties")/*$t37 = $t35.Contains("has no properties")*/;
				r1 = (!r1)/*V_2.5 = BooleanNot $t37*/;
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
				r1 = a0.toString()/*$t42 = thrownObject.NativeToString()*/
				r2 = {$:_[103],0:null,1:null,2:null,3:null}/*$t43 = new System.Void System.NullReferenceException::.ctor(System.String)($t42)*/;
				$[123].call(r2,r1)/*$t43..ctor($t42)*/;
				r0 = r2/*V_0.4 = $t43*/;
				__ep__ = 11;
				continue __ctrl__;
			}
			case 9:
			{
				r1 = a0.toString()/*$t45 = thrownObject.NativeToString()*/
				r2 = {$:_[192],0:null,1:null,2:null,3:null}/*$t46 = new System.Void System.ExecutionEngineException::.ctor(System.String)($t45)*/;
				$[199].call(r2,r1)/*$t46..ctor($t45)*/;
				r0 = r2/*V_0.5 = $t46*/;
				__ep__ = 11;
				continue __ctrl__;
			}
			case 10:
			{
				r1 = a0.toString()/*$t48 = thrownObject.NativeToString()*/
				r2 = {$:_[192],0:null,1:null,2:null,3:null}/*$t49 = new System.Void System.ExecutionEngineException::.ctor(System.String)($t48)*/;
				$[199].call(r2,r1)/*$t49..ctor($t48)*/;
				r0 = r2/*V_0.6 = $t49*/;
				__ep__ = 11;
			}
			case 11:
			{
				r1 = a0[0]/*$t12 = thrownObject._throwContext*/
				r0[0] = r1/*V_0.7._throwContext = $t12*/;
				return r0/*V_0.7*/;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


},
function(a0/*t*/,a1/*returnValue*/,a2/*exitStatus*/)
 //33: System.Void XaeiOS.Kernel.Scheduler::CleanupTask(XaeiOS.Kernel.Task,System.var,XaeiOS.Kernel.TaskExitStatus)
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
				r2 = $[296].call(a0)/*V_0.1 = t.get_Name()*/;
				r0 = _[354]/*$t2 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
				r1 = a0[3]/*$t5 = t.Id*/;
				delete r0[r1]/*$t2.RemoveKey($t5)*/;
				$[299](a0)/*XaeiOS.Kernel.Task::RemoveTask(t)*/;
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
 //34: System.Void XaeiOS.Kernel.Scheduler::StartCpu()
{
	var r0;
	r0 = $[315]/*$t2 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(null, XaeiOS.Kernel.Scheduler::CpuCycle)*/;
	/*$t2..ctor(null, XaeiOS.Kernel.Scheduler::CpuCycle)*/r0 = setInterval(r0, 1)/*$t5 = XaeiOS.Kernel.Scheduler::SetInterval($t2, (System.Int64)1)*/;
	_[353] = r0/*XaeiOS.Kernel.Scheduler._cpuIntervalId = $t5*/;
	return;

},
function()
 //35: System.Void XaeiOS.Kernel.Scheduler::PauseCpu()
{
	var r0;
	r0 = _[353]/*$t0 = XaeiOS.Kernel.Scheduler._cpuIntervalId*/;
	clearInterval(r0)/*XaeiOS.Kernel.Scheduler::ClearInterval($t0)*/;
	return;

},
function()
 //36: System.Void XaeiOS.Kernel.Scheduler::ResumeCpu()
{
	$[319]()/*XaeiOS.Kernel.Scheduler::StartCpu()*/;
	return;

},
function()
 //37: System.Void XaeiOS.Kernel.Scheduler::Shutdown()
{
	$[323]()/*XaeiOS.Kernel.Scheduler::Cleanup()*/;
	$[324]()/*XaeiOS.Kernel.Scheduler::Halt()*/;
	return;

},
function()
 //38: System.Void XaeiOS.Kernel.Scheduler::Cleanup()
{
	$[291]()/*XaeiOS.Kernel.TaskPriorityQueue::Cleanup()*/;
	$[300]()/*XaeiOS.Kernel.Task::Cleanup()*/;
	_[350] = null/*XaeiOS.Kernel.Scheduler._currentTask = null*/;
	return;

},
function()
 //39: System.Void XaeiOS.Kernel.Scheduler::Halt()
{
	$[320]()/*XaeiOS.Kernel.Scheduler::PauseCpu()*/;
	return;

},
function(a0/*priority*/)
 //40: System.Int32 XaeiOS.Kernel.Scheduler::DynamicPriority(XaeiOS.Kernel.TaskPriority)
{
	return ((a0 + 1) * 1000)/*priority Add 1 Multiply 1000*/;

},
function(a0/*t*/)
 //41: System.Void XaeiOS.Kernel.Scheduler::ScheduleTask(XaeiOS.Kernel.Task)
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
				$[286](a0)/*XaeiOS.Kernel.TaskPriorityQueue::Add(t)*/;
				r0 = _[352]/*$t1 = XaeiOS.Kernel.Scheduler._awaitingTask*/;
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
				_[352] = 0/*XaeiOS.Kernel.Scheduler._awaitingTask = 0*/;
				$[321]()/*XaeiOS.Kernel.Scheduler::ResumeCpu()*/;
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
 //42: System.Void XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[354]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0 = r1 in r0/*$t4 = $t0.ContainsKey($t3)*/;
	r0 = (!r0)/*V_1.1 = BooleanNot $t4*/;
	if(r0)
	{
		$[326](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;

	}
	else
	{
		r0 = _[354]/*$t8 = XaeiOS.Kernel.Scheduler._taskStatusMap*/
		r1 = a0[3]/*$t11 = t.Id*/;
		r1 = r0[r1]/*V_0.1 = $t8.get_Item($t11)*/;
		r0 = (!(r1 == 2))/*V_1.2 = BooleanNot V_0.1 ValueEquality 2*/;
		if(r0)
		{
			r0 = (r1 == 1)/*V_1.3 = V_0.1 ValueEquality 1*/;

		}
		else
		{
			$[318](a0,null,2)/*XaeiOS.Kernel.Scheduler::CleanupTask(t, null, 2)*/

		}
		if(r0)
		{
			r0 = _[354]/*$t23 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
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
 //43: System.Void XaeiOS.Kernel.Scheduler::BlockTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[354]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0[r1] = 1/*$t0.set_Item($t3, 1)*/;
	return;

},
function(a0/*t*/)
 //44: System.Void XaeiOS.Kernel.Scheduler::UnblockTask(XaeiOS.Kernel.Task)
{
	var r0,r1;
	r0 = _[354]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
	r1 = a0[3]/*$t3 = t.Id*/;
	r0 = r0[r1]/*$t4 = $t0.get_Item($t3)*/;
	r0 = (r0 == 1)/*V_0.1 = $t4 ValueEquality 1*/;
	if(r0)
	{
		r0 = _[354]/*$t11 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
		r1 = a0[3]/*$t14 = t.Id*/;
		delete r0[r1]/*$t11.RemoveKey($t14)*/;
		$[326](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;
		return;

	}
	else
	{
		r0 = new Error("Task is not blocked")/*$t10 = new System.Void System.NativeError::.ctor(System.String)("Task is not blocked")*/
		throw r0/*$t10*/;

	}

},
function(a0/*t*/)
 //45: System.Void XaeiOS.Kernel.Scheduler::KillTask(XaeiOS.Kernel.Task)
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
				r0 = _[354]/*$t0 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
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
				$[326](a0)/*XaeiOS.Kernel.Scheduler::ScheduleTask(t)*/;
				r0 = _[354]/*$t13 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
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
				r0 = _[354]/*$t22 = XaeiOS.Kernel.Scheduler._taskStatusMap*/;
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
 //46: XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::get_RootContinuation()
{
	var r0;
	r0 = _[364]/*V_0.1 = XaeiOS.Kernel.Continuation._rootContinuation*/;
	return r0/*V_0.1*/;

},
function()
 //47: System.Void XaeiOS.Kernel.Continuation::Initialize()
{
	var r0;
	r0 = new Array()/*$t0 = new System.Void XaeiOS.Kernel.Continuation::.ctor()()*/;
	_[364] = r0/*XaeiOS.Kernel.Continuation._rootContinuation = $t0*/;
	return;

},
function(a0/*self*/,a1/*function*/)
 //48: XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::Create(System.Object,System.NativeFunction)
{
	var r0,r1;
	r1 = new Array()/*$t0 = new System.Void XaeiOS.Kernel.Continuation::.ctor()()*/;
	r1[0] = 1/*$t0.ExecutionPointer = 1*/;
	r0 = _[363].RootContinuation/*$t2 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/;
	r1[5] = r0/*$t0.ParentContinuation = $t2*/;
	r0 = {$:_[342],0:null,1:null,2:0}/*$t5 = new System.Void XaeiOS.Kernel.Frame::.ctor(System.Object,System.NativeFunction)(self, function)*/;
	$[307].call(r0,a0,a1)/*$t5..ctor(self, function)*/;
	r1[6] = r0/*$t0.Frame = $t5*/;
	return r1/*$t0*/;

},
function()
 //49: System.Void XaeiOS.Kernel.Continuation::.ctor()
{
	return;

},
function(a0/*taskId*/)
 //50: XaeiOS.Kernel.Task XaeiOS.SystemCalls::GetTask(System.Int32)
{
	var r0,r1;
	r1 = $[294](a0)/*V_0.1 = XaeiOS.Kernel.Task::GetTaskById(taskId)*/;
	r0 = (!(r1 == null))/*V_2.1 = BooleanNot V_0.1 ValueEquality null*/;
	if(r0)
	{
		return r1/*V_0.1*/;

	}
	else
	{
		r0 = {$:_[4],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.Exception::.ctor(System.String)("Task does not exist.")*/
		$[17].call(r0,"Task does not exist.")/*$t9..ctor("Task does not exist.")*/;
		throw r0/*$t9*/;

	}

},
function()
 //51: System.Void XaeiOS.SystemCalls::InitializeKernel()
{
	$[295]()/*XaeiOS.Kernel.Task::Initialize()*/;
	$[332]()/*XaeiOS.Kernel.Continuation::Initialize()*/;
	$[285]()/*XaeiOS.Kernel.TaskPriorityQueue::Initialize()*/;
	$[313]()/*XaeiOS.Kernel.Scheduler::Initialize()*/;
	return;

},
function(a0/*taskId*/)
 //52: System.Void XaeiOS.SystemCalls::ScheduleTask(System.Int32)
{
	var r0;
	r0 = $[335](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[327](r0)/*XaeiOS.Kernel.Scheduler::ScheduleTaskChecked($t1)*/;
	return;

},
function(a0/*taskId*/)
 //53: System.Void XaeiOS.SystemCalls::BlockTask(System.Int32)
{
	var r0;
	r0 = $[335](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[328](r0)/*XaeiOS.Kernel.Scheduler::BlockTask($t1)*/;
	return;

},
function(a0/*taskId*/)
 //54: System.Void XaeiOS.SystemCalls::UnblockTask(System.Int32)
{
	var r0;
	r0 = $[335](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[329](r0)/*XaeiOS.Kernel.Scheduler::UnblockTask($t1)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 55: System.Void XaeiOS.SystemCalls::Yield()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //56: System.Void XaeiOS.SystemCalls::KillTask(System.Int32)
{
	var r0;
	r0 = $[335](a0)/*$t1 = XaeiOS.SystemCalls::GetTask(taskId)*/;
	$[330](r0)/*XaeiOS.Kernel.Scheduler::KillTask($t1)*/;
	return;

},
function()
 //57: System.Int32 XaeiOS.SystemCalls::GetCurrentTaskId()
{
	var r0;
	r0 = $[309]()/*$t0 = XaeiOS.Kernel.Scheduler::get_CurrentTask()*/;
	r0 = r0[3]/*V_0.1 = $t0.Id*/;
	return r0/*V_0.1*/;

},
function(a0/*self*/,a1/*fn*/,a2/*Callback*/,a3/*priority*/,a4/*name*/)
 //58: System.Int32 XaeiOS.SystemCalls::CreateTask(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)
{
	var r0;
	r0 = {$:_[319],0:null,1:null,2:null,3:0,4:null,5:0}/*$t5 = new System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)(self, fn, Callback, priority, name)*/;
	$[303].call(r0,a0,a1,a2,a3,a4)/*$t5..ctor(self, fn, Callback, priority, name)*/;
	r0 = r0[3]/*V_1.1 = $t5.Id*/;
	return r0/*V_1.1*/;

},
function(a0/*throwContext*/)
 //59: System.String XaeiOS.SystemCalls::GetStackTrace(System.NativeObject)
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
				LogWrite("DEBUG", "SystemCalls.GetStackTrace")/*System.Diagnostics.Logging::Debug("SystemCalls.GetStackTrace")*/;
				r0 = a0/*V_0.1 = throwContext*/;
				r4 = new Array()/*$t4 = new System.Void System.NativeArray`1<System.String>::.ctor()()*/;
				__ep__ = 2;
			}
			case 2:
			{
				r1 = _[363].RootContinuation/*$t5 = XaeiOS.Kernel.Continuation::get_RootContinuation()*/
				r1 = (r0 == r1)/*$t6 = V_0.3 ValueEquality $t5*/;
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
				r1 = (!(r0 == null))/*$ts0 = BooleanNot V_0.3 ValueEquality null*/
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
				r1 = r1/*V_5.1 = $ts0*/
				if(r1)
				{
					__ep__ = 6;

				}
				else
				{
					__ep__ = 10
					continue __ctrl__;

				}
			}
			case 6:
			{
				r4.push("at ")/*$t4.Push("at ")*/
				r1 = r0[6]/*$t16 = V_0.3.Frame*/;
				r1 = r1[1]/*$t17 = $t16.Function*/;
				r2 = r1["d"]/*V_2.1 = $t17.get_Item("d")*/;
				r1 = (r2 == null)/*V_5.2 = V_2.1 ValueEquality null*/;
				if(r1)
				{
					__ep__ = 8;
					continue __ctrl__;

				}
				else
				{
					__ep__ = 7

				}
			}
			case 7:
			{
				__ep__ = 9
				r1 = r2["Name"]/*$t25 = V_2.1.get_Item("Name")*/;
				r1 = r1.toString()/*$t26 = $t25.NativeToString()*/;
				r4.push(r1)/*$t4.Push($t26)*/;
				r4.push(":")/*$t4.Push(":")*/;
				r1 = r0[0]/*$t28 = V_0.3.ExecutionPointer*/;
				r1 = r1.toString()/*$t29 = $t28.ToString()*/;
				r4.push(r1)/*$t4.Push($t29)*/;
				continue __ctrl__;
			}
			case 8:
			{
				__ep__ = 9
				r1 = r0[6]/*$t32 = V_0.3.Frame*/;
				r1 = r1[1]/*$t33 = $t32.Function*/;
				r1 = r1.toString()/*$t34 = $t33.NativeToString()*/;
				r4.push(r1)/*$t4.Push($t34)*/;
			}
			case 9:
			{
				r4.push("\n")/*$t4.Push("
")*/
				r0 = r0[5]/*V_0.2 = V_0.3.ParentContinuation*/;
				__ep__ = 2;
				continue __ctrl__;
			}
			case 10:
			{
				r1 = r4.join("")/*V_4.1 = $t4.Join("")*/
				return r1/*V_4.1*/;
			}
			default:
			{
				throw new Error("Invalid execution pointer")/*[dynamic expression]*/
			}

		}


	}


}

/************
Object image System - Code: 345	Data: 368
**********/

,function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 0: System.Boolean System.Text.RegularExpressions.Regex::IsMatch(System.String,System.String)
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
					r0 = __f__[3].match(__f__[4])/*$t2 = str.Match(pattern)*/;
					return r0/*$t2*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 1: System.Void System.Text.RegularExpressions.Regex::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 2: System.Void System.Text.StringBuilder::Append(System.String)
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
					r0.push(__f__[3])/*$t1.Push(s)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 3: System.String System.Text.StringBuilder::ToString()
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
					__rv__ = r0.join("")/*__rv__ = $t1.Join("")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t3 = __rv__*/
					return r0/*$t3*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 4: System.Void System.Text.StringBuilder::.ctor()
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
					r0 = new Array()/*$t2 = new System.Void System.NativeArray`1<System.String>::.ctor()()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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


}

/************
Object image System.Browser - Code: 350	Data: 372
**********/

,function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 0: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Abort()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.abort()/*$t1.Abort()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 1: System.String System.Browser.XmlHttpRequest.XmlHttpRequest::GetAllResponseHeaders()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.getAllResponseHeaders()/*__rv__ = $t1.GetAllResponseHeaders()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 2: System.String System.Browser.XmlHttpRequest.XmlHttpRequest::GetResponseHeader(System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.getResponseHeader(__f__[3])/*__rv__ = $t1.GetResponseHeader(header)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 3: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.open(__f__[3],__f__[4])/*$t1.Open(method, url)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 4: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.open(__f__[3],__f__[4],__f__[5])/*$t1.Open(method, url, async)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 5: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.open(__f__[3],__f__[4],__f__[5],__f__[6])/*$t1.Open(method, url, async, username)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 6: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String,System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.open(__f__[3],__f__[4],__f__[5],__f__[6],__f__[7])/*$t1.Open(method, url, async, username, password)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 7: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Send(System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.send(__f__[3])/*$t1.Send(postData)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 8: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::SetRequestHeader(System.String,System.String)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.setRequestHeader(__f__[3],__f__[4])/*$t1.SetRequestHeader(label, value)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 9: System.String System.Browser.XmlHttpRequest.XmlHttpRequest::get_ResponseText()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.responseText/*__rv__ = $t1.get_ResponseText()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 10: System.Int32 System.Browser.XmlHttpRequest.XmlHttpRequest::get_Status()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.status/*__rv__ = $t1.get_Status()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 11: System.String System.Browser.XmlHttpRequest.XmlHttpRequest::get_StatusText()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.statusText/*__rv__ = $t1.get_StatusText()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //12: System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.XmlHttpRequest::get_ReadyState()
{
	var r0;
	r0 = this[0]/*$t1 = this._xhr*/;
	r0 = r0.readyState/*V_0.1 = $t1.get_ReadyState()*/;
	return r0/*V_0.1*/;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0)
// 13: System.NativeFunction System.Browser.XmlHttpRequest.XmlHttpRequest::get_OnReadyStateChange()
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
					r0 = this[0]/*$t1 = this._xhr*/;
					__rv__ = r0.onreadystatechange/*__rv__ = $t1.get_OnReadyStateChange()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 14: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::set_OnReadyStateChange(System.NativeFunction)
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
					r0 = this[0]/*$t1 = this._xhr*/;
					r0.onreadystatechange = __f__[3]/*$t1.set_OnReadyStateChange(value)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 15: System.String System.Browser.XmlHttpRequest.XmlHttpRequest::ToString()
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
					r1 = new Array(7)/*V_1.1 = new System.Object[7]*/;
					r1[0] = "XmlHttpRequest(ReadyState="/*V_1.1[0] = "XmlHttpRequest(ReadyState="*/;
					r0 = this[0]/*$t6 = this._xhr*/;
					__rv__ = r0.readyState/*__rv__ = $t6.get_ReadyState()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t7 = __rv__*/;
					r1[1] = r0/*V_1.1[1] = $t7*/;
					r1[2] = ", Status="/*V_1.1[2] = ", Status="*/;
					r0 = this[0]/*$t12 = this._xhr*/;
					__rv__ = r0.status/*__rv__ = $t12.get_Status()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t13 = __rv__*/;
					r1[3] = r0/*V_1.1[3] = $t13*/;
					r1[4] = " "/*V_1.1[4] = " "*/;
					r0 = this[0]/*$t18 = this._xhr*/;
					__rv__ = r0.statusText/*__rv__ = $t18.get_StatusText()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t19 = __rv__*/;
					r1[5] = r0/*V_1.1[5] = $t19*/;
					r1[6] = ")"/*V_1.1[6] = ")"*/;
					__rv__ = $[227](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*__rv__ = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 16: System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::.ctor(System.Browser.XmlHttpRequest.IXmlHttpRequest)
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
					this[0] = __f__[3]/*this._xhr = xhr*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 17: System.Browser.Dom.IDomElement System.Browser.Dom.DomManager::CreateElement(System.String)
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
					r0 = document/*$t0 = System.Browser.Dom.DomManager::get_Document()*/;
					__rv__ = r0.createElement(__f__[3])/*__rv__ = $t0.CreateElement(tagName)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*V_0.1 = __rv__*/;
					$[368](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*System.Browser.Dom.DomManager::RegisterElement(V_0.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 18: System.Void System.Browser.Dom.DomManager::RegisterElement(System.Browser.Dom.IDomElement)
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
					r0 = {$:_[393],0:null}/*$t1 = new System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::.ctor(System.Browser.Dom.IDomElement)(element)*/;
					$[371].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3]])/*$t1..ctor(element)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[27](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*System.Resources.ResourceManager::RegisterResource($t1)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 19: System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::Dispose()
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
					r0 = this[0]/*$t1 = this.DomElement*/;
					r0 = (r0 == null)/*V_0.1 = $t1 ValueEquality null*/;
					if(r0)
					{
						__ep__ = 7;
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
					r0 = this[0]/*$t6 = this.DomElement*/;
					__rv__ = r0.parentNode/*__rv__ = $t6.get_ParentNode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = __rv__/*$t7 = __rv__*/
					r0 = (r0 == null)/*V_0.2 = $t7 ValueEquality null*/;
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
					r0 = this[0]/*$t12 = this.DomElement*/;
					__rv__ = r0.parentNode/*__rv__ = $t12.get_ParentNode()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t13 = __rv__*/;
					r1 = this[0]/*$t15 = this.DomElement*/;
					r0.removeChild(r1)/*$t13.RemoveChild($t15)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					this[0] = null/*this.DomElement = null*/
					__ep__ = 7;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0)
// 20: System.String System.Browser.Dom.DomManager/DomElementResourceWrapper::ToString()
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
					r1 = this[0]/*$t1 = this.DomElement*/;
					r1 = (r1 == null)/*V_1.1 = $t1 ValueEquality null*/;
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 4
					r1 = this[0]/*$t6 = this.DomElement*/;
					__rv__ = r1.$[0].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0])/*__rv__ = $t6.ToString()*/;
					continue __ctrl__;
				}
				case 3:
				{
					r0 = "[free]"/*V_0.2 = "[free]"*/
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r0 = __rv__/*V_0.1 = __rv__*/
					return r0/*V_0.3*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 21: System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::.ctor(System.Browser.Dom.IDomElement)
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
					this[0] = __f__[3]/*this.DomElement = domElement*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 22: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::GetXmlHttpRequest()
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
					r0 = new XMLHttpRequest()/*$t0 = System.Browser.XmlHttpRequest.XmlHttpRequestManager::NativeGetXmlHttpRequest()*/;
					r1 = {$:_[372],0:null}/*$t1 = new System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::.ctor(System.Browser.XmlHttpRequest.IXmlHttpRequest)($t0)*/;
					$[366].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*$t1..ctor($t0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					return r1/*$t1*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 23: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String)
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
					__rv__ = $[374](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],0])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(url, 0)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 24: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod)
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
					__rv__ = $[376](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],0,null,null,null])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(url, 0, null, null, null)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 25: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String,System.Int32)
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
					r0 = (__f__[8] > 0)/*V_1.1 = timeoutMs GreaterThan 0*/;
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
					r0 = {$:_[132],0:null,1:null,2:null,3:null}/*$t5 = new System.Void System.ArgumentOutOfRangeException::.ctor(System.String)("timeoutMs must be greater than 0")*/;
					$[127].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"timeoutMs must be greater than 0"])/*$t5..ctor("timeoutMs must be greater than 0")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					throw r0/*$t5*/
				}
				case 4:
				{
					__ep__ = 5
					__rv__ = $[377](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4],__f__[5],__f__[6],__f__[7],__f__[8]])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::_doSimpleXmlHttpRequest(url, method, postData, username, password, timeoutMs)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 5:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 26: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String)
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
					__rv__ = $[377](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4],__f__[5],__f__[6],__f__[7],-1])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::_doSimpleXmlHttpRequest(url, method, postData, username, password, -1)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5)
// 27: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::_doSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String,System.Int32)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					__rv__ = $[372](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::GetXmlHttpRequest()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r5 = __rv__/*V_0.1 = __rv__*/;
					r1 = {$:_[101],0:0,1:null}/*$t1 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[121].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[118].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r3 = {$:_[150],0:null,1:null,2:null,3:0,4:0}/*$t2 = new System.Void System.Threading.TimedCondition::.ctor(System.Threading.Lock)($t1)*/;
					$[144].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,r1])/*$t2..ctor($t1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r1 = {$:_[397],0:null,1:null}/*$t3 = new System.Void System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::.ctor()()*/;
					$[379].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0])/*$t3..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r1[1] = r5/*$t3.XmlHttpRequest = V_0.1*/;
					r1[0] = r3/*$t3.Condition = $t2*/;
					r2 = $[134].call($[378],r1)/*$t5 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)($t3, System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::OnReadyStateChange)*/;
					/*$t5..ctor($t3, System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::OnReadyStateChange)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r1 = $[135](r2)/*$t6 = System.NativeFunction::op_Explicit($t5)*/;
					$[364].call(r5,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,r1])/*V_0.1.set_OnReadyStateChange($t6)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r1 = (!(__f__[4] == 0))/*V_6.1 = BooleanNot method ValueEquality 0*/
					if(r1)
					{
						__ep__ = 10;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 9
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

						}

					}
				}
				case 9:
				{
					r0 = "GET"/*V_4.1 = "GET"*/
					__ep__ = 11;
					continue __ctrl__;
				}
				case 10:
				{
					r0 = "POST"/*V_4.2 = "POST"*/
					__ep__ = 11;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					$[356].call(r5,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,r0,__f__[3],1,__f__[6],__f__[7]])/*V_0.1.Open(V_4.3, url, 1, username, password)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					$[357].call(r5,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,__f__[5]])/*V_0.1.Send(postData)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					r1 = (!(__f__[8] > 0))/*V_6.2 = BooleanNot timeoutMs GreaterThan 0*/
					if(r1)
					{
						__ep__ = 15;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 14
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

						}

					}
				}
				case 14:
				{
					__ep__ = 16
					__ecp__ = 17;
					$[142].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,__f__[8]])/*$t2.Await(timeoutMs)*/;
					continue __ctrl__;
				}
				case 15:
				{
					__ep__ = 16
					$[140].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0])/*$t2.Await()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					return r5/*V_0.1*/
				}
				case 17:
				{
					__ep__ = 18
					__ecp__ = null;
					r1 = {$:_[403],0:null,1:null,2:null,3:null,4:null}/*$t30 = new System.Void System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest)(V_0)*/;
					__ex__ = null;
					$[381].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5],[null,null,0,r4])/*$t30..ctor(V_0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					throw r1/*$t30*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r2,r0,r3,r4,r5]/*e._throwContext = [dynamic expression]*/;

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
 //28: System.Void System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::OnReadyStateChange()
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
				r0 = this[1]/*$t1 = this.XmlHttpRequest*/;
				r0 = $[362].call(r0)/*$t2 = $t1.get_ReadyState()*/;
				r0 = (!(r0 == 4))/*V_0.1 = BooleanNot $t2 ValueEquality 4*/;
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
				r0 = this[0]/*$t10 = this.Condition*/;
				r1 = {$:_[34],0:null,1:null,2:null,3:null}/*$t12 = new System.Void System.Threading.ThreadStart::.ctor(System.Object,System.IntPtr)($t10, System.Threading.Condition::Signal)*/;
				$[78](r1,r0,$[139])/*$t12..ctor($t10, System.Threading.Condition::Signal)*/;
				$[69](r1)/*System.Threading.Thread::ExecuteAsync($t12)*/;
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
// 29: System.Void System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 30: System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException::get_XmlHttpRequest()
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
					r0 = this[4]/*V_0.1 = this._xmlHttpRequest*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 31: System.Void System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest)
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
					$[16].call(this)/*this..ctor()*/;
					this[4] = __f__[3]/*this._xmlHttpRequest = xhr*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
Object image System.Net - Code: 382	Data: 405
**********/

,function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 0: System.Void System.Net.Socket::Connect()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 1: System.Void System.Net.Socket::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 2: System.String System.Net.JsonRpc.JsonRpcClient::get_ServerUrl()
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
					r0 = this[0]/*V_0.1 = this.<ServerUrl>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 3: System.Void System.Net.JsonRpc.JsonRpcClient::set_ServerUrl(System.String)
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
					this[0] = __f__[3]/*this.<ServerUrl>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 4: System.String System.Net.JsonRpc.JsonRpcClient::get_Username()
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
					r0 = this[1]/*V_0.1 = this.<Username>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 5: System.Void System.Net.JsonRpc.JsonRpcClient::set_Username(System.String)
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
					this[1] = __f__[3]/*this.<Username>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 6: System.String System.Net.JsonRpc.JsonRpcClient::get_Password()
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
					r0 = this[2]/*V_0.1 = this.<Password>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 7: System.Void System.Net.JsonRpc.JsonRpcClient::set_Password(System.String)
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
					this[2] = __f__[3]/*this.<Password>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 8: System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String)
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
					r0 = new Array(0)/*$t3 = new System.Object[0]*/;
					__rv__ = $[391].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],r0])/*__rv__ = this.Call(method, $t3)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 9: System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String,System.Object[])
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
					__rv__ = $[392].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4],-1])/*__rv__ = this.Call(method, args, -1)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 10: System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String,System.Object[],System.Int32)
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
					__rv__ = $[372](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = System.Browser.XmlHttpRequest.XmlHttpRequestManager::GetXmlHttpRequest()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r4 = __rv__/*V_0.1 = __rv__*/;
					r0 = {$:_[101],0:0,1:null}/*$t1 = new System.Void System.Threading.Lock::.ctor()()*/;
					$[121].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[118].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*$t1.Acquire()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r3 = {$:_[150],0:null,1:null,2:null,3:0,4:0}/*$t2 = new System.Void System.Threading.TimedCondition::.ctor(System.Threading.Lock)($t1)*/;
					$[144].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0])/*$t2..ctor($t1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = {$:_[410],0:null,1:null}/*$t3 = new System.Void System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest,System.Threading.Condition)(V_0.1, $t2)*/;
					$[404].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r4,r3])/*$t3..ctor(V_0.1, $t2)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					r1 = $[134].call($[403],r0)/*$t5 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)($t3, System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::OnReadyStateChange)*/;
					/*$t5..ctor($t3, System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::OnReadyStateChange)*/if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = $[135](r1)/*$t6 = System.NativeFunction::op_Explicit($t5)*/;
					$[364].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0])/*V_0.1.set_OnReadyStateChange($t6)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					__rv__ = $[384].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = this.get_ServerUrl()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					r2 = __rv__/*$t9 = __rv__*/;
					__rv__ = $[386].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = this.get_Username()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					r1 = __rv__/*$t12 = __rv__*/;
					__rv__ = $[388].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = this.get_Password()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					r0 = __rv__/*$t14 = __rv__*/;
					$[356].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,"POST",r2,1,r1,r0])/*V_0.1.Open("POST", $t9, 1, $t12, $t14)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					$[358].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,"Rpc-Method",__f__[3]])/*V_0.1.SetRequestHeader("Rpc-Method", method)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					__rv__ = $[393](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[4]])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::Serialize(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					r0 = __rv__/*$t18 = __rv__*/;
					$[357].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0])/*V_0.1.Send($t18)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					r0 = (!(__f__[5] > 0))/*V_5.1 = BooleanNot timeout GreaterThan 0*/
					if(r0)
					{
						__ep__ = 17;
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
					__ep__ = 18
					__ecp__ = 34;
					$[142].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,__f__[5]])/*$t2.Await(timeout)*/;
					continue __ctrl__;
				}
				case 17:
				{
					__ep__ = 18
					$[140].call(r3,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*$t2.Await()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					__ep__ = 19
					__rv__ = $[360].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_Status()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 19:
				{
					__ep__ = 20
					r0 = __rv__/*$t28 = __rv__*/;
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,"Status code is: ",r0])/*__rv__ = System.String::Concat("Status code is: ", $t28)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 20:
				{
					__ep__ = 21
					r0 = __rv__/*$t29 = __rv__*/;
					LogWrite("DEBUG", r0)/*System.Diagnostics.Logging::Debug($t29)*/;
					__rv__ = $[360].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_Status()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 21:
				{
					r0 = __rv__/*$t30 = __rv__*/
					r0 = (!(r0 == 200))/*V_5.2 = BooleanNot $t30 ValueEquality 200*/;
					if(r0)
					{
						__ep__ = 27;
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
					__ep__ = 23
					__rv__ = $[359].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_ResponseText()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 23:
				{
					__ep__ = 24
					r0 = __rv__/*$t38 = __rv__*/;
					r0 = ("Got 200! Response text is " + r0)/*$t39 = System.String::Concat("Got 200! Response text is ", $t38)*/;
					LogWrite("DEBUG", r0)/*System.Diagnostics.Logging::Debug($t39)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 24:
				{
					__ep__ = 25
					__rv__ = $[359].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_ResponseText()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 25:
				{
					__ep__ = 26
					r0 = __rv__/*$t40 = __rv__*/;
					__rv__ = $[400](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,r0])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::Deserialize($t40)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 26:
				{
					r0 = __rv__/*V_4.1 = __rv__*/
					return r0/*V_4.1*/;
				}
				case 27:
				{
					__ep__ = 28
					__rv__ = $[360].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_Status()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 28:
				{
					r0 = __rv__/*$t42 = __rv__*/
					r0 = (!(r0 == 0))/*V_5.3 = BooleanNot $t42 ValueEquality 0*/;
					if(r0)
					{
						__ep__ = 29;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 32
						continue __ctrl__;

					}
				}
				case 29:
				{
					__ep__ = 30
					__rv__ = $[359].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0])/*__rv__ = V_0.1.get_ResponseText()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 30:
				{
					__ep__ = 31
					r0 = __rv__/*$t58 = __rv__*/;
					r1 = {$:_[423],0:null,1:null,2:null,3:null,4:null,5:null,6:null}/*$t59 = new System.Void System.Net.JsonRpc.JsonRpcException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.String)(this, method, args, $t58)*/;
					$[414].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,this,__f__[3],__f__[4],r0])/*$t59..ctor(this, method, args, $t58)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 31:
				{
					throw r1/*$t59*/
				}
				case 32:
				{
					__ep__ = 33
					LogWrite("DEBUG", "Request timed out!!!")/*System.Diagnostics.Logging::Debug("Request timed out!!!")*/;
					r0 = {$:_[425],0:null,1:null,2:null,3:null,4:null,5:null,6:null}/*$t54 = new System.Void System.Net.JsonRpc.JsonRpcCallTimedOutException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.Int32)(this, method, args, 1000)*/;
					$[415].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,this,__f__[3],__f__[4],1000])/*$t54..ctor(this, method, args, 1000)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 33:
				{
					throw r0/*$t54*/
				}
				case 34:
				{
					__ep__ = 35
					__ecp__ = null;
					LogWrite("DEBUG", "Request timed out!!!")/*System.Diagnostics.Logging::Debug("Request timed out!!!")*/;
					__ex__ = null;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 35:
				{
					__ep__ = 36
					r0 = {$:_[425],0:null,1:null,2:null,3:null,4:null,5:null,6:null}/*$t66 = new System.Void System.Net.JsonRpc.JsonRpcCallTimedOutException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.Int32)(this, method, args, timeout)*/;
					$[415].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4],[null,null,0,this,__f__[3],__f__[4],__f__[5]])/*$t66..ctor(this, method, args, timeout)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 36:
				{
					throw r0/*$t66*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 11: System.String System.Net.JsonRpc.JsonRpcClient::Serialize(System.Object)
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
					r1 = (!(__f__[3] == null))/*V_4.1 = BooleanNot obj ValueEquality null*/;
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 10
					__rv__ = $[394](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::SerializeNull()*/;
					continue __ctrl__;
				}
				case 3:
				{
					r1 = ($[34](__f__[3],_[202]) == null)/*V_4.2 = obj is System.String ValueEquality null*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					__ep__ = 10
					__rv__ = $[395](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,$[34](__f__[3],_[202])])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::SerializeString(obj is System.String)*/;
					continue __ctrl__;
				}
				case 5:
				{
					__ep__ = 6
					__rv__ = $[396](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,__f__[3]])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::CanSerializeWithToString(obj)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					r1 = __rv__/*$t15 = __rv__*/
					r1 = (!r1)/*V_4.3 = BooleanNot $t15*/;
					if(r1)
					{
						__ep__ = 8;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 7
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 7:
				{
					__ep__ = 10
					__rv__ = $[397](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,__f__[3]])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::SerializeWithToString(obj)*/;
					continue __ctrl__;
				}
				case 8:
				{
					r1 = __f__[3] instanceof Array/*$t24 = obj.InstanceOf("Array")*/
					r1 = (!r1)/*V_4.4 = BooleanNot $t24*/;
					if(r1)
					{
						__ep__ = 11;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 9
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 9:
				{
					__ep__ = 10
					__rv__ = $[398](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,__f__[3]])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::SerializeArray(obj)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r0 = __rv__/*V_3.4 = __rv__*/
					r0 = __rv__/*V_3.3 = __rv__*/;
					r0 = __rv__/*V_3.2 = __rv__*/;
					r0 = __rv__/*V_3.1 = __rv__*/;
					return r0/*V_3.5*/;
				}
				case 11:
				{
					r1 = ($[34](__f__[3],_[2]) == null)/*V_4.5 = obj is System.NativeObject ValueEquality null*/
					if(r1)
					{
						__ep__ = 13;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 12
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 12:
				{
					__ep__ = 13
					$[399](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,$[34](__f__[3],_[2])])/*System.Net.JsonRpc.JsonRpcClient::SerializeNativeObject(obj is System.NativeObject)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Could not serialize: ",__f__[3]])/*__rv__ = System.String::Concat("Could not serialize: ", obj)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					r1 = __rv__/*$t38 = __rv__*/;
					r2 = {$:_[154],0:null,1:null,2:null,3:null}/*$t39 = new System.Void System.NotSupportedException::.ctor(System.String)($t38)*/;
					$[147].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*$t39..ctor($t38)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					throw r2/*$t39*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 12: System.String System.Net.JsonRpc.JsonRpcClient::SerializeNull()
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
					return "null"/*"null"*/;
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 13: System.String System.Net.JsonRpc.JsonRpcClient::SerializeString(System.String)
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
					r0 = ("\"" + __f__[3] + "\"")/*V_0.1 = System.String::Concat("\"", str, "\"")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 14: System.Boolean System.Net.JsonRpc.JsonRpcClient::CanSerializeWithToString(System.Object)
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
					r0 = $[34](__f__[3],_[47])/*$t1 = obj is System.Int32*/;
					if(r0)
					{
						__ep__ = 7;
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
					r0 = $[34](__f__[3],_[231])/*$t3 = obj is System.Single*/
					if(r0)
					{
						__ep__ = 7;
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
					r0 = $[34](__f__[3],_[158])/*$t5 = obj is System.Double*/
					if(r0)
					{
						__ep__ = 7;
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
					r0 = $[34](__f__[3],_[209])/*$t7 = obj is System.Byte*/
					if(r0)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					r0 = $[34](__f__[3],_[235])/*$t9 = obj is System.Int16*/
					if(r0)
					{
						__ep__ = 7;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					r0 = ($[34](__f__[3],_[77]) > null)/*$ts0 = obj is System.Boolean GreaterThan null*/
					__ep__ = 8;
					continue __ctrl__;
				}
				case 7:
				{
					r0 = 1/*$ts0 = 1*/
					__ep__ = 8;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					return r0/*$ts0*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 15: System.String System.Net.JsonRpc.JsonRpcClient::SerializeWithToString(System.Object)
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
					__rv__ = __f__[3].$[0].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*__rv__ = obj.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t2 = __rv__*/
					r0 = ("\"" + r0 + "\"")/*V_0.1 = System.String::Concat("\"", $t2, "\"")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 16: System.String System.Net.JsonRpc.JsonRpcClient::SerializeArray(System.NativeArray`1<System.Object>)
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
					r2 = {$:_[370],0:null}/*$t0 = new System.Void System.Text.StringBuilder::.ctor()()*/;
					$[349].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[347].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"["])/*$t0.Append("[")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r0 = 0/*V_1.1 = 0*/
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r1 = __f__[3].length/*$t4 = array.get_Length()*/
					r1 = (r0 < r1)/*V_3.1 = V_1.3 LessThan $t4*/;
					if(r1)
					{
						__ep__ = 8;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 5
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 5:
				{
					__ep__ = 6
					$[347].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"]"])/*$t0.Append("]")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = r2.$[0].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t0.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					r1 = __rv__/*V_2.1 = __rv__*/
					return r1/*V_2.1*/;
				}
				case 8:
				{
					__ep__ = 9
					r1 = __f__[3][r0]/*$t11 = array.get_Item(V_1.3)*/;
					__rv__ = $[393](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::Serialize($t11)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					r1 = __rv__/*$t12 = __rv__*/;
					$[347].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*$t0.Append($t12)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					r1 = __f__[3].length/*$t14 = array.get_Length()*/
					r1 = (!(r0 < (r1 - 1)))/*V_3.2 = BooleanNot V_1.3 LessThan $t14 Subtract 1*/;
					if(r1)
					{
						__ep__ = 12;
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
					$[347].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,","])/*$t0.Append(",")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					r0 = (r0 + 1)/*V_1.2 = V_1.3 Add 1*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4)
// 17: System.String System.Net.JsonRpc.JsonRpcClient::SerializeNativeObject(System.NativeObject)
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
			throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

		}
		try
		{
			switch(__ep__)
			{
				case 1:
				{
					__ep__ = 2;
					r4 = {$:_[370],0:null}/*$t0 = new System.Void System.Text.StringBuilder::.ctor()()*/;
					$[349].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0])/*$t0..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[347].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,"{"])/*$t0.Append("{")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					__rv__ = $[4].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0])/*__rv__ = nativeObj.GetKeys()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					r3 = __rv__/*V_1.1 = __rv__*/
					r0 = 0/*V_2.1 = 0*/;
					__ep__ = 5;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r1 = (r0 < r3.length)/*V_5.1 = V_2.3 LessThan (System.Int32)V_1.1.Length*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					$[347].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,"}"])/*$t0.Append("}")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					__rv__ = r4.$[0].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0])/*__rv__ = $t0.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r1 = __rv__/*V_4.1 = __rv__*/
					return r1/*V_4.1*/;
				}
				case 9:
				{
					r1 = (r3[r0] == "$")/*$t13 = System.String::op_Equality(V_1.1[V_2.3], "$")*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 10:
				{
					r1 = (r3[r0] == "prototype")/*$t15 = System.String::op_Equality(V_1.1[V_2.3], "prototype")*/
					r1 = (!r1)/*$ts0 = BooleanNot $t15*/;
					__ep__ = 12;
					continue __ctrl__;
				}
				case 11:
				{
					r1 = 0/*$ts0 = 0*/
					__ep__ = 12;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					r1 = r1/*V_5.2 = $ts0*/
					if(r1)
					{
						__ep__ = 13;
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
					else
					{
						__ep__ = 18
						continue __ctrl__;

					}
				}
				case 13:
				{
					__ep__ = 14
					r1 = __f__[3][r3[r0]]/*$t22 = nativeObj.get_Item(V_1.1[V_2.3])*/;
					__rv__ = $[393](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,r1])/*__rv__ = System.Net.JsonRpc.JsonRpcClient::Serialize($t22)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					r1 = __rv__/*$t23 = __rv__*/;
					$[347].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,r1])/*$t0.Append($t23)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					__ep__ = 16
					$[347].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,","])/*$t0.Append(",")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					r1 = (!(r0 < (r3.length - 1)))/*V_5.3 = BooleanNot V_2.3 LessThan (System.Int32)V_1.1.Length Subtract 1*/
					if(r1)
					{
						__ep__ = 18;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 17
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

						}

					}
				}
				case 17:
				{
					__ep__ = 18
					$[347].call(r4,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4],[null,null,0,","])/*$t0.Append(",")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					r0 = (r0 + 1)/*V_2.2 = V_2.3 Add 1*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
			if((e[0] == null))
			{
				e[0] = [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2,r3,r4]/*e._throwContext = [dynamic expression]*/;

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
// 18: System.Object System.Net.JsonRpc.JsonRpcClient::Deserialize(System.String)
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
					r0 = ("[" + __f__[3] + "]")/*$t3 = System.String::Concat("[", json, "]")*/;
					__rv__ = eval(r0)/*__rv__ = System.Net.JsonRpc.JsonRpcClient::Eval($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t5 = __rv__*/
					r0 = r0[0]/*V_0.1 = $t5.get_Item(0)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 19: System.Void System.Net.JsonRpc.JsonRpcClient::.ctor(System.String)
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
					$[402].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],null,null])/*this..ctor(serverUrl, null, null)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 20: System.Void System.Net.JsonRpc.JsonRpcClient::.ctor(System.String,System.String,System.String)
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
					$[385].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this.set_ServerUrl(serverUrl)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[387].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[4]])/*this.set_Username(username)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[389].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[5]])/*this.set_Password(password)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
 //21: System.Void System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::OnReadyStateChange()
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
				r0 = this[0]/*$t1 = this.XmlHttpRequest*/;
				r0 = $[362].call(r0)/*$t2 = $t1.get_ReadyState()*/;
				r0 = (!(r0 == 4))/*V_0.1 = BooleanNot $t2 ValueEquality 4*/;
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
				LogWrite("DEBUG", "XmlHttpRequest.ReadyState = Loaded")/*System.Diagnostics.Logging::Debug("XmlHttpRequest.ReadyState = Loaded")*/;
				r0 = this[1]/*$t11 = this.Condition*/;
				r1 = {$:_[34],0:null,1:null,2:null,3:null}/*$t13 = new System.Void System.Threading.ThreadStart::.ctor(System.Object,System.IntPtr)($t11, System.Threading.Condition::Signal)*/;
				$[78](r1,r0,$[139])/*$t13..ctor($t11, System.Threading.Condition::Signal)*/;
				$[69](r1)/*System.Threading.Thread::ExecuteAsync($t13)*/;
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
// 22: System.Void System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest,System.Threading.Condition)
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
					this[0] = __f__[3]/*this.XmlHttpRequest = xhr*/;
					this[1] = __f__[4]/*this.Condition = condition*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 23: System.String System.Net.Comet.CometMessageEventArgs::get_Message()
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
					r0 = this[0]/*V_0.1 = this.<Message>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 24: System.Void System.Net.Comet.CometMessageEventArgs::set_Message(System.String)
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
					this[0] = __f__[3]/*this.<Message>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 25: System.Void System.Net.Comet.CometMessageEventArgs::.ctor(System.String)
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
					$[125].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0])/*this..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[406].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this.set_Message(message)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 26: System.Net.JsonRpc.JsonRpcClient System.Net.JsonRpc.JsonRpcException::get_Client()
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
					r0 = this[4]/*V_0.1 = this.<Client>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 27: System.Void System.Net.JsonRpc.JsonRpcException::set_Client(System.Net.JsonRpc.JsonRpcClient)
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
					this[4] = __f__[3]/*this.<Client>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 28: System.String System.Net.JsonRpc.JsonRpcException::get_Method()
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
					r0 = this[5]/*V_0.1 = this.<Method>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 29: System.Void System.Net.JsonRpc.JsonRpcException::set_Method(System.String)
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
					this[5] = __f__[3]/*this.<Method>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 30: System.Object[] System.Net.JsonRpc.JsonRpcException::get_Arguments()
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
					r0 = this[6]/*V_0.1 = this.<Arguments>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 31: System.Void System.Net.JsonRpc.JsonRpcException::set_Arguments(System.Object[])
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
					this[6] = __f__[3]/*this.<Arguments>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 32: System.Void System.Net.JsonRpc.JsonRpcException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.String)
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
					$[17].call(this,__f__[6])/*this..ctor(message)*/;
					$[409].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this.set_Client(client)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[411].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[4]])/*this.set_Method(method)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[413].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[5]])/*this.set_Arguments(args)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 33: System.Void System.Net.JsonRpc.JsonRpcCallTimedOutException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.Int32)
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
					__rv__ = $[225](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,"The request timed out after ",__f__[6]," milliseconds."])/*__rv__ = System.String::Concat("The request timed out after ", timeout, " milliseconds.")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t7 = __rv__*/;
					$[414].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,__f__[3],__f__[4],__f__[5],r0])/*this..ctor(client, method, args, $t7)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 34: System.String System.Net.Comet.CometConnection::get_ServerUrl()
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
					r0 = this[6]/*V_0.1 = this.<ServerUrl>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 35: System.Void System.Net.Comet.CometConnection::set_ServerUrl(System.String)
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
					this[6] = __f__[3]/*this.<ServerUrl>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 36: System.Net.Comet.CometConnectionState System.Net.Comet.CometConnection::get_State()
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
					r0 = this[7]/*V_0.1 = this.<State>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 37: System.Void System.Net.Comet.CometConnection::set_State(System.Net.Comet.CometConnectionState)
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
					this[7] = __f__[3]/*this.<State>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 38: System.String System.Net.Comet.CometConnection::get_Username()
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
					r0 = this[8]/*V_0.1 = this.<Username>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 39: System.Void System.Net.Comet.CometConnection::set_Username(System.String)
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
					this[8] = __f__[3]/*this.<Username>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 40: System.String System.Net.Comet.CometConnection::get_Password()
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
					r0 = this[9]/*V_0.1 = this.<Password>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 41: System.Void System.Net.Comet.CometConnection::set_Password(System.String)
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
					this[9] = __f__[3]/*this.<Password>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 42: System.Void System.Net.Comet.CometConnection::add_Established(System.EventHandler)
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
					r0 = this[1]/*$t2 = this.Established*/;
					__rv__ = $[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Combine($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[1] = $[32](r0,_[65],true)/*this.Established = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 43: System.Void System.Net.Comet.CometConnection::remove_Established(System.EventHandler)
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
					r0 = this[1]/*$t2 = this.Established*/;
					__rv__ = $[81](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Remove($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[1] = $[32](r0,_[65],true)/*this.Established = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 44: System.Void System.Net.Comet.CometConnection::add_Restablishing(System.EventHandler)
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
					r0 = this[2]/*$t2 = this.Restablishing*/;
					__rv__ = $[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Combine($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[2] = $[32](r0,_[65],true)/*this.Restablishing = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 45: System.Void System.Net.Comet.CometConnection::remove_Restablishing(System.EventHandler)
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
					r0 = this[2]/*$t2 = this.Restablishing*/;
					__rv__ = $[81](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Remove($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[2] = $[32](r0,_[65],true)/*this.Restablishing = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 46: System.Void System.Net.Comet.CometConnection::add_Reestablished(System.EventHandler)
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
					r0 = this[3]/*$t2 = this.Reestablished*/;
					__rv__ = $[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Combine($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[3] = $[32](r0,_[65],true)/*this.Reestablished = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 47: System.Void System.Net.Comet.CometConnection::remove_Reestablished(System.EventHandler)
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
					r0 = this[3]/*$t2 = this.Reestablished*/;
					__rv__ = $[81](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Remove($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[3] = $[32](r0,_[65],true)/*this.Reestablished = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 48: System.Void System.Net.Comet.CometConnection::add_Failed(System.EventHandler)
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
					r0 = this[4]/*$t2 = this.Failed*/;
					__rv__ = $[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Combine($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[4] = $[32](r0,_[65],true)/*this.Failed = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 49: System.Void System.Net.Comet.CometConnection::remove_Failed(System.EventHandler)
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
					r0 = this[4]/*$t2 = this.Failed*/;
					__rv__ = $[81](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Remove($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[4] = $[32](r0,_[65],true)/*this.Failed = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 50: System.Void System.Net.Comet.CometConnection::add_MessageReceived(System.EventHandler)
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
					r0 = this[5]/*$t2 = this.MessageReceived*/;
					__rv__ = $[80](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Combine($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[5] = $[32](r0,_[65],true)/*this.MessageReceived = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 51: System.Void System.Net.Comet.CometConnection::remove_MessageReceived(System.EventHandler)
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
					r0 = this[5]/*$t2 = this.MessageReceived*/;
					__rv__ = $[81](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0,__f__[3]])/*__rv__ = System.Delegate::Remove($t2, value)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t4 = __rv__*/
					this[5] = $[32](r0,_[65],true)/*this.MessageReceived = (System.EventHandler)$t4*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 52: System.Void System.Net.Comet.CometConnection::Open()
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
					__rv__ = $[418].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_State()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = __rv__/*$t1 = __rv__*/
					r0 = (r0 == 0)/*V_0.1 = $t1 ValueEquality 0*/;
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
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Connection must be in state: ",0])/*__rv__ = System.String::Concat("Connection must be in state: ", 0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = __rv__/*$t7 = __rv__*/;
					r1 = {$:_[8],0:null,1:null,2:null,3:null}/*$t8 = new System.Void System.InvalidOperationException::.ctor(System.String)($t7)*/;
					$[22].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*$t8..ctor($t7)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					throw r1/*$t8*/
				}
				case 6:
				{
					__ep__ = 7
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t9 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t9..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 53: System.Void System.Net.Comet.CometConnection::DataReceived(System.Object,System.EventArgs)
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
					r0 = this[5]/*$t2 = this.MessageReceived*/;
					r0 = (r0 == null)/*V_1.1 = $t2 ValueEquality null*/;
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
					r0 = this[5]/*$t7 = this.MessageReceived*/;
					r1 = {$:_[420],0:null}/*$t9 = new System.Void System.Net.Comet.CometMessageEventArgs::.ctor(System.String)(null)*/;
					$[407].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,null])/*$t9..ctor(null)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0.$[3].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,[this, r1]])/*$t7.Invoke(this, $t9)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = {$:_[156],0:null,1:null,2:null,3:null}/*$t10 = new System.Void System.NotImplementedException::.ctor()()*/;
					$[149].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t10..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					throw r0/*$t10*/
				}

			}


		}
		catch(e)
		{
			if(e instanceof Array)
			{
				throw e/*e*/;

			}
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 54: System.Void System.Net.Comet.CometConnection::.ctor(System.String,System.String,System.String)
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
					$[417].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3]])/*this.set_ServerUrl(serverUrl)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[419].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,0])/*this.set_State(0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[421].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[4]])/*this.set_Username(username)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[423].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[5]])/*this.set_Password(password)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__]/*[dynamic expression]*/;

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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 55: System.Void System.Net.Comet.CometConnection::.ctor(System.String)
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
					$[436].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__],[null,null,0,__f__[3],null,null])/*this..ctor(serverUrl, null, null)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
Object image System.Net.Tests - Code: 438	Data: 429
**********/

,function(a0/*args*/)
 //0: System.Void System.Net.Tests.Program::Main(System.String[])
{
	var r0;
	r0 = $[439]/*$t2 = new System.Void System.VoidDelegate::.ctor(System.Object,System.IntPtr)(null, System.Net.Tests.Program::Start)*/;
	/*$t2..ctor(null, System.Net.Tests.Program::Start)*/$[136](r0)/*XaeiOS.Boot.BootManager::Boot($t2)*/;
	return;

},
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0)
// 1: System.Void System.Net.Tests.Program::Start()
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
					$[440](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0])/*System.Net.Tests.Program::RunProcessViewer()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					r0 = 0/*V_0.1 = 0*/
					__ep__ = 3;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					r1 = (r0 < 100)/*V_1.1 = V_0.3 LessThan 100*/
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
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

						}

					}
				}
				case 4:
				{
					return
				}
				case 5:
				{
					__ep__ = 6
					$[441](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0])/*System.Net.Tests.Program::Authenticate()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,"Sleeping for 1 second...."])/*System.Console::WriteLine("Sleeping for 1 second....")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					$[66](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0],[null,null,0,1000])/*System.Threading.Thread::Sleep(1000)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					r0 = (r0 + 1)/*V_0.2 = V_0.3 Add 1*/
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2)
// 2: System.Void System.Net.Tests.Program::RunProcessViewer()
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
					r1 = _[430]/*$t0 = System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate2*/;
					if(r1)
					{
						__ep__ = 4;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 2
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[34],0:null,1:null,2:null,3:null}/*$t3 = new System.Void System.Threading.ThreadStart::.ctor(System.Object,System.IntPtr)(null, System.Net.Tests.Program::<RunProcessViewer>b__0)*/;
					$[78](r0,null,$[442])/*$t3..ctor(null, System.Net.Tests.Program::<RunProcessViewer>b__0)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					_[430] = r0/*System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate2 = $t3*/
					__ep__ = 4;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					r0 = _[430]/*$t4 = System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate2*/;
					r2 = {$:_[178],0:null,1:null,2:null,3:0,4:null,5:0,6:null,7:null}/*$t7 = new System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)($t4, 4, "Process Viewer")*/;
					$[176].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r0,4,"Process Viewer"])/*$t7..ctor($t4, 4, "Process Viewer")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					r0 = _[431]/*$t8 = System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate3*/
					r1 = r2/*$ts0 = $t7*/;
					if(r0)
					{
						__ep__ = 8;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 6
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 6:
				{
					__ep__ = 7
					r0 = {$:_[32],0:null,1:null,2:null,3:null}/*$t11 = new System.Void System.Threading.ThreadCallback::.ctor(System.Object,System.IntPtr)(null, System.Net.Tests.Program::<RunProcessViewer>b__1)*/;
					$[78](r0,null,$[443])/*$t11..ctor(null, System.Net.Tests.Program::<RunProcessViewer>b__1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					_[431] = r0/*System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate3 = $t11*/
					r1 = r2/*$ts0 = $t7*/;
					__ep__ = 8;
					continue __ctrl__;
				}
				case 8:
				{
					__ep__ = 9
					r0 = _[431]/*$t12 = System.Net.Tests.Program.CS$<>9__CachedAnonymousMethodDelegate3*/;
					$[164].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0,r0])/*$ts0.set_Callback($t12)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					$[165].call(r2,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2],[null,null,0])/*$t7.Start()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 3: System.Void System.Net.Tests.Program::Authenticate()
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
					r0 = ("Authenticating as " + "m.public@tenpow.com")/*$t3 = System.String::Concat("Authenticating as ", "m.public@tenpow.com")*/;
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t3)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = {$:_[407],0:null,1:null,2:null}/*$t5 = new System.Void System.Net.JsonRpc.JsonRpcClient::.ctor(System.String)("http://localhost:7777/")*/;
					$[401].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"http://www.tenpow.com:7777/"])/*$t5..ctor("http://localhost:7777/")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					__ecp__ = 8;
					r1 = new Array(2)/*V_6.1 = new System.Object[2]*/;
					r1[0] = "m.public@tenpow.com"/*V_6.1[0] = "m.public@tenpow.com"*/;
					r1[1] = "ABCDEFG"/*V_6.1[1] = "ABCDEFG"*/;
					$[391].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Authenticate",r1])/*$t5.Call("Authenticate", V_6.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					__rv__ = $[391].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Authenticate",r1])/*__rv__ = $t5.Call("Authenticate", V_6.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					r0 = __rv__/*$t14 = __rv__*/;
					r1 = {$:_[433],0:null,1:null}/*$t15 = new System.Void System.Net.Tests.User::.ctor(System.NativeObject)($t14)*/;
					$[450].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*$t15..ctor($t14)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Authentication succeeded: ",r1])/*__rv__ = System.String::Concat("Authentication succeeded: ", $t15)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 10
					r0 = __rv__/*$t17 = __rv__*/;
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t17)*/;
					continue __ctrl__;
				}
				case 8:
				{
					__ep__ = 9
					__ecp__ = null;
					r0 = __ex__/*$t18 = e*/;
					__ex__ = null;
					__rv__ = $[224](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"Authentication failed: ",r0])/*__rv__ = System.String::Concat("Authentication failed: ", $t18)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					r0 = __rv__/*$t20 = __rv__*/;
					$[43](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*System.Console::WriteLine($t20)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 10:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 4: System.Void System.Net.Tests.Program::<RunProcessViewer>b__0()
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
					LogWrite("INFO", "Starting process viewer")/*System.Diagnostics.Logging::Log("Starting process viewer")*/;
					r0 = {$:_[435]}/*$t1 = new System.Void System.Net.Tests.ProcessViewer::.ctor()()*/;
					$[455].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[451].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0])/*$t1.Start()*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 5: System.Void System.Net.Tests.Program::<RunProcessViewer>b__1()
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
					LogWrite("INFO", "Process viewer exited!")/*System.Diagnostics.Logging::Log("Process viewer exited!")*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 6: System.Void System.Net.Tests.Program::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 7: System.String System.Net.Tests.User::get_EmailAddress()
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
					r0 = this[0]/*V_0.1 = this.<EmailAddress>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 8: System.Void System.Net.Tests.User::set_EmailAddress(System.String)
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
					this[0] = __f__[3]/*this.<EmailAddress>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 9: System.String System.Net.Tests.User::get_PasswordHash()
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
					r0 = this[1]/*V_0.1 = this.<PasswordHash>k__BackingField*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 10: System.Void System.Net.Tests.User::set_PasswordHash(System.String)
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
					this[1] = __f__[3]/*this.<PasswordHash>k__BackingField = value*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 11: System.String System.Net.Tests.User::ToString()
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
					r1 = new Array(5)/*V_1.1 = new System.String[5]*/;
					r1[0] = "{ EmailAddress: "/*V_1.1[0] = "{ EmailAddress: "*/;
					__rv__ = $[445].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_EmailAddress()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*$t6 = __rv__*/;
					r1[1] = r0/*V_1.1[1] = $t6*/;
					r1[2] = ", PasswordHash: "/*V_1.1[2] = ", PasswordHash: "*/;
					__rv__ = $[447].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = this.get_PasswordHash()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r0 = __rv__/*$t11 = __rv__*/;
					r1[3] = r0/*V_1.1[3] = $t11*/;
					r1[4] = " }"/*V_1.1[4] = " }"*/;
					r0 = r1.join('')/*V_0.1 = System.String::Concat(V_1.1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 12: System.Void System.Net.Tests.User::.ctor(System.NativeObject)
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
					r0 = __f__[3]["EmailAddress"]/*$t5 = json.get_Item("EmailAddress")*/;
					$[446].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*this.set_EmailAddress($t5)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __f__[3]["PasswordHash"]/*$t10 = json.get_Item("PasswordHash")*/;
					$[448].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0],[null,null,0,r0])/*this.set_PasswordHash($t10)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 13: System.Void System.Net.Tests.ProcessViewer::Start()
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
					r1 = {$:_[370],0:null}/*$t1 = new System.Void System.Text.StringBuilder::.ctor()()*/;
					$[349].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*$t1..ctor()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[347].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"<table cellspacing=2 cellpading=2><tr valign=top><td>"])/*$t1.Append("<table cellspacing=2 cellpading=2><tr valign=top><td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[453].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*this.BuildSIPTable($t1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[347].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"</td><td>"])/*$t1.Append("</td><td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[454].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*this.BuildThreadTable($t1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[347].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,"</td></tr></table>"])/*$t1.Append("</td></tr></table>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					r0 = new Date()/*$t8 = new System.Void System.NativeDate::.ctor()()*/;
					__rv__ = r0.$[0].call(r0,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = $t8.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					r0 = __rv__/*$t9 = __rv__*/;
					r0 = ("<br />Last updated: " + r0)/*$t10 = System.String::Concat("<br />Last updated: ", $t9)*/;
					$[347].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r0])/*$t1.Append($t10)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					$[452].call(this,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,r1])/*this.UpdateInnerHTML($t1)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 1
					$[66](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0,250])/*System.Threading.Thread::Sleep(250)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
// 14: System.Void System.Net.Tests.ProcessViewer::UpdateInnerHTML(System.Text.StringBuilder)
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
					r0 = document/*$t0 = System.Browser.Dom.DomManager::get_Document()*/;
					__rv__ = r0.getElementById("process-viewer-area")/*__rv__ = $t0.GetElementById("process-viewer-area")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					r0 = __rv__/*V_0.1 = __rv__*/;
					__rv__ = __f__[3].$[0].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1],[null,null,0])/*__rv__ = sb.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r0,r1]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					r1 = __rv__/*$t4 = __rv__*/;
					r0.innerHTML = r1/*V_0.1.set_InnerHtml($t4)*/;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 15: System.Void System.Net.Tests.ProcessViewer::BuildSIPTable(System.Text.StringBuilder)
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
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"SIP Table:<br />"])/*sb.Append("SIP Table:<br />")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"----------------------------------------<br />"])/*sb.Append("----------------------------------------<br />")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<table>"])/*sb.Append("<table>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<tr>"])/*sb.Append("<tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"PID"])/*sb.Append("PID")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Name"])/*sb.Append("Name")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</tr>"])/*sb.Append("</tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					__rv__ = $[175](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = XaeiOS.Process.SIP::GetSIPs()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					r2 = __rv__/*V_0.1 = __rv__*/
					r0 = 0/*V_1.1 = 0*/;
					__ep__ = 14;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					r1 = (r0 < r2.length)/*V_4.1 = V_1.3 LessThan (System.Int32)V_0.1.Length*/
					if(r1)
					{
						__ep__ = 17;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 15
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 15:
				{
					__ep__ = 16
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</table>"])/*sb.Append("</table>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					return
				}
				case 17:
				{
					__ep__ = 18
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<tr>"])/*sb.Append("<tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					__ep__ = 19
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 19:
				{
					__ep__ = 20
					__rv__ = $[161].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 20:
				{
					__ep__ = 21
					r1 = __rv__/*V_3.1 = __rv__*/;
					r1 = r1.toString()/*$t37 = V_3.1.ToString()*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t37)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 21:
				{
					__ep__ = 22
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 22:
				{
					__ep__ = 23
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 23:
				{
					__ep__ = 24
					__rv__ = $[162].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_Name()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 24:
				{
					__ep__ = 25
					r1 = __rv__/*$t43 = __rv__*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t43)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 25:
				{
					__ep__ = 26
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 26:
				{
					__ep__ = 27
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</tr>"])/*sb.Append("</tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 27:
				{
					r0 = (r0 + 1)/*V_1.2 = V_1.3 Add 1*/
					__ep__ = 14;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2)
// 16: System.Void System.Net.Tests.ProcessViewer::BuildThreadTable(System.Text.StringBuilder)
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
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Thread Table:<br />"])/*sb.Append("Thread Table:<br />")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 2:
				{
					__ep__ = 3
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"----------------------------------------<br />"])/*sb.Append("----------------------------------------<br />")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 3:
				{
					__ep__ = 4
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<table>"])/*sb.Append("<table>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 4:
				{
					__ep__ = 5
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<tr>"])/*sb.Append("<tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 5:
				{
					__ep__ = 6
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 6:
				{
					__ep__ = 7
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"ID"])/*sb.Append("ID")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 7:
				{
					__ep__ = 8
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 8:
				{
					__ep__ = 9
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 9:
				{
					__ep__ = 10
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Name"])/*sb.Append("Name")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 10:
				{
					__ep__ = 11
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 11:
				{
					__ep__ = 12
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 12:
				{
					__ep__ = 13
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"SIP"])/*sb.Append("SIP")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 13:
				{
					__ep__ = 14
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 14:
				{
					__ep__ = 15
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 15:
				{
					__ep__ = 16
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Blocked?"])/*sb.Append("Blocked?")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 16:
				{
					__ep__ = 17
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 17:
				{
					__ep__ = 18
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 18:
				{
					__ep__ = 19
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"Priority"])/*sb.Append("Priority")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 19:
				{
					__ep__ = 20
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 20:
				{
					__ep__ = 21
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</tr>"])/*sb.Append("</tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 21:
				{
					__ep__ = 22
					__rv__ = $[68](1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = System.Threading.Thread::GetThreads()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 22:
				{
					r2 = __rv__/*V_0.1 = __rv__*/
					r0 = 0/*V_1.1 = 0*/;
					__ep__ = 23;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 23:
				{
					r1 = (r0 < r2.length)/*V_5.1 = V_1.3 LessThan (System.Int32)V_0.1.Length*/
					if(r1)
					{
						__ep__ = 26;
						continue __ctrl__;

					}
					else
					{
						__ep__ = 24
						if(new Date() > __end__)
						{
							throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

						}

					}
				}
				case 24:
				{
					__ep__ = 25
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</table>"])/*sb.Append("</table>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 25:
				{
					return
				}
				case 26:
				{
					__ep__ = 27
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<tr>"])/*sb.Append("<tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 27:
				{
					__ep__ = 28
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 28:
				{
					__ep__ = 29
					__rv__ = $[45].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_ID()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 29:
				{
					__ep__ = 30
					r1 = __rv__/*V_3.1 = __rv__*/;
					r1 = r1.toString()/*$t55 = V_3.1.ToString()*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t55)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 30:
				{
					__ep__ = 31
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 31:
				{
					__ep__ = 32
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 32:
				{
					__ep__ = 33
					__rv__ = $[52].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_Name()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 33:
				{
					__ep__ = 34
					r1 = __rv__/*$t61 = __rv__*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t61)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 34:
				{
					__ep__ = 35
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 35:
				{
					__ep__ = 36
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 36:
				{
					__ep__ = 37
					__rv__ = $[46].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_SIP()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 37:
				{
					__ep__ = 38
					r1 = __rv__/*$t67 = __rv__*/;
					__rv__ = $[162].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t67.get_Name()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 38:
				{
					__ep__ = 39
					r1 = __rv__/*$t68 = __rv__*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t68)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 39:
				{
					__ep__ = 40
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 40:
				{
					__ep__ = 41
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 41:
				{
					__ep__ = 42
					__rv__ = $[48].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_Blocked()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 42:
				{
					__ep__ = 43
					r1 = __rv__/*V_4.1 = __rv__*/;
					__rv__ = r1.$[0].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_4.1.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 43:
				{
					__ep__ = 44
					r1 = __rv__/*$t75 = __rv__*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t75)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 44:
				{
					__ep__ = 45
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 45:
				{
					__ep__ = 46
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"<td>"])/*sb.Append("<td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 46:
				{
					__ep__ = 47
					__rv__ = $[47].call(r2[r0],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = V_0.1[V_1.3].get_Priority()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 47:
				{
					__ep__ = 48
					r1 = __rv__/*$t81 = __rv__*/;
					__rv__ = r1.$[0].call(r1,1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0])/*__rv__ = $t81.ToString()*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 48:
				{
					__ep__ = 49
					r1 = __rv__/*$t82 = __rv__*/;
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,r1])/*sb.Append($t82)*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 49:
				{
					__ep__ = 50
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</td>"])/*sb.Append("</td>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 50:
				{
					__ep__ = 51
					$[347].call(__f__[3],1,__end__,null,null,null,[__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2],[null,null,0,"</tr>"])/*sb.Append("</tr>")*/;
					if(new Date() > __end__)
					{
						throw [__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__,r1,r0,r2]/*[dynamic expression]*/;

					}
				}
				case 51:
				{
					r0 = (r0 + 1)/*V_1.2 = V_1.3 Add 1*/
					__ep__ = 23;
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
function(__ep__,__end__,__ecp__,__ex__,__rv__,__pco__,__f__)
// 17: System.Void System.Net.Tests.ProcessViewer::.ctor()
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
			e = $[316](e)/*e = XaeiOS.Kernel.Scheduler::ConvertToManagedException(e)*/;
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
null/* Metadata for: System.Object */,

// 2: System.NativeObject
{
	f: 0,
	d:
	{
		FullName:"System.NativeObject",
		Fields:
		[

		]
	},
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeObject */,

// 4: System.Exception
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
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.Exception */,

// 6: System.SystemException
{
	f: 0,
	d:
	{
		FullName:"System.SystemException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.SystemException */,

// 8: System.InvalidOperationException
{
	f: 0,
	d:
	{
		FullName:"System.InvalidOperationException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.InvalidOperationException */,

// 10: System.Attribute
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
null/* Metadata for: System.Attribute */,

// 12: System.Resources.ResourceManager
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
null/* Metadata for: System.Resources.ResourceManager */,

// 15: System.Runtime.CompilerServices.RuntimeHelpers
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.RuntimeHelpers",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::DataSegmentName */,
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::VTableFieldName */,
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::HashCodeFieldName */,
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::BaseVTableFieldName */,
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::InterfacesFieldName */,
null/* System.String System.Runtime.CompilerServices.RuntimeHelpers::FlagsFieldName */,
null/* System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::_hashCodeCounter */,
null/* Metadata for: System.Runtime.CompilerServices.RuntimeHelpers */,

// 24: System.Console
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
null/* Metadata for: System.Console */,

// 26: System.Threading.Thread
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
	0:$[65]/* System.String System.Threading.Thread::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Threading.Thread */,

// 28: System.Delegate
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
	3:$[75]/* System.Object System.Delegate::Invoke(System.Object[]) */,
	4:$[76]/* System.Object System.Delegate::InvokeNative(System.Object[]) */,
	5:$[77]/* System.Void System.Delegate::InternalCombine(System.Delegate) */
},
null/* Metadata for: System.Delegate */,

// 30: System.MulticastDelegate
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */
},
null/* Metadata for: System.MulticastDelegate */,

// 32: System.Threading.ThreadCallback
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[75]/* System.Void System.Threading.ThreadCallback::Invoke() */
},
null/* Metadata for: System.Threading.ThreadCallback */,

// 34: System.Threading.ThreadStart
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[75]/* System.Void System.Threading.ThreadStart::Invoke() */
},
null/* Metadata for: System.Threading.ThreadStart */,

// 36: System.Threading.ParametizedThreadStart
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[75]/* System.Void System.Threading.ParametizedThreadStart::Invoke(System.Object) */
},
null/* Metadata for: System.Threading.ParametizedThreadStart */,

// 38: System.Threading.ThreadPriority
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
null/* Metadata for: System.Threading.ThreadPriority */,

// 45: System.OverflowException
{
	f: 0,
	d:
	{
		FullName:"System.OverflowException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.OverflowException */,

// 47: System.Int32
{
	f: 0,
	d:
	{
		FullName:"System.Int32",
		Fields:
		[

		]
	},
	0:$[93]/* System.String System.Int32::ToString() */,
	1:$[94]/* System.Int32 System.Int32::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int32 System.Int32::MaxValue */,
null/* System.Int32 System.Int32::MinValue */,
null/* Metadata for: System.Int32 */,

// 51: System.Decimal
{
	f: 0,
	d:
	{
		FullName:"System.Decimal",
		Fields:
		[

		]
	},
	0:$[95]/* System.String System.Decimal::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Decimal */,

// 53: System.Collections.Generic.KeyValuePair`2
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
null/* Metadata for: System.Collections.Generic.KeyValuePair`2 */,

// 55: System.Collections.IEnumerable
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
null/* Metadata for: System.Collections.IEnumerable */,

// 57: System.Collections.Generic.IEnumerable`1
{
	f: 1,
	i:
	{
		55:// Interface map: System.Collections.IEnumerable
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
null/* Metadata for: System.Collections.Generic.IEnumerable`1 */,

// 59: System.Collections.Generic.ICollection`1
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
null/* Metadata for: System.Collections.Generic.ICollection`1 */,

// 61: System.Int64
{
	f: 0,
	d:
	{
		FullName:"System.Int64",
		Fields:
		[

		]
	},
	0:$[97]/* System.String System.Int64::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Int64 System.Int64::MaxValue */,
null/* System.Int64 System.Int64::MinValue */,
null/* Metadata for: System.Int64 */,

// 65: System.EventHandler
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[75]/* System.Void System.EventHandler::Invoke(System.Object,System.EventArgs) */
},
null/* Metadata for: System.EventHandler */,

// 67: System.IDisposable
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
null/* Metadata for: System.IDisposable */,

// 69: System.ICloneable
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
null/* Metadata for: System.ICloneable */,

// 71: System.UInt32
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
null/* Metadata for: System.UInt32 */,

// 75: System.Type
{
	f: 0,
	d:
	{
		FullName:"System.Type",
		Fields:
		[

		]
	},
	0:$[98]/* System.String System.Type::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:null/* System.String System.Type::get_Name() */,
	4:null/* System.String System.Type::get_Namespace() */
},
null/* Metadata for: System.Type */,

// 77: System.Boolean
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
null/* Metadata for: System.Boolean */,

// 81: System.Collections.IList
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
null/* Metadata for: System.Collections.IList */,

// 83: System.Collections.IEnumerator
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
null/* Metadata for: System.Collections.IEnumerator */,

// 85: System.Collections.Generic.IEnumerator`1
{
	f: 1,
	i:
	{
		83:// Interface map: System.Collections.IEnumerator
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
null/* Metadata for: System.Collections.Generic.IEnumerator`1 */,

// 87: System.Collections.Generic.IDictionary`2
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
null/* Metadata for: System.Collections.Generic.IDictionary`2 */,

// 89: System.Collections.Generic.Dictionary`2
{
	f: 0,
	i:
	{
		87:// Interface map: System.Collections.Generic.IDictionary`2
		{
			0:$[101]/* get_Count -> System.Int32 System.Collections.Generic.Dictionary`2::get_Count() */,
			1:$[102]/* get_Item -> V System.Collections.Generic.Dictionary`2::get_Item(K) */,
			2:$[103]/* set_Item -> System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V) */,
			3:$[104]/* get_Keys -> System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys() */,
			4:$[105]/* ContainsKey -> System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K) */,
			5:$[106]/* ContainsValue -> System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V) */,
			6:$[107]/* Remove -> System.Boolean System.Collections.Generic.Dictionary`2::Remove(K) */,
			7:$[108]/* Clear -> System.Void System.Collections.Generic.Dictionary`2::Clear() */
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
	3:$[101]/* System.Int32 System.Collections.Generic.Dictionary`2::get_Count() */,
	4:$[102]/* V System.Collections.Generic.Dictionary`2::get_Item(K) */,
	5:$[103]/* System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V) */,
	6:$[104]/* System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys() */,
	7:$[105]/* System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K) */,
	8:$[106]/* System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V) */,
	9:$[107]/* System.Boolean System.Collections.Generic.Dictionary`2::Remove(K) */,
	10:$[108]/* System.Void System.Collections.Generic.Dictionary`2::Clear() */
},
null/* Metadata for: System.Collections.Generic.Dictionary`2 */,

// 91: System.var
{
	f: 0,
	d:
	{
		FullName:"System.var",
		Fields:
		[

		]
	},
	0:$[112]/* System.String System.var::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.var */,

// 93: System.UInt64
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
null/* Metadata for: System.UInt64 */,

// 97: System.Reflection.MethodInfo
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
null/* Metadata for: System.Reflection.MethodInfo */,

// 99: System.WeakReference
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
null/* Metadata for: System.WeakReference */,

// 101: System.Threading.Lock
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
null/* Metadata for: System.Threading.Lock */,

// 103: System.NullReferenceException
{
	f: 0,
	d:
	{
		FullName:"System.NullReferenceException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.NullReferenceException */,

// 105: System.EventArgs
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
null/* Metadata for: System.EventArgs */,

// 108: System.Runtime.InteropServices.LayoutKind
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
null/* Metadata for: System.Runtime.InteropServices.LayoutKind */,

// 113: XaeiOS.Process.SIPState
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
null/* Metadata for: XaeiOS.Process.SIPState */,

// 119: System.Collections.Generic.IList`1
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
null/* Metadata for: System.Collections.Generic.IList`1 */,

// 121: System.Math
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
null/* Metadata for: System.Math */,

// 123: System.Runtime.CompilerServices.MethodImplOptions
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
null/* Metadata for: System.Runtime.CompilerServices.MethodImplOptions */,

// 132: System.ArgumentOutOfRangeException
{
	f: 0,
	d:
	{
		FullName:"System.ArgumentOutOfRangeException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.ArgumentOutOfRangeException */,

// 134: System.Threading.ThreadManager
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
null/* Metadata for: System.Threading.ThreadManager */,

// 137: System.NativeFunction
{
	f: 0,
	d:
	{
		FullName:"System.NativeFunction",
		Fields:
		[

		]
	},
	0:$[133]/* System.String System.NativeFunction::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeFunction */,

// 139: XaeiOS.Boot.BootManager
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
null/* Metadata for: XaeiOS.Boot.BootManager */,

// 144: System.Diagnostics.Logging
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
null/* Metadata for: System.Diagnostics.Logging */,

// 146: System.Global
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
null/* Metadata for: System.Global */,

// 148: System.Threading.Condition
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
null/* Metadata for: System.Threading.Condition */,

// 150: System.Threading.TimedCondition
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
null/* Metadata for: System.Threading.TimedCondition */,

// 152: System.Threading.ConditionTimedOutException
{
	f: 0,
	d:
	{
		FullName:"System.Threading.ConditionTimedOutException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.Threading.ConditionTimedOutException */,

// 154: System.NotSupportedException
{
	f: 0,
	d:
	{
		FullName:"System.NotSupportedException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.NotSupportedException */,

// 156: System.NotImplementedException
{
	f: 0,
	d:
	{
		FullName:"System.NotImplementedException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.NotImplementedException */,

// 158: System.Double
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
null/* Metadata for: System.Double */,

// 160: System.ThreadAbortException
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
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.ThreadAbortException */,

// 162: System.Runtime.CompilerServices.VTable
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.VTable",
		Fields:
		[

		]
	},
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Runtime.CompilerServices.VTable */,

// 164: System.Runtime.CompilerServices.VTableFlags
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.VTableFlags",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.Runtime.CompilerServices.VTableFlags System.Runtime.CompilerServices.VTableFlags::None */,
1/* System.Runtime.CompilerServices.VTableFlags System.Runtime.CompilerServices.VTableFlags::IsInterface */,
null/* Metadata for: System.Runtime.CompilerServices.VTableFlags */,

// 168: System.ArgumentException
{
	f: 0,
	d:
	{
		FullName:"System.ArgumentException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.ArgumentException */,

// 170: System.NativeNumber
{
	f: 0,
	d:
	{
		FullName:"System.NativeNumber",
		Fields:
		[

		]
	},
	0:$[157]/* System.String System.NativeNumber::ToString() */,
	1:$[156]/* System.Int32 System.NativeNumber::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeNumber */,

// 172: System.MulticastNotSupportedException
{
	f: 0,
	d:
	{
		FullName:"System.MulticastNotSupportedException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.MulticastNotSupportedException */,

// 174: System.InvalidCastException
{
	f: 0,
	d:
	{
		FullName:"System.InvalidCastException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.InvalidCastException */,

// 176: System.Runtime.InteropServices.ExposedCallbackDelegate
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void System.Runtime.InteropServices.ExposedCallbackDelegate::Invoke(System.Object) */
},
null/* Metadata for: System.Runtime.InteropServices.ExposedCallbackDelegate */,

// 178: XaeiOS.Process.SIP
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
	0:$[167]/* System.String XaeiOS.Process.SIP::ToString() */,
	1:$[166]/* System.Int32 XaeiOS.Process.SIP::GetHashCode() */,
	2:$[168]/* System.Boolean XaeiOS.Process.SIP::Equals(System.Object) */
},
null/* Metadata for: XaeiOS.Process.SIP */,

// 180: XaeiOS.Process.DoublyLinkedList`1
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
null/* Metadata for: XaeiOS.Process.DoublyLinkedList`1 */,

// 182: XaeiOS.Process.DoublyLinkedListItem`1
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
null/* Metadata for: XaeiOS.Process.DoublyLinkedListItem`1 */,

// 184: XaeiOS.Process.SIPManager
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
null/* Metadata for: XaeiOS.Process.SIPManager */,

// 188: XaeiOS.Process.ImageFormat.ObjectImage
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
null/* Metadata for: XaeiOS.Process.ImageFormat.ObjectImage */,

// 190: XaeiOS.Process.ImageFormat.AssemblyName
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
null/* Metadata for: XaeiOS.Process.ImageFormat.AssemblyName */,

// 192: System.ExecutionEngineException
{
	f: 0,
	d:
	{
		FullName:"System.ExecutionEngineException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.ExecutionEngineException */,

// 194: System.Collections.ICollection
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
null/* Metadata for: System.Collections.ICollection */,

// 196: System.Collections.Generic.List`1
{
	f: 0,
	i:
	{
		119:// Interface map: System.Collections.Generic.IList`1
		{
			0:$[200]/* get_Item -> T System.Collections.Generic.List`1::get_Item(System.Int32) */,
			1:$[201]/* set_Item -> System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
			2:$[204]/* Add -> System.Void System.Collections.Generic.List`1::Add(T) */,
			3:$[206]/* get_Count -> System.Int32 System.Collections.Generic.List`1::get_Count() */
		},
		57:// Interface map: System.Collections.Generic.IEnumerable`1
		{
			0:$[207]/* GetEnumerator -> System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */
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
	3:$[200]/* T System.Collections.Generic.List`1::get_Item(System.Int32) */,
	4:$[201]/* System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
	5:$[202]/* System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32) */,
	6:$[203]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object) */,
	7:$[204]/* System.Void System.Collections.Generic.List`1::Add(T) */,
	8:$[205]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object) */,
	9:$[206]/* System.Int32 System.Collections.Generic.List`1::get_Count() */,
	10:$[207]/* System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */,
	11:$[208]/* System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator() */
},
null/* Metadata for: System.Collections.Generic.List`1 */,

// 198: System.Collections.Generic.List`1/Enumerator
{
	f: 0,
	i:
	{
		85:// Interface map: System.Collections.Generic.IEnumerator`1
		{
			0:$[210]/* get_Current -> T System.Collections.Generic.List`1/Enumerator::get_Current() */
		},
		83:// Interface map: System.Collections.IEnumerator
		{
			1:$[212]/* MoveNext -> System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext() */,
			2:$[213]/* Reset -> System.Void System.Collections.Generic.List`1/Enumerator::Reset() */
		},
		67:// Interface map: System.IDisposable
		{
			0:$[214]/* Dispose -> System.Void System.Collections.Generic.List`1/Enumerator::Dispose() */
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
	3:$[210]/* T System.Collections.Generic.List`1/Enumerator::get_Current() */,
	4:$[211]/* System.Object System.Collections.Generic.List`1/Enumerator::System.Collections.IEnumerator.get_Current() */,
	5:$[212]/* System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext() */,
	6:$[213]/* System.Void System.Collections.Generic.List`1/Enumerator::Reset() */,
	7:$[214]/* System.Void System.Collections.Generic.List`1/Enumerator::Dispose() */
},
null/* Metadata for: System.Collections.Generic.List`1/Enumerator */,

// 200: System.Collections.ArrayList
{
	f: 0,
	i:
	{
		119:// Interface map: System.Collections.Generic.IList`1
		{
			0:$[200]/* get_Item -> T System.Collections.Generic.List`1::get_Item(System.Int32) */,
			1:$[201]/* set_Item -> System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
			2:$[204]/* Add -> System.Void System.Collections.Generic.List`1::Add(T) */,
			3:$[206]/* get_Count -> System.Int32 System.Collections.Generic.List`1::get_Count() */
		},
		57:// Interface map: System.Collections.Generic.IEnumerable`1
		{
			0:$[207]/* GetEnumerator -> System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */
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
	3:$[200]/* T System.Collections.Generic.List`1::get_Item(System.Int32) */,
	4:$[201]/* System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T) */,
	5:$[202]/* System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32) */,
	6:$[203]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object) */,
	7:$[204]/* System.Void System.Collections.Generic.List`1::Add(T) */,
	8:$[205]/* System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object) */,
	9:$[206]/* System.Int32 System.Collections.Generic.List`1::get_Count() */,
	10:$[207]/* System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator() */,
	11:$[208]/* System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator() */
},
null/* Metadata for: System.Collections.ArrayList */,

// 202: System.String
{
	f: 0,
	d:
	{
		FullName:"System.String",
		Fields:
		[

		]
	},
	0:$[222]/* System.String System.String::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.String::_empty */,
null/* Metadata for: System.String */,

// 205: System.SByte
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
null/* Metadata for: System.SByte */,

// 209: System.Byte
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
null/* Metadata for: System.Byte */,

// 213: XaeiOS.Process.DynamicLinker
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
null/* Metadata for: XaeiOS.Process.DynamicLinker */,

// 218: System.NativeError
{
	f: 0,
	d:
	{
		FullName:"System.NativeError",
		Fields:
		[

		]
	},
	0:$[235]/* System.String System.NativeError::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.NativeError */,

// 220: System.Diagnostics.ObjectDebugger
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
null/* Metadata for: System.Diagnostics.ObjectDebugger */,

// 227: System.Diagnostics.ObjectDebugger/IntRef
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
null/* Metadata for: System.Diagnostics.ObjectDebugger/IntRef */,

// 229: System.Collections.Queue
{
	f: 0,
	i:
	{
		194:// Interface map: System.Collections.ICollection
		{
			0:$[240]/* get_Count -> System.Int32 System.Collections.Queue::get_Count() */,
			1:$[241]/* get_IsSynchronized -> System.Boolean System.Collections.Queue::get_IsSynchronized() */,
			2:$[243]/* get_SyncRoot -> System.Object System.Collections.Queue::get_SyncRoot() */,
			3:$[248]/* CopyTo -> System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32) */
		},
		69:// Interface map: System.ICloneable
		{
			0:$[246]/* Clone -> System.Object System.Collections.Queue::Clone() */
		},
		55:// Interface map: System.Collections.IEnumerable
		{
			0:$[251]/* GetEnumerator -> System.Collections.IEnumerator System.Collections.Queue::GetEnumerator() */
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
	3:$[240]/* System.Int32 System.Collections.Queue::get_Count() */,
	4:$[241]/* System.Boolean System.Collections.Queue::get_IsSynchronized() */,
	5:$[243]/* System.Object System.Collections.Queue::get_SyncRoot() */,
	6:$[245]/* System.Void System.Collections.Queue::Clear() */,
	7:$[246]/* System.Object System.Collections.Queue::Clone() */,
	8:$[247]/* System.Boolean System.Collections.Queue::Contains(System.Object) */,
	9:$[248]/* System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32) */,
	10:$[249]/* System.Object System.Collections.Queue::Dequeue() */,
	11:$[250]/* System.Void System.Collections.Queue::Enqueue(System.Object) */,
	12:$[251]/* System.Collections.IEnumerator System.Collections.Queue::GetEnumerator() */,
	13:$[252]/* System.Object System.Collections.Queue::Peek() */,
	14:$[254]/* System.Object[] System.Collections.Queue::ToArray() */,
	15:$[255]/* System.Void System.Collections.Queue::TrimToSize() */
},
null/* Metadata for: System.Collections.Queue */,

// 231: System.Single
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
null/* Metadata for: System.Single */,

// 235: System.Int16
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
null/* Metadata for: System.Int16 */,

// 239: XaeiOS.TaskCallback
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void XaeiOS.TaskCallback::Invoke(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus) */
},
null/* Metadata for: XaeiOS.TaskCallback */,

// 241: XaeiOS.TaskFunction
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void XaeiOS.TaskFunction::Invoke() */
},
null/* Metadata for: XaeiOS.TaskFunction */,

// 243: XaeiOS.TaskPriority
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
null/* Metadata for: XaeiOS.TaskPriority */,

// 250: XaeiOS.TaskExitStatus
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
null/* Metadata for: XaeiOS.TaskExitStatus */,

// 256: XaeiOS.OSCorlib
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
null/* Metadata for: XaeiOS.OSCorlib */,

// 260: System.UInt16
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
null/* Metadata for: System.UInt16 */,

// 264: System.TypeCode
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
null/* Metadata for: System.TypeCode */,

// 284: System.Char
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
null/* Metadata for: System.Char */,

// 288: System.NativeDate
{
	f: 0,
	d:
	{
		FullName:"System.NativeDate",
		Fields:
		[

		]
	},
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeDate */,

// 290: System.Threading.Semaphore
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
null/* Metadata for: System.Threading.Semaphore */,

// 292: System.Threading.Semaphore/WaitingTask
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
null/* Metadata for: System.Threading.Semaphore/WaitingTask */,

// 294: System.VoidDelegate
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void System.VoidDelegate::Invoke() */
},
null/* Metadata for: System.VoidDelegate */,

// 296: System.NativeArray`1
{
	f: 0,
	d:
	{
		FullName:"System.NativeArray`1",
		Fields:
		[

		]
	},
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeArray`1 */,

// 298: System.NativeArray
{
	f: 0,
	d:
	{
		FullName:"System.NativeArray",
		Fields:
		[

		]
	},
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.NativeArray */,

// 300: System.Array
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
null/* Metadata for: System.Array */,

// 302: System.Runtime.CompilerServices.Class
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.Class",
		Fields:
		[
			"<Name>k__BackingField",
			"<Namespace>k__BackingField",
			"<DeclaringType>k__BackingField"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Runtime.CompilerServices.Class */,

// 304: System.Runtime.CompilerServices.XaeiOSObject
{
	f: 0,
	d:
	{
		FullName:"System.Runtime.CompilerServices.XaeiOSObject",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Runtime.CompilerServices.XaeiOSObject */,

// 306: System.Reflection.ReflectionHelpers
{
	f: 0,
	d:
	{
		FullName:"System.Reflection.ReflectionHelpers",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Collections.Generic.Dictionary`2<System.Runtime.CompilerServices.Class,System.Reflection.RuntimeType> System.Reflection.ReflectionHelpers::_runtimeTypeCache */,
null/* Metadata for: System.Reflection.ReflectionHelpers */,

// 309: System.Reflection.RuntimeType
{
	f: 0,
	d:
	{
		FullName:"System.Reflection.RuntimeType",
		Fields:
		[
			"_class"
		]
	},
	0:$[98]/* System.String System.Type::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[278]/* System.String System.Reflection.RuntimeType::get_Name() */,
	4:$[279]/* System.String System.Reflection.RuntimeType::get_Namespace() */
},
null/* Metadata for: System.Reflection.RuntimeType */,

// 311: XaeiOS.Boot.BootManager/<>c__DisplayClass1
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
null/* Metadata for: XaeiOS.Boot.BootManager/<>c__DisplayClass1 */,

// 313: XaeiOS.Process.SIP/<>c__DisplayClass1
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
null/* Metadata for: XaeiOS.Process.SIP/<>c__DisplayClass1 */,
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
null/* Metadata for: XaeiOS.Kernel.TaskPriorityQueue */,

// 4: XaeiOS.Kernel.Task
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
	0:$[298]/* System.String XaeiOS.Kernel.Task::ToString() */,
	1:$[297]/* System.Int32 XaeiOS.Kernel.Task::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.NativeObject XaeiOS.Kernel.Task::IdMap */,
null/* System.NativeObject XaeiOS.Kernel.Task::NameMap */,
null/* System.Int32 XaeiOS.Kernel.Task::_idCounter */,
null/* System.Int32 XaeiOS.Kernel.Task::_taskCount */,
null/* Metadata for: XaeiOS.Kernel.Task */,

// 10: XaeiOS.Kernel.TaskCallback
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void XaeiOS.Kernel.TaskCallback::Invoke(System.Int32,System.String,System.var,XaeiOS.Kernel.TaskExitStatus) */
},
null/* Metadata for: XaeiOS.Kernel.TaskCallback */,

// 12: XaeiOS.Kernel.TaskFunction
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void XaeiOS.Kernel.TaskFunction::Invoke() */
},
null/* Metadata for: XaeiOS.Kernel.TaskFunction */,

// 14: XaeiOS.Kernel.TaskExitStatus
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
null/* Metadata for: XaeiOS.Kernel.TaskExitStatus */,

// 20: XaeiOS.Kernel.TaskPriority
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
null/* Metadata for: XaeiOS.Kernel.TaskPriority */,

// 27: XaeiOS.Kernel.Frame
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
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: XaeiOS.Kernel.Frame */,

// 29: XaeiOS.Kernel.FrameFlags
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
null/* Metadata for: XaeiOS.Kernel.FrameFlags */,

// 33: XaeiOS.Kernel.Scheduler
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
null/* Metadata for: XaeiOS.Kernel.Scheduler */,

// 42: XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate
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
	3:$[86]/* System.Object System.MulticastDelegate::Invoke(System.Object[]) */,
	4:$[87]/* System.Object System.MulticastDelegate::InvokeNative(System.Object[]) */,
	5:$[88]/* System.Void System.MulticastDelegate::InternalCombine(System.Delegate) */,
	6:$[76]/* System.Void XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate::Invoke(XaeiOS.Kernel.Task) */
},
null/* Metadata for: XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate */,

// 44: XaeiOS.Kernel.TaskStatus
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
null/* Metadata for: XaeiOS.Kernel.TaskStatus */,

// 48: XaeiOS.Kernel.Continuation
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
	0:$[5]/* System.String System.NativeObject::ToString() */,
	1:$[6]/* System.Int32 System.NativeObject::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::_rootContinuation */,
null/* Metadata for: XaeiOS.Kernel.Continuation */,

// 51: XaeiOS.SystemCalls
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
null/* Metadata for: XaeiOS.SystemCalls */,
// 0: System.Text.RegularExpressions.Regex
{
	f: 0,
	d:
	{
		FullName:"System.Text.RegularExpressions.Regex",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Text.RegularExpressions.Regex */,

// 2: System.Text.StringBuilder
{
	f: 0,
	d:
	{
		FullName:"System.Text.StringBuilder",
		Fields:
		[
			"_internalArray"
		]
	},
	0:$[348]/* System.String System.Text.StringBuilder::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Text.StringBuilder */,
// 0: System.Browser.XmlHttpRequest.XmlHttpRequest
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.XmlHttpRequest",
		Fields:
		[
			"_xhr"
		]
	},
	0:$[365]/* System.String System.Browser.XmlHttpRequest.XmlHttpRequest::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Browser.XmlHttpRequest.XmlHttpRequest */,

// 2: System.Browser.Css.IStyle
{
	f: 1,
	d:
	{
		FullName:"System.Browser.Css.IStyle",
		Fields:
		[

		]
	},
	0:null/* System.String System.Browser.Css.IStyle::get_Left() */,
	1:null/* System.Void System.Browser.Css.IStyle::set_Left(System.String) */,
	2:null/* System.String System.Browser.Css.IStyle::get_Top() */,
	3:null/* System.Void System.Browser.Css.IStyle::set_Top(System.String) */,
	4:null/* System.String System.Browser.Css.IStyle::get_Width() */,
	5:null/* System.Void System.Browser.Css.IStyle::set_Width(System.String) */,
	6:null/* System.String System.Browser.Css.IStyle::get_Height() */,
	7:null/* System.Void System.Browser.Css.IStyle::set_Height(System.String) */,
	8:null/* System.String System.Browser.Css.IStyle::get_BackgroundColor() */,
	9:null/* System.Void System.Browser.Css.IStyle::set_BackgroundColor(System.String) */,
	10:null/* System.String System.Browser.Css.IStyle::get_Position() */,
	11:null/* System.Void System.Browser.Css.IStyle::set_Position(System.String) */,
	12:null/* System.String System.Browser.Css.IStyle::get_Opacity() */,
	13:null/* System.Void System.Browser.Css.IStyle::set_Opacity(System.String) */
},
null/* Metadata for: System.Browser.Css.IStyle */,

// 4: System.Browser.Dom.IDomNode
{
	f: 1,
	d:
	{
		FullName:"System.Browser.Dom.IDomNode",
		Fields:
		[

		]
	},
	0:null/* System.Browser.Dom.IDomNode System.Browser.Dom.IDomNode::get_ParentNode() */,
	1:null/* System.Void System.Browser.Dom.IDomNode::RemoveChild(System.Browser.Dom.IDomNode) */,
	2:null/* System.Void System.Browser.Dom.IDomNode::AppendChild(System.Browser.Dom.IDomNode) */
},
null/* Metadata for: System.Browser.Dom.IDomNode */,

// 6: System.Browser.XmlHttpRequest.IXmlHttpRequest
{
	f: 1,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.IXmlHttpRequest",
		Fields:
		[

		]
	},
	0:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Abort() */,
	1:null/* System.String System.Browser.XmlHttpRequest.IXmlHttpRequest::GetAllResponseHeaders() */,
	2:null/* System.String System.Browser.XmlHttpRequest.IXmlHttpRequest::GetResponseHeader(System.String) */,
	3:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Open(System.String,System.String) */,
	4:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Open(System.String,System.String,System.Boolean) */,
	5:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String) */,
	6:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String,System.String) */,
	7:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::Send(System.String) */,
	8:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::SetRequestHeader(System.String,System.String) */,
	9:null/* System.String System.Browser.XmlHttpRequest.IXmlHttpRequest::get_ResponseText() */,
	10:null/* System.Int32 System.Browser.XmlHttpRequest.IXmlHttpRequest::get_Status() */,
	11:null/* System.String System.Browser.XmlHttpRequest.IXmlHttpRequest::get_StatusText() */,
	12:null/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.IXmlHttpRequest::get_ReadyState() */,
	13:null/* System.NativeFunction System.Browser.XmlHttpRequest.IXmlHttpRequest::get_OnReadyStateChange() */,
	14:null/* System.Void System.Browser.XmlHttpRequest.IXmlHttpRequest::set_OnReadyStateChange(System.NativeFunction) */
},
null/* Metadata for: System.Browser.XmlHttpRequest.IXmlHttpRequest */,

// 8: System.Browser.XmlHttpRequest.ReadyState
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.ReadyState",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.ReadyState::Uninitialized */,
1/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.ReadyState::Open */,
2/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.ReadyState::Sent */,
3/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.ReadyState::Receiving */,
4/* System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.ReadyState::Loaded */,
null/* Metadata for: System.Browser.XmlHttpRequest.ReadyState */,

// 15: System.Browser.Dom.IDomDocument
{
	f: 1,
	d:
	{
		FullName:"System.Browser.Dom.IDomDocument",
		Fields:
		[

		]
	},
	0:null/* System.Browser.Dom.IDomElement System.Browser.Dom.IDomDocument::CreateElement(System.String) */,
	1:null/* System.Browser.Dom.IDomElement System.Browser.Dom.IDomDocument::GetElementById(System.String) */
},
null/* Metadata for: System.Browser.Dom.IDomDocument */,

// 17: System.Browser.Dom.IDomElement
{
	f: 1,
	d:
	{
		FullName:"System.Browser.Dom.IDomElement",
		Fields:
		[

		]
	},
	0:null/* System.Browser.Css.IStyle System.Browser.Dom.IDomElement::get_Style() */,
	1:null/* System.String System.Browser.Dom.IDomElement::get_InnerHtml() */,
	2:null/* System.Void System.Browser.Dom.IDomElement::set_InnerHtml(System.String) */,
	3:null/* System.String System.Browser.Dom.IDomElement::GetAttribute(System.String) */,
	4:null/* System.String System.Browser.Dom.IDomElement::SetAttribute(System.String,System.String) */
},
null/* Metadata for: System.Browser.Dom.IDomElement */,

// 19: System.Browser.Dom.DomManager
{
	f: 0,
	d:
	{
		FullName:"System.Browser.Dom.DomManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Browser.Dom.DomManager */,

// 21: System.Browser.Dom.DomManager/DomElementResourceWrapper
{
	f: 0,
	i:
	{
		67:// Interface map: System.IDisposable
		{
			0:$[369]/* Dispose -> System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::Dispose() */
		}
	},
	d:
	{
		FullName:"System.Browser.Dom.DomManager/DomElementResourceWrapper",
		Fields:
		[
			"DomElement"
		]
	},
	0:$[370]/* System.String System.Browser.Dom.DomManager/DomElementResourceWrapper::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[369]/* System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::Dispose() */
},
null/* Metadata for: System.Browser.Dom.DomManager/DomElementResourceWrapper */,

// 23: System.Browser.XmlHttpRequest.XmlHttpRequestManager
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.XmlHttpRequestManager",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Browser.XmlHttpRequest.XmlHttpRequestManager */,

// 25: System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler",
		Fields:
		[
			"Condition",
			"XmlHttpRequest"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler */,

// 27: System.Browser.XmlHttpRequest.RequestMethod
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.RequestMethod",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.Browser.XmlHttpRequest.RequestMethod System.Browser.XmlHttpRequest.RequestMethod::Get */,
1/* System.Browser.XmlHttpRequest.RequestMethod System.Browser.XmlHttpRequest.RequestMethod::Post */,
null/* Metadata for: System.Browser.XmlHttpRequest.RequestMethod */,

// 31: System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException
{
	f: 0,
	d:
	{
		FullName:"System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException",
		Fields:
		[
			"_xmlHttpRequest"
		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException */,
// 0: System.Net.Socket
{
	f: 0,
	d:
	{
		FullName:"System.Net.Socket",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Net.Socket */,

// 2: System.Net.JsonRpc.JsonRpcClient
{
	f: 0,
	d:
	{
		FullName:"System.Net.JsonRpc.JsonRpcClient",
		Fields:
		[
			"<ServerUrl>k__BackingField",
			"<Username>k__BackingField",
			"<Password>k__BackingField"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.String System.Net.JsonRpc.JsonRpcClient::RpcMethodRequestHeader */,
null/* Metadata for: System.Net.JsonRpc.JsonRpcClient */,

// 5: System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler
{
	f: 0,
	d:
	{
		FullName:"System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler",
		Fields:
		[
			"XmlHttpRequest",
			"Condition"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler */,

// 7: System.Net.Comet.CometConnectionState
{
	f: 0,
	d:
	{
		FullName:"System.Net.Comet.CometConnectionState",
		Fields:
		[
			"value__"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
0/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Ready */,
1/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Reestablishing */,
2/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Established */,
3/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Closing */,
4/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Failed */,
5/* System.Net.Comet.CometConnectionState System.Net.Comet.CometConnectionState::Closed */,
null/* Metadata for: System.Net.Comet.CometConnectionState */,

// 15: System.Net.Comet.CometMessageEventArgs
{
	f: 0,
	d:
	{
		FullName:"System.Net.Comet.CometMessageEventArgs",
		Fields:
		[
			"<Message>k__BackingField"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.EventArgs System.EventArgs::Empty */,
null/* Metadata for: System.Net.Comet.CometMessageEventArgs */,

// 18: System.Net.JsonRpc.JsonRpcException
{
	f: 0,
	d:
	{
		FullName:"System.Net.JsonRpc.JsonRpcException",
		Fields:
		[
			"<Client>k__BackingField",
			"<Method>k__BackingField",
			"<Arguments>k__BackingField"
		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.Net.JsonRpc.JsonRpcException */,

// 20: System.Net.JsonRpc.JsonRpcCallTimedOutException
{
	f: 0,
	d:
	{
		FullName:"System.Net.JsonRpc.JsonRpcCallTimedOutException",
		Fields:
		[

		]
	},
	0:$[15]/* System.String System.Exception::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */,
	3:$[9]/* System.Exception System.Exception::GetBaseException() */,
	4:$[10]/* System.String System.Exception::get_HelpLink() */,
	5:$[11]/* System.Void System.Exception::set_HelpLink(System.String) */,
	6:$[12]/* System.String System.Exception::get_Source() */,
	7:$[13]/* System.Void System.Exception::set_Source(System.String) */,
	8:$[14]/* System.String System.Exception::get_StackTrace() */
},
null/* Metadata for: System.Net.JsonRpc.JsonRpcCallTimedOutException */,

// 22: System.Net.Comet.CometConnection
{
	f: 0,
	d:
	{
		FullName:"System.Net.Comet.CometConnection",
		Fields:
		[
			"_socket",
			"Established",
			"Restablishing",
			"Reestablished",
			"Failed",
			"MessageReceived",
			"<ServerUrl>k__BackingField",
			"<State>k__BackingField",
			"<Username>k__BackingField",
			"<Password>k__BackingField"
		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Net.Comet.CometConnection */,
// 0: System.Net.Tests.Program
{
	f: 0,
	d:
	{
		FullName:"System.Net.Tests.Program",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* System.Threading.ThreadStart System.Net.Tests.Program::CS$<>9__CachedAnonymousMethodDelegate2 */,
null/* System.Threading.ThreadCallback System.Net.Tests.Program::CS$<>9__CachedAnonymousMethodDelegate3 */,
null/* Metadata for: System.Net.Tests.Program */,

// 4: System.Net.Tests.User
{
	f: 0,
	d:
	{
		FullName:"System.Net.Tests.User",
		Fields:
		[
			"<EmailAddress>k__BackingField",
			"<PasswordHash>k__BackingField"
		]
	},
	0:$[449]/* System.String System.Net.Tests.User::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Net.Tests.User */,

// 6: System.Net.Tests.ProcessViewer
{
	f: 0,
	d:
	{
		FullName:"System.Net.Tests.ProcessViewer",
		Fields:
		[

		]
	},
	0:$[0]/* System.String System.Object::ToString() */,
	1:$[1]/* System.Int32 System.Object::GetHashCode() */,
	2:$[2]/* System.Boolean System.Object::Equals(System.Object) */
},
null/* Metadata for: System.Net.Tests.ProcessViewer */,
null/* System.String System.Net.JsonRpc.JsonRpcClient::RpcMethodRequestHeader */];var __module__={Initialize:function(){_[2].b = _[0];// System.NativeObject extends System.Object
Object.prototype.$ = _[2];
_[4].b = _[0];// System.Exception extends System.Object
_[6].b = _[4];// System.SystemException extends System.Exception
_[8].b = _[6];// System.InvalidOperationException extends System.SystemException
_[10].b = _[0];// System.Attribute extends System.Object
_[12].b = _[0];// System.Resources.ResourceManager extends System.Object
_[15].b = _[0];// System.Runtime.CompilerServices.RuntimeHelpers extends System.Object
_[24].b = _[0];// System.Console extends System.Object
_[26].b = _[0];// System.Threading.Thread extends System.Object
_[28].b = _[0];// System.Delegate extends System.Object
_[30].b = _[28];// System.MulticastDelegate extends System.Delegate
_[32].b = _[30];// System.Threading.ThreadCallback extends System.MulticastDelegate
_[34].b = _[30];// System.Threading.ThreadStart extends System.MulticastDelegate
_[36].b = _[30];// System.Threading.ParametizedThreadStart extends System.MulticastDelegate
_[45].b = _[4];// System.OverflowException extends System.Exception
_[53].b = _[0];// System.Collections.Generic.KeyValuePair`2 extends System.Object
_[65].b = _[30];// System.EventHandler extends System.MulticastDelegate
_[75].b = _[0];// System.Type extends System.Object
_[89].b = _[0];// System.Collections.Generic.Dictionary`2 extends System.Object
_[91].b = _[0];// System.var extends System.Object
_[97].b = _[0];// System.Reflection.MethodInfo extends System.Object
_[99].b = _[0];// System.WeakReference extends System.Object
_[101].b = _[0];// System.Threading.Lock extends System.Object
_[103].b = _[6];// System.NullReferenceException extends System.SystemException
_[105].b = _[0];// System.EventArgs extends System.Object
_[121].b = _[0];// System.Math extends System.Object
_[132].b = _[4];// System.ArgumentOutOfRangeException extends System.Exception
_[134].b = _[0];// System.Threading.ThreadManager extends System.Object
_[137].b = _[2];// System.NativeFunction extends System.NativeObject
Function.prototype.$ = _[137];
_[139].b = _[0];// XaeiOS.Boot.BootManager extends System.Object
_[144].b = _[0];// System.Diagnostics.Logging extends System.Object
_[146].b = _[0];// System.Global extends System.Object
_[148].b = _[0];// System.Threading.Condition extends System.Object
_[150].b = _[148];// System.Threading.TimedCondition extends System.Threading.Condition
_[152].b = _[4];// System.Threading.ConditionTimedOutException extends System.Exception
_[154].b = _[6];// System.NotSupportedException extends System.SystemException
_[156].b = _[4];// System.NotImplementedException extends System.Exception
_[160].b = _[4];// System.ThreadAbortException extends System.Exception
_[162].b = _[2];// System.Runtime.CompilerServices.VTable extends System.NativeObject
_[168].b = _[4];// System.ArgumentException extends System.Exception
Number.prototype.$ = _[170];
_[172].b = _[4];// System.MulticastNotSupportedException extends System.Exception
_[174].b = _[4];// System.InvalidCastException extends System.Exception
_[176].b = _[30];// System.Runtime.InteropServices.ExposedCallbackDelegate extends System.MulticastDelegate
_[178].b = _[0];// XaeiOS.Process.SIP extends System.Object
_[180].b = _[0];// XaeiOS.Process.DoublyLinkedList`1 extends System.Object
_[182].b = _[0];// XaeiOS.Process.DoublyLinkedListItem`1 extends System.Object
_[184].b = _[0];// XaeiOS.Process.SIPManager extends System.Object
_[188].b = _[0];// XaeiOS.Process.ImageFormat.ObjectImage extends System.Object
_[190].b = _[0];// XaeiOS.Process.ImageFormat.AssemblyName extends System.Object
_[192].b = _[6];// System.ExecutionEngineException extends System.SystemException
_[196].b = _[0];// System.Collections.Generic.List`1 extends System.Object
_[198].b = _[0];// System.Collections.Generic.List`1/Enumerator extends System.Object
_[200].b = _[196];// System.Collections.ArrayList extends System.Collections.Generic.List`1<System.Object>
_[202].b = _[0];// System.String extends System.Object
String.prototype.$ = _[202];
_[213].b = _[0];// XaeiOS.Process.DynamicLinker extends System.Object
_[218].b = _[4];// System.NativeError extends System.Exception
_[220].b = _[0];// System.Diagnostics.ObjectDebugger extends System.Object
_[227].b = _[0];// System.Diagnostics.ObjectDebugger/IntRef extends System.Object
_[229].b = _[0];// System.Collections.Queue extends System.Object
_[239].b = _[30];// XaeiOS.TaskCallback extends System.MulticastDelegate
_[241].b = _[30];// XaeiOS.TaskFunction extends System.MulticastDelegate
_[256].b = _[0];// XaeiOS.OSCorlib extends System.Object
_[288].b = _[2];// System.NativeDate extends System.NativeObject
Date.prototype.$ = _[288];
_[290].b = _[0];// System.Threading.Semaphore extends System.Object
_[292].b = _[0];// System.Threading.Semaphore/WaitingTask extends System.Object
_[294].b = _[30];// System.VoidDelegate extends System.MulticastDelegate
_[296].b = _[2];// System.NativeArray`1 extends System.NativeObject
_[298].b = _[296];// System.NativeArray extends System.NativeArray`1<System.var>
_[300].b = _[0];// System.Array extends System.Object
_[302].b = _[0];// System.Runtime.CompilerServices.Class extends System.Object
_[304].b = _[0];// System.Runtime.CompilerServices.XaeiOSObject extends System.Object
_[306].b = _[0];// System.Reflection.ReflectionHelpers extends System.Object
_[309].b = _[75];// System.Reflection.RuntimeType extends System.Type
_[311].b = _[0];// XaeiOS.Boot.BootManager/<>c__DisplayClass1 extends System.Object
_[313].b = _[0];// XaeiOS.Process.SIP/<>c__DisplayClass1 extends System.Object
$[0].d = { Name: "System.String System.Object::ToString()" };
$[1].d = { Name: "System.Int32 System.Object::GetHashCode()" };
$[2].d = { Name: "System.Boolean System.Object::Equals(System.Object)" };
$[3].d = { Name: "System.Type System.Object::GetType()" };
$[4].d = { Name: "System.String[] System.NativeObject::GetKeys()" };
$[5].d = { Name: "System.String System.NativeObject::ToString()" };
$[6].d = { Name: "System.Int32 System.NativeObject::GetHashCode()" };
$[7].d = { Name: "System.String System.Exception::get_Message()" };
$[8].d = { Name: "System.Exception System.Exception::get_InnerException()" };
$[9].d = { Name: "System.Exception System.Exception::GetBaseException()" };
$[10].d = { Name: "System.String System.Exception::get_HelpLink()" };
$[11].d = { Name: "System.Void System.Exception::set_HelpLink(System.String)" };
$[12].d = { Name: "System.String System.Exception::get_Source()" };
$[13].d = { Name: "System.Void System.Exception::set_Source(System.String)" };
$[14].d = { Name: "System.String System.Exception::get_StackTrace()" };
$[15].d = { Name: "System.String System.Exception::ToString()" };
$[16].d = { Name: "System.Void System.Exception::.ctor()" };
$[17].d = { Name: "System.Void System.Exception::.ctor(System.String)" };
$[18].d = { Name: "System.Void System.Exception::.ctor(System.String,System.Exception)" };
$[19].d = { Name: "System.Void System.SystemException::.ctor()" };
$[20].d = { Name: "System.Void System.SystemException::.ctor(System.String)" };
$[21].d = { Name: "System.Void System.SystemException::.ctor(System.String,System.Exception)" };
$[22].d = { Name: "System.Void System.InvalidOperationException::.ctor(System.String)" };
$[23].d = { Name: "System.Void System.Attribute::.ctor()" };
$[24].d = { Name: "System.Void System.Resources.ResourceManager::Initialize()" };
$[25].d = { Name: "System.Void System.Resources.ResourceManager::RegisterSIP(XaeiOS.Process.SIP)" };
$[26].d = { Name: "System.Void System.Resources.ResourceManager::CleanupAndUnregisterSIP(XaeiOS.Process.SIP)" };
$[27].d = { Name: "System.Void System.Resources.ResourceManager::RegisterResource(System.IDisposable)" };
$[28].d = { Name: "System.Void System.Resources.ResourceManager::FreeResource(System.IDisposable)" };
$[29].d = { Name: "System.Void System.Runtime.CompilerServices.RuntimeHelpers::Initialize()" };
$[30].d = { Name: "System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::GenerateHashCode()" };
$[31].d = { Name: "System.Int32 System.Runtime.CompilerServices.RuntimeHelpers::NativeGetHashCode(System.Object)" };
$[32].d = { Name: "System.Object System.Runtime.CompilerServices.RuntimeHelpers::Cast(System.Runtime.CompilerServices.XaeiOSObject,System.Runtime.CompilerServices.VTable,System.Boolean)" };
$[33].d = { Name: "System.Object System.Runtime.CompilerServices.RuntimeHelpers::DeprecatedCast(System.NativeObject,System.NativeObject,System.Boolean)" };
$[34].d = { Name: "System.Object System.Runtime.CompilerServices.RuntimeHelpers::TryCast(System.Runtime.CompilerServices.XaeiOSObject,System.Runtime.CompilerServices.VTable)" };
$[35].d = { Name: "System.Boolean System.Runtime.CompilerServices.RuntimeHelpers::ImplementsInterface(System.NativeObject,System.NativeObject)" };
$[36].d = { Name: "System.Boolean System.Runtime.CompilerServices.RuntimeHelpers::TypesEqual(System.Object,System.Object)" };
$[37].d = { Name: "System.Runtime.CompilerServices.Class System.Runtime.CompilerServices.RuntimeHelpers::CreateClass(System.String,System.String)" };
$[38].d = { Name: "System.String System.Console::ReadLine()" };
$[39].d = { Name: "System.Int32 System.Console::Read()" };
$[40].d = { Name: "System.String System.Console::get_Title()" };
$[41].d = { Name: "System.Void System.Console::set_Title(System.String)" };
$[42].d = { Name: "System.Void System.Console::Write(System.String)" };
$[43].d = { Name: "System.Void System.Console::WriteLine(System.String)" };
$[44].d = { Name: "System.Void System.Console::WriteLine()" };
$[45].d = { Name: "System.Int32 System.Threading.Thread::get_ID()" };
$[46].d = { Name: "XaeiOS.Process.SIP System.Threading.Thread::get_SIP()" };
$[47].d = { Name: "System.Threading.ThreadPriority System.Threading.Thread::get_Priority()" };
$[48].d = { Name: "System.Boolean System.Threading.Thread::get_Blocked()" };
$[49].d = { Name: "System.Exception System.Threading.Thread::get_UnhandledException()" };
$[50].d = { Name: "System.Threading.ThreadCallback System.Threading.Thread::get_Callback()" };
$[51].d = { Name: "System.Void System.Threading.Thread::set_Callback(System.Threading.ThreadCallback)" };
$[52].d = { Name: "System.String System.Threading.Thread::get_Name()" };
$[53].d = { Name: "System.Void System.Threading.Thread::set_Name(System.String)" };
$[54].d = { Name: "System.Boolean System.Threading.Thread::get_IsBackground()" };
$[55].d = { Name: "System.Void System.Threading.Thread::set_IsBackground(System.Boolean)" };
$[56].d = { Name: "System.Void System.Threading.Thread::Start()" };
$[57].d = { Name: "System.Void System.Threading.Thread::Start(System.Object)" };
$[58].d = { Name: "System.Void System.Threading.Thread::Abort()" };
$[59].d = { Name: "System.Void System.Threading.Thread::Abort(System.Object)" };
$[60].d = { Name: "System.Void System.Threading.Thread::ParametizedTaskFunction()" };
$[61].d = { Name: "System.Void System.Threading.Thread::InternalCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)" };
$[62].d = { Name: "System.Void System.Threading.Thread::InternalSleep(System.Int32)" };
$[63].d = { Name: "System.Void System.Threading.Thread::InternalSleep()" };
$[64].d = { Name: "System.Void System.Threading.Thread::WakeUp()" };
$[65].d = { Name: "System.String System.Threading.Thread::ToString()" };
$[66].d = { Name: "System.Void System.Threading.Thread::Sleep(System.Int32)" };
$[67].d = { Name: "System.Void System.Threading.Thread::Sleep()" };
$[68].d = { Name: "System.Threading.Thread[] System.Threading.Thread::GetThreads()" };
$[69].d = { Name: "System.Void System.Threading.Thread::ExecuteAsync(System.Threading.ThreadStart)" };
$[70].d = { Name: "System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart)" };
$[71].d = { Name: "System.Void System.Threading.Thread::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority)" };
$[72].d = { Name: "System.Void System.Threading.Thread::.ctor(System.Threading.ParametizedThreadStart,System.Threading.ThreadPriority)" };
$[73].d = { Name: "System.Object System.Delegate::get_Target()" };
$[74].d = { Name: "System.NativeFunction System.Delegate::get_Function()" };
$[75].d = { Name: "System.Object System.Delegate::Invoke(System.Object[])" };
$[76].d = { Name: "System.Object System.Delegate::InvokeNative(System.Object[])" };
$[77].d = { Name: "System.Void System.Delegate::InternalCombine(System.Delegate)" };
$[78].d = { Name: "System.Void System.Delegate::InternalCreate(System.Delegate,System.Object,System.NativeFunction)" };
$[79].d = { Name: "System.Delegate System.Delegate::BrokenCombine(System.Delegate,System.Delegate)" };
$[80].d = { Name: "System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)" };
$[81].d = { Name: "System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)" };
$[82].d = { Name: "System.Boolean System.Delegate::op_Equality(System.Delegate,System.Delegate)" };
$[83].d = { Name: "System.Boolean System.Delegate::op_Inequality(System.Delegate,System.Delegate)" };
$[84].d = { Name: "System.Void System.Delegate::.ctor()" };
$[85].d = { Name: "System.Void System.Delegate::.ctor(System.Object,System.NativeFunction)" };
$[86].d = { Name: "System.Object System.MulticastDelegate::Invoke(System.Object[])" };
$[87].d = { Name: "System.Object System.MulticastDelegate::InvokeNative(System.Object[])" };
$[88].d = { Name: "System.Void System.MulticastDelegate::InternalCombine(System.Delegate)" };
$[89].d = { Name: "System.MulticastDelegate System.MulticastDelegate::Clone()" };
$[90].d = { Name: "System.MulticastDelegate System.MulticastDelegate::InternalCreate(System.Object,System.NativeFunction)" };
$[91].d = { Name: "System.Void System.MulticastDelegate::.ctor(System.Object,System.NativeFunction)" };
$[92].d = { Name: "System.Void System.OverflowException::.ctor()" };
$[93].d = { Name: "System.String System.Int32::ToString()" };
$[94].d = { Name: "System.Int32 System.Int32::GetHashCode()" };
$[95].d = { Name: "System.String System.Decimal::ToString()" };
$[96].d = { Name: "System.Void System.Collections.Generic.KeyValuePair`2::.ctor(K,V)" };
$[97].d = { Name: "System.String System.Int64::ToString()" };
$[98].d = { Name: "System.String System.Type::ToString()" };
$[99].d = { Name: "System.Void System.Type::.ctor()" };
$[100].d = { Name: "System.Void System.Boolean::.cctor()" };
$[101].d = { Name: "System.Int32 System.Collections.Generic.Dictionary`2::get_Count()" };
$[102].d = { Name: "V System.Collections.Generic.Dictionary`2::get_Item(K)" };
$[103].d = { Name: "System.Void System.Collections.Generic.Dictionary`2::set_Item(K,V)" };
$[104].d = { Name: "System.Collections.Generic.ICollection`1<K> System.Collections.Generic.Dictionary`2::get_Keys()" };
$[105].d = { Name: "System.Boolean System.Collections.Generic.Dictionary`2::ContainsKey(K)" };
$[106].d = { Name: "System.Boolean System.Collections.Generic.Dictionary`2::ContainsValue(V)" };
$[107].d = { Name: "System.Boolean System.Collections.Generic.Dictionary`2::Remove(K)" };
$[108].d = { Name: "System.Void System.Collections.Generic.Dictionary`2::Clear()" };
$[109].d = { Name: "V[] System.Collections.Generic.Dictionary`2::GetValues()" };
$[110].d = { Name: "System.Void System.Collections.Generic.Dictionary`2::.ctor()" };
$[111].d = { Name: "System.Void System.Collections.Generic.Dictionary`2::.ctor(System.Collections.Generic.Dictionary`2<K,V>)" };
$[112].d = { Name: "System.String System.var::ToString()" };
$[113].d = { Name: "System.Void System.var::.ctor()" };
$[114].d = { Name: "System.Void System.Reflection.MethodInfo::.ctor()" };
$[115].d = { Name: "System.Boolean System.WeakReference::get_IsAlive()" };
$[116].d = { Name: "System.Object System.WeakReference::get_Target()" };
$[117].d = { Name: "System.Void System.WeakReference::.ctor(System.Object)" };
$[118].d = { Name: "System.Void System.Threading.Lock::Acquire()" };
$[119].d = { Name: "System.Boolean System.Threading.Lock::TryAcquire()" };
$[120].d = { Name: "System.Void System.Threading.Lock::Release()" };
$[121].d = { Name: "System.Void System.Threading.Lock::.ctor()" };
$[122].d = { Name: "System.Void System.NullReferenceException::.ctor()" };
$[123].d = { Name: "System.Void System.NullReferenceException::.ctor(System.String)" };
$[124].d = { Name: "System.Void System.NullReferenceException::.ctor(System.String,System.Exception)" };
$[125].d = { Name: "System.Void System.EventArgs::.ctor()" };
$[126].d = { Name: "System.Void System.EventArgs::.cctor()" };
$[127].d = { Name: "System.Void System.ArgumentOutOfRangeException::.ctor(System.String)" };
$[128].d = { Name: "System.Threading.Thread System.Threading.ThreadManager::get_CurrentThread()" };
$[129].d = { Name: "System.Void System.Threading.ThreadManager::RegisterThread(System.Threading.Thread)" };
$[130].d = { Name: "System.Void System.Threading.ThreadManager::UnregisterThread(System.Threading.Thread)" };
$[131].d = { Name: "System.Void System.Threading.ThreadManager::Initialize()" };
$[132].d = { Name: "System.Threading.Thread[] System.Threading.ThreadManager::GetThreads()" };
$[133].d = { Name: "System.String System.NativeFunction::ToString()" };
$[134].d = { Name: "System.NativeFunction System.NativeFunction::Bind(System.var)" };
$[135].d = { Name: "System.NativeFunction System.NativeFunction::op_Explicit(System.Delegate)" };
$[136].d = { Name: "System.Void XaeiOS.Boot.BootManager::Boot(System.VoidDelegate)" };
$[137].d = { Name: "System.Void XaeiOS.Boot.BootManager::BootCallback(System.Int32,System.String,System.var,XaeiOS.TaskExitStatus)" };
$[138].d = { Name: "System.Void XaeiOS.Boot.BootManager::CreateInitProcess()" };
$[139].d = { Name: "System.Void System.Threading.Condition::Signal()" };
$[140].d = { Name: "System.Void System.Threading.Condition::Await()" };
$[141].d = { Name: "System.Void System.Threading.Condition::.ctor(System.Threading.Lock)" };
$[142].d = { Name: "System.Void System.Threading.TimedCondition::Await(System.Int32)" };
$[143].d = { Name: "System.Void System.Threading.TimedCondition::Unblock()" };
$[144].d = { Name: "System.Void System.Threading.TimedCondition::.ctor(System.Threading.Lock)" };
$[145].d = { Name: "System.Void System.Threading.ConditionTimedOutException::.ctor()" };
$[146].d = { Name: "System.Void System.NotSupportedException::.ctor()" };
$[147].d = { Name: "System.Void System.NotSupportedException::.ctor(System.String)" };
$[148].d = { Name: "System.Void System.NotSupportedException::.ctor(System.String,System.Exception)" };
$[149].d = { Name: "System.Void System.NotImplementedException::.ctor()" };
$[150].d = { Name: "System.Void System.NotImplementedException::.ctor(System.String)" };
$[151].d = { Name: "System.Object System.ThreadAbortException::get_ExceptionState()" };
$[152].d = { Name: "System.Void System.ThreadAbortException::.ctor(System.Object)" };
$[153].d = { Name: "System.Void System.ThreadAbortException::.ctor()" };
$[154].d = { Name: "System.Void System.Runtime.CompilerServices.VTable::.ctor()" };
$[155].d = { Name: "System.Void System.ArgumentException::.ctor(System.String)" };
$[156].d = { Name: "System.Int32 System.NativeNumber::GetHashCode()" };
$[157].d = { Name: "System.String System.NativeNumber::ToString()" };
$[158].d = { Name: "System.Void System.MulticastNotSupportedException::.ctor(System.String)" };
$[159].d = { Name: "System.Void System.MulticastNotSupportedException::.ctor()" };
$[160].d = { Name: "System.Void System.InvalidCastException::.ctor()" };
$[161].d = { Name: "System.Int32 XaeiOS.Process.SIP::get_ID()" };
$[162].d = { Name: "System.String XaeiOS.Process.SIP::get_Name()" };
$[163].d = { Name: "System.Threading.ThreadCallback XaeiOS.Process.SIP::get_Callback()" };
$[164].d = { Name: "System.Void XaeiOS.Process.SIP::set_Callback(System.Threading.ThreadCallback)" };
$[165].d = { Name: "System.Void XaeiOS.Process.SIP::Start()" };
$[166].d = { Name: "System.Int32 XaeiOS.Process.SIP::GetHashCode()" };
$[167].d = { Name: "System.String XaeiOS.Process.SIP::ToString()" };
$[168].d = { Name: "System.Boolean XaeiOS.Process.SIP::Equals(System.Object)" };
$[169].d = { Name: "System.Void XaeiOS.Process.SIP::InitializeThread(System.Threading.Thread)" };
$[170].d = { Name: "System.Void XaeiOS.Process.SIP::ThreadExited(System.Threading.Thread)" };
$[171].d = { Name: "System.Void XaeiOS.Process.SIP::ChildExited(XaeiOS.Process.SIP)" };
$[172].d = { Name: "System.Void XaeiOS.Process.SIP::TryExit()" };
$[173].d = { Name: "System.Void XaeiOS.Process.SIP::Exit()" };
$[174].d = { Name: "XaeiOS.Process.SIP XaeiOS.Process.SIP::get_CurrentSIP()" };
$[175].d = { Name: "XaeiOS.Process.SIP[] XaeiOS.Process.SIP::GetSIPs()" };
$[176].d = { Name: "System.Void XaeiOS.Process.SIP::.ctor(System.Threading.ThreadStart,System.Threading.ThreadPriority,System.String)" };
$[177].d = { Name: "System.Void XaeiOS.Process.SIP::.ctor(System.String)" };
$[178].d = { Name: "T XaeiOS.Process.DoublyLinkedList`1::get_Head()" };
$[179].d = { Name: "System.Int32 XaeiOS.Process.DoublyLinkedList`1::get_Count()" };
$[180].d = { Name: "System.Void XaeiOS.Process.DoublyLinkedList`1::Add(T)" };
$[181].d = { Name: "System.Void XaeiOS.Process.DoublyLinkedList`1::Remove(T)" };
$[182].d = { Name: "System.Void XaeiOS.Process.DoublyLinkedList`1::.ctor()" };
$[183].d = { Name: "System.Void XaeiOS.Process.DoublyLinkedListItem`1::.ctor()" };
$[184].d = { Name: "System.Void XaeiOS.Process.SIPManager::Initialize()" };
$[185].d = { Name: "System.Void XaeiOS.Process.SIPManager::RegisterSIP(XaeiOS.Process.SIP)" };
$[186].d = { Name: "System.Void XaeiOS.Process.SIPManager::UnregisterSIP(XaeiOS.Process.SIP)" };
$[187].d = { Name: "XaeiOS.Process.SIP[] XaeiOS.Process.SIPManager::GetSIPs()" };
$[188].d = { Name: "System.Int32 XaeiOS.Process.SIPManager::GetPID()" };
$[189].d = { Name: "System.NativeObject XaeiOS.Process.ImageFormat.ObjectImage::GetMetadata()" };
$[190].d = { Name: "System.NativeArray XaeiOS.Process.ImageFormat.ObjectImage::GetFixups()" };
$[191].d = { Name: "System.Void XaeiOS.Process.ImageFormat.ObjectImage::.ctor()" };
$[192].d = { Name: "System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Name()" };
$[193].d = { Name: "System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Name(System.String)" };
$[194].d = { Name: "System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Version()" };
$[195].d = { Name: "System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Version(System.String)" };
$[196].d = { Name: "System.String XaeiOS.Process.ImageFormat.AssemblyName::get_Culture()" };
$[197].d = { Name: "System.Void XaeiOS.Process.ImageFormat.AssemblyName::set_Culture(System.String)" };
$[198].d = { Name: "System.Void XaeiOS.Process.ImageFormat.AssemblyName::.ctor()" };
$[199].d = { Name: "System.Void System.ExecutionEngineException::.ctor(System.String)" };
$[200].d = { Name: "T System.Collections.Generic.List`1::get_Item(System.Int32)" };
$[201].d = { Name: "System.Void System.Collections.Generic.List`1::set_Item(System.Int32,T)" };
$[202].d = { Name: "System.Object System.Collections.Generic.List`1::System.Collections.IList.get_Item(System.Int32)" };
$[203].d = { Name: "System.Void System.Collections.Generic.List`1::System.Collections.IList.set_Item(System.Int32,System.Object)" };
$[204].d = { Name: "System.Void System.Collections.Generic.List`1::Add(T)" };
$[205].d = { Name: "System.Void System.Collections.Generic.List`1::System.Collections.IList.Add(System.Object)" };
$[206].d = { Name: "System.Int32 System.Collections.Generic.List`1::get_Count()" };
$[207].d = { Name: "System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1::GetEnumerator()" };
$[208].d = { Name: "System.Collections.IEnumerator System.Collections.Generic.List`1::System.Collections.IEnumerable.GetEnumerator()" };
$[209].d = { Name: "System.Void System.Collections.Generic.List`1::.ctor()" };
$[210].d = { Name: "T System.Collections.Generic.List`1/Enumerator::get_Current()" };
$[211].d = { Name: "System.Object System.Collections.Generic.List`1/Enumerator::System.Collections.IEnumerator.get_Current()" };
$[212].d = { Name: "System.Boolean System.Collections.Generic.List`1/Enumerator::MoveNext()" };
$[213].d = { Name: "System.Void System.Collections.Generic.List`1/Enumerator::Reset()" };
$[214].d = { Name: "System.Void System.Collections.Generic.List`1/Enumerator::Dispose()" };
$[215].d = { Name: "System.Void System.Collections.Generic.List`1/Enumerator::.ctor(System.Collections.Generic.List`1<T>)" };
$[216].d = { Name: "System.Void System.Collections.ArrayList::.ctor()" };
$[217].d = { Name: "System.String System.String::get_Empty()" };
$[218].d = { Name: "System.Void System.String::Initialize()" };
$[219].d = { Name: "System.String[] System.String::Split(System.Char[])" };
$[220].d = { Name: "System.Boolean System.String::StartsWith(System.String)" };
$[221].d = { Name: "System.Boolean System.String::EndsWith(System.String)" };
$[222].d = { Name: "System.String System.String::ToString()" };
$[223].d = { Name: "System.Boolean System.String::Contains(System.String)" };
$[224].d = { Name: "System.String System.String::Concat(System.Object,System.Object)" };
$[225].d = { Name: "System.String System.String::Concat(System.Object,System.Object,System.Object)" };
$[226].d = { Name: "System.String System.String::Concat(System.Object,System.Object,System.Object,System.Object)" };
$[227].d = { Name: "System.String System.String::Concat(System.Object[])" };
$[228].d = { Name: "System.Int32 System.String::Compare(System.String,System.String)" };
$[229].d = { Name: "System.Void System.String::.ctor()" };
$[230].d = { Name: "System.Void XaeiOS.Process.DynamicLinker::Initialize()" };
$[231].d = { Name: "XaeiOS.Process.ImageFormat.AssemblyName XaeiOS.Process.DynamicLinker::LoadObjectImage(System.String)" };
$[232].d = { Name: "System.Void XaeiOS.Process.DynamicLinker::SetEntryPointObjectImage(XaeiOS.Process.ImageFormat.AssemblyName)" };
$[233].d = { Name: "System.Void XaeiOS.Process.DynamicLinker::Link()" };
$[234].d = { Name: "System.Void XaeiOS.Process.DynamicLinker::.ctor()" };
$[235].d = { Name: "System.String System.NativeError::ToString()" };
$[236].d = { Name: "System.NativeObject System.Diagnostics.ObjectDebugger::GetSystemObjectVTable()" };
$[237].d = { Name: "System.NativeObject System.Diagnostics.ObjectDebugger::DebugObject(System.Object)" };
$[238].d = { Name: "System.NativeObject System.Diagnostics.ObjectDebugger::BuildDebuggableObject(System.NativeObject,System.NativeObject,System.Diagnostics.ObjectDebugger/IntRef)" };
$[239].d = { Name: "System.Void System.Diagnostics.ObjectDebugger/IntRef::.ctor()" };
$[240].d = { Name: "System.Int32 System.Collections.Queue::get_Count()" };
$[241].d = { Name: "System.Boolean System.Collections.Queue::get_IsSynchronized()" };
$[242].d = { Name: "System.Void System.Collections.Queue::set_IsSynchronized(System.Boolean)" };
$[243].d = { Name: "System.Object System.Collections.Queue::get_SyncRoot()" };
$[244].d = { Name: "System.Void System.Collections.Queue::set_SyncRoot(System.Object)" };
$[245].d = { Name: "System.Void System.Collections.Queue::Clear()" };
$[246].d = { Name: "System.Object System.Collections.Queue::Clone()" };
$[247].d = { Name: "System.Boolean System.Collections.Queue::Contains(System.Object)" };
$[248].d = { Name: "System.Void System.Collections.Queue::CopyTo(System.Array,System.Int32)" };
$[249].d = { Name: "System.Object System.Collections.Queue::Dequeue()" };
$[250].d = { Name: "System.Void System.Collections.Queue::Enqueue(System.Object)" };
$[251].d = { Name: "System.Collections.IEnumerator System.Collections.Queue::GetEnumerator()" };
$[252].d = { Name: "System.Object System.Collections.Queue::Peek()" };
$[253].d = { Name: "System.Collections.Queue System.Collections.Queue::Synchronized(System.Collections.Queue)" };
$[254].d = { Name: "System.Object[] System.Collections.Queue::ToArray()" };
$[255].d = { Name: "System.Void System.Collections.Queue::TrimToSize()" };
$[256].d = { Name: "System.Void System.Collections.Queue::.ctor()" };
$[257].d = { Name: "System.Void System.Collections.Queue::.ctor(System.Collections.ICollection)" };
$[258].d = { Name: "System.Void XaeiOS.OSCorlib::Initialize()" };
$[259].d = { Name: "System.Void System.Threading.Semaphore::Acquire()" };
$[260].d = { Name: "System.Void System.Threading.Semaphore::Acquire(System.Int32)" };
$[261].d = { Name: "System.Void System.Threading.Semaphore::Release()" };
$[262].d = { Name: "System.Void System.Threading.Semaphore::Release(System.Int32)" };
$[263].d = { Name: "System.Void System.Threading.Semaphore::.ctor(System.Int32)" };
$[264].d = { Name: "System.Void System.Threading.Semaphore/WaitingTask::.ctor(System.Int32,System.Int32)" };
$[265].d = { Name: "System.Void System.NativeArray`1::RemoveAt(System.Int32)" };
$[266].d = { Name: "System.Void System.Array::.ctor()" };
$[267].d = { Name: "System.String System.Runtime.CompilerServices.Class::get_Name()" };
$[268].d = { Name: "System.Void System.Runtime.CompilerServices.Class::set_Name(System.String)" };
$[269].d = { Name: "System.String System.Runtime.CompilerServices.Class::get_Namespace()" };
$[270].d = { Name: "System.Void System.Runtime.CompilerServices.Class::set_Namespace(System.String)" };
$[271].d = { Name: "System.Runtime.CompilerServices.Class System.Runtime.CompilerServices.Class::get_DeclaringType()" };
$[272].d = { Name: "System.Void System.Runtime.CompilerServices.Class::set_DeclaringType(System.Runtime.CompilerServices.Class)" };
$[273].d = { Name: "System.Void System.Runtime.CompilerServices.Class::.ctor()" };
$[274].d = { Name: "System.Void System.Runtime.CompilerServices.XaeiOSObject::.ctor()" };
$[275].d = { Name: "System.Void System.Reflection.ReflectionHelpers::Initialize()" };
$[276].d = { Name: "System.Reflection.RuntimeType System.Reflection.ReflectionHelpers::GetType(System.Object)" };
$[277].d = { Name: "System.Reflection.RuntimeType System.Reflection.ReflectionHelpers::BrokenGetType(System.Object)" };
$[278].d = { Name: "System.String System.Reflection.RuntimeType::get_Name()" };
$[279].d = { Name: "System.String System.Reflection.RuntimeType::get_Namespace()" };
$[280].d = { Name: "System.Void System.Reflection.RuntimeType::.ctor(System.Runtime.CompilerServices.Class)" };
$[281].d = { Name: "System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::<CreateInitProcess>b__0()" };
$[282].d = { Name: "System.Void XaeiOS.Boot.BootManager/<>c__DisplayClass1::.ctor()" };
$[283].d = { Name: "System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::<InitializeThread>b__0()" };
$[284].d = { Name: "System.Void XaeiOS.Process.SIP/<>c__DisplayClass1::.ctor()" };
t0 = $[37]("System","Object")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Object")*/;
_[0].c = t0;
t1 = $[37]("System","NativeObject")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeObject")*/;
_[2].c = t1;
t2 = $[37]("System","Exception")/*t2 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Exception")*/;
_[4].c = t2;
t3 = $[37]("System","SystemException")/*t3 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "SystemException")*/;
_[6].c = t3;
t4 = $[37]("System","InvalidOperationException")/*t4 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "InvalidOperationException")*/;
_[8].c = t4;
t5 = $[37]("System","Attribute")/*t5 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Attribute")*/;
_[10].c = t5;
t6 = $[37]("System.Resources","ResourceManager")/*t6 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Resources", "ResourceManager")*/;
_[12].c = t6;
t7 = $[37]("System.Runtime.CompilerServices","RuntimeHelpers")/*t7 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "RuntimeHelpers")*/;
_[15].c = t7;
t8 = $[37]("System","Console")/*t8 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Console")*/;
_[24].c = t8;
t9 = $[37]("System.Threading","Thread")/*t9 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "Thread")*/;
_[26].c = t9;
t10 = $[37]("System","Delegate")/*t10 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Delegate")*/;
_[28].c = t10;
t11 = $[37]("System","MulticastDelegate")/*t11 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "MulticastDelegate")*/;
_[30].c = t11;
t12 = $[37]("System.Threading","ThreadCallback")/*t12 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ThreadCallback")*/;
_[32].c = t12;
t13 = $[37]("System.Threading","ThreadStart")/*t13 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ThreadStart")*/;
_[34].c = t13;
t14 = $[37]("System.Threading","ParametizedThreadStart")/*t14 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ParametizedThreadStart")*/;
_[36].c = t14;
t15 = $[37]("System.Threading","ThreadPriority")/*t15 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ThreadPriority")*/;
_[38].c = t15;
t16 = $[37]("System","OverflowException")/*t16 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "OverflowException")*/;
_[45].c = t16;
t17 = $[37]("System","Int32")/*t17 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Int32")*/;
_[47].c = t17;
t18 = $[37]("System","Decimal")/*t18 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Decimal")*/;
_[51].c = t18;
t19 = $[37]("System.Collections.Generic","KeyValuePair`2")/*t19 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "KeyValuePair`2")*/;
_[53].c = t19;
t20 = $[37]("System.Collections","IEnumerable")/*t20 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "IEnumerable")*/;
_[55].c = t20;
t21 = $[37]("System.Collections.Generic","IEnumerable`1")/*t21 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "IEnumerable`1")*/;
_[57].c = t21;
t22 = $[37]("System.Collections.Generic","ICollection`1")/*t22 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "ICollection`1")*/;
_[59].c = t22;
t23 = $[37]("System","Int64")/*t23 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Int64")*/;
_[61].c = t23;
t24 = $[37]("System","EventHandler")/*t24 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "EventHandler")*/;
_[65].c = t24;
t25 = $[37]("System","IDisposable")/*t25 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "IDisposable")*/;
_[67].c = t25;
t26 = $[37]("System","ICloneable")/*t26 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "ICloneable")*/;
_[69].c = t26;
t27 = $[37]("System","UInt32")/*t27 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "UInt32")*/;
_[71].c = t27;
t28 = $[37]("System","Type")/*t28 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Type")*/;
_[75].c = t28;
t29 = $[37]("System","Boolean")/*t29 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Boolean")*/;
_[77].c = t29;
t30 = $[37]("System.Collections","IList")/*t30 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "IList")*/;
_[81].c = t30;
t31 = $[37]("System.Collections","IEnumerator")/*t31 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "IEnumerator")*/;
_[83].c = t31;
t32 = $[37]("System.Collections.Generic","IEnumerator`1")/*t32 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "IEnumerator`1")*/;
_[85].c = t32;
t33 = $[37]("System.Collections.Generic","IDictionary`2")/*t33 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "IDictionary`2")*/;
_[87].c = t33;
t34 = $[37]("System.Collections.Generic","Dictionary`2")/*t34 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "Dictionary`2")*/;
_[89].c = t34;
t35 = $[37]("System","var")/*t35 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "var")*/;
_[91].c = t35;
t36 = $[37]("System","UInt64")/*t36 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "UInt64")*/;
_[93].c = t36;
t37 = $[37]("System.Reflection","MethodInfo")/*t37 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Reflection", "MethodInfo")*/;
_[97].c = t37;
t38 = $[37]("System","WeakReference")/*t38 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "WeakReference")*/;
_[99].c = t38;
t39 = $[37]("System.Threading","Lock")/*t39 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "Lock")*/;
_[101].c = t39;
t40 = $[37]("System","NullReferenceException")/*t40 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NullReferenceException")*/;
_[103].c = t40;
t41 = $[37]("System","EventArgs")/*t41 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "EventArgs")*/;
_[105].c = t41;
t42 = $[37]("System.Runtime.InteropServices","LayoutKind")/*t42 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.InteropServices", "LayoutKind")*/;
_[108].c = t42;
t43 = $[37]("XaeiOS.Process","SIPState")/*t43 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "SIPState")*/;
_[113].c = t43;
t44 = $[37]("System.Collections.Generic","IList`1")/*t44 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "IList`1")*/;
_[119].c = t44;
t45 = $[37]("System","Math")/*t45 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Math")*/;
_[121].c = t45;
t46 = $[37]("System.Runtime.CompilerServices","MethodImplOptions")/*t46 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "MethodImplOptions")*/;
_[123].c = t46;
t47 = $[37]("System","ArgumentOutOfRangeException")/*t47 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "ArgumentOutOfRangeException")*/;
_[132].c = t47;
t48 = $[37]("System.Threading","ThreadManager")/*t48 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ThreadManager")*/;
_[134].c = t48;
t49 = $[37]("System","NativeFunction")/*t49 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeFunction")*/;
_[137].c = t49;
t50 = $[37]("XaeiOS.Boot","BootManager")/*t50 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Boot", "BootManager")*/;
_[139].c = t50;
t51 = $[37]("System.Diagnostics","Logging")/*t51 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Diagnostics", "Logging")*/;
_[144].c = t51;
t52 = $[37]("System","Global")/*t52 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Global")*/;
_[146].c = t52;
t53 = $[37]("System.Threading","Condition")/*t53 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "Condition")*/;
_[148].c = t53;
t54 = $[37]("System.Threading","TimedCondition")/*t54 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "TimedCondition")*/;
_[150].c = t54;
t55 = $[37]("System.Threading","ConditionTimedOutException")/*t55 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "ConditionTimedOutException")*/;
_[152].c = t55;
t56 = $[37]("System","NotSupportedException")/*t56 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NotSupportedException")*/;
_[154].c = t56;
t57 = $[37]("System","NotImplementedException")/*t57 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NotImplementedException")*/;
_[156].c = t57;
t58 = $[37]("System","Double")/*t58 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Double")*/;
_[158].c = t58;
t59 = $[37]("System","ThreadAbortException")/*t59 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "ThreadAbortException")*/;
_[160].c = t59;
t60 = $[37]("System.Runtime.CompilerServices","VTable")/*t60 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "VTable")*/;
_[162].c = t60;
t61 = $[37]("System.Runtime.CompilerServices","VTableFlags")/*t61 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "VTableFlags")*/;
_[164].c = t61;
t62 = $[37]("System","ArgumentException")/*t62 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "ArgumentException")*/;
_[168].c = t62;
t63 = $[37]("System","NativeNumber")/*t63 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeNumber")*/;
_[170].c = t63;
t64 = $[37]("System","MulticastNotSupportedException")/*t64 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "MulticastNotSupportedException")*/;
_[172].c = t64;
t65 = $[37]("System","InvalidCastException")/*t65 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "InvalidCastException")*/;
_[174].c = t65;
t66 = $[37]("System.Runtime.InteropServices","ExposedCallbackDelegate")/*t66 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.InteropServices", "ExposedCallbackDelegate")*/;
_[176].c = t66;
t67 = $[37]("XaeiOS.Process","SIP")/*t67 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "SIP")*/;
_[178].c = t67;
t68 = $[37]("XaeiOS.Process","DoublyLinkedList`1")/*t68 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "DoublyLinkedList`1")*/;
_[180].c = t68;
t69 = $[37]("XaeiOS.Process","DoublyLinkedListItem`1")/*t69 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "DoublyLinkedListItem`1")*/;
_[182].c = t69;
t70 = $[37]("XaeiOS.Process","SIPManager")/*t70 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "SIPManager")*/;
_[184].c = t70;
t71 = $[37]("XaeiOS.Process.ImageFormat","ObjectImage")/*t71 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process.ImageFormat", "ObjectImage")*/;
_[188].c = t71;
t72 = $[37]("XaeiOS.Process.ImageFormat","AssemblyName")/*t72 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process.ImageFormat", "AssemblyName")*/;
_[190].c = t72;
t73 = $[37]("System","ExecutionEngineException")/*t73 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "ExecutionEngineException")*/;
_[192].c = t73;
t74 = $[37]("System.Collections","ICollection")/*t74 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "ICollection")*/;
_[194].c = t74;
t75 = $[37]("System.Collections.Generic","List`1")/*t75 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections.Generic", "List`1")*/;
_[196].c = t75;
t76 = $[37]("","Enumerator")/*t76 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "Enumerator")*/;
_[198].c = t76;
t77 = $[37]("System.Collections","ArrayList")/*t77 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "ArrayList")*/;
_[200].c = t77;
t78 = $[37]("System","String")/*t78 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "String")*/;
_[202].c = t78;
t79 = $[37]("System","SByte")/*t79 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "SByte")*/;
_[205].c = t79;
t80 = $[37]("System","Byte")/*t80 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Byte")*/;
_[209].c = t80;
t81 = $[37]("XaeiOS.Process","DynamicLinker")/*t81 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Process", "DynamicLinker")*/;
_[213].c = t81;
t82 = $[37]("System","NativeError")/*t82 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeError")*/;
_[218].c = t82;
t83 = $[37]("System.Diagnostics","ObjectDebugger")/*t83 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Diagnostics", "ObjectDebugger")*/;
_[220].c = t83;
t84 = $[37]("","IntRef")/*t84 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "IntRef")*/;
_[227].c = t84;
t85 = $[37]("System.Collections","Queue")/*t85 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Collections", "Queue")*/;
_[229].c = t85;
t86 = $[37]("System","Single")/*t86 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Single")*/;
_[231].c = t86;
t87 = $[37]("System","Int16")/*t87 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Int16")*/;
_[235].c = t87;
t88 = $[37]("XaeiOS","TaskCallback")/*t88 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "TaskCallback")*/;
_[239].c = t88;
t89 = $[37]("XaeiOS","TaskFunction")/*t89 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "TaskFunction")*/;
_[241].c = t89;
t90 = $[37]("XaeiOS","TaskPriority")/*t90 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "TaskPriority")*/;
_[243].c = t90;
t91 = $[37]("XaeiOS","TaskExitStatus")/*t91 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "TaskExitStatus")*/;
_[250].c = t91;
t92 = $[37]("XaeiOS","OSCorlib")/*t92 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "OSCorlib")*/;
_[256].c = t92;
t93 = $[37]("System","UInt16")/*t93 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "UInt16")*/;
_[260].c = t93;
t94 = $[37]("System","TypeCode")/*t94 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "TypeCode")*/;
_[264].c = t94;
t95 = $[37]("System","Char")/*t95 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Char")*/;
_[284].c = t95;
t96 = $[37]("System","NativeDate")/*t96 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeDate")*/;
_[288].c = t96;
t97 = $[37]("System.Threading","Semaphore")/*t97 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Threading", "Semaphore")*/;
_[290].c = t97;
t98 = $[37]("","WaitingTask")/*t98 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "WaitingTask")*/;
_[292].c = t98;
t99 = $[37]("System","VoidDelegate")/*t99 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "VoidDelegate")*/;
_[294].c = t99;
t100 = $[37]("System","NativeArray`1")/*t100 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeArray`1")*/;
_[296].c = t100;
t101 = $[37]("System","NativeArray")/*t101 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "NativeArray")*/;
_[298].c = t101;
t102 = $[37]("System","Array")/*t102 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System", "Array")*/;
_[300].c = t102;
t103 = $[37]("System.Runtime.CompilerServices","Class")/*t103 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "Class")*/;
_[302].c = t103;
t104 = $[37]("System.Runtime.CompilerServices","XaeiOSObject")/*t104 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Runtime.CompilerServices", "XaeiOSObject")*/;
_[304].c = t104;
t105 = $[37]("System.Reflection","ReflectionHelpers")/*t105 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Reflection", "ReflectionHelpers")*/;
_[306].c = t105;
t106 = $[37]("System.Reflection","RuntimeType")/*t106 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Reflection", "RuntimeType")*/;
_[309].c = t106;
t107 = $[37]("","<>c__DisplayClass1")/*t107 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "<>c__DisplayClass1")*/;
_[311].c = t107;
t108 = $[37]("","<>c__DisplayClass1")/*t108 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "<>c__DisplayClass1")*/;
_[313].c = t108;
_[315].b = _[0];// XaeiOS.Kernel.TaskPriorityQueue extends System.Object
_[319].b = _[2];// XaeiOS.Kernel.Task extends System.NativeObject
_[325].b = _[30];// XaeiOS.Kernel.TaskCallback extends System.MulticastDelegate
_[327].b = _[30];// XaeiOS.Kernel.TaskFunction extends System.MulticastDelegate
_[342].b = _[2];// XaeiOS.Kernel.Frame extends System.NativeObject
_[348].b = _[0];// XaeiOS.Kernel.Scheduler extends System.Object
_[357].b = _[30];// XaeiOS.Kernel.Scheduler/ScheduleTaskDelegate extends System.MulticastDelegate
_[363].b = _[298];// XaeiOS.Kernel.Continuation extends System.NativeArray
_[366].b = _[0];// XaeiOS.SystemCalls extends System.Object
$[285].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::Initialize()" };
$[286].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::Add(XaeiOS.Kernel.Task)" };
$[287].d = { Name: "XaeiOS.Kernel.Task XaeiOS.Kernel.TaskPriorityQueue::Remove()" };
$[288].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::TrickleDown(System.Int32,XaeiOS.Kernel.Task)" };
$[289].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::BubbleUp(System.NativeNumber,XaeiOS.Kernel.Task)" };
$[290].d = { Name: "System.Boolean XaeiOS.Kernel.TaskPriorityQueue::IsEmpty()" };
$[291].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::Cleanup()" };
$[292].d = { Name: "System.Void XaeiOS.Kernel.TaskPriorityQueue::Test()" };
$[293].d = { Name: "System.Int32 XaeiOS.Kernel.Task::get_TaskCount()" };
$[294].d = { Name: "XaeiOS.Kernel.Task XaeiOS.Kernel.Task::GetTaskById(System.Int32)" };
$[295].d = { Name: "System.Void XaeiOS.Kernel.Task::Initialize()" };
$[296].d = { Name: "System.String XaeiOS.Kernel.Task::get_Name()" };
$[297].d = { Name: "System.Int32 XaeiOS.Kernel.Task::GetHashCode()" };
$[298].d = { Name: "System.String XaeiOS.Kernel.Task::ToString()" };
$[299].d = { Name: "System.Void XaeiOS.Kernel.Task::RemoveTask(XaeiOS.Kernel.Task)" };
$[300].d = { Name: "System.Void XaeiOS.Kernel.Task::Cleanup()" };
$[301].d = { Name: "System.Void XaeiOS.Kernel.Task::Test()" };
$[302].d = { Name: "System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String,System.Int32)" };
$[303].d = { Name: "System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)" };
$[304].d = { Name: "System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority)" };
$[305].d = { Name: "System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback)" };
$[306].d = { Name: "System.Void XaeiOS.Kernel.Task::.ctor(System.Object,XaeiOS.Kernel.TaskFunction)" };
$[307].d = { Name: "System.Void XaeiOS.Kernel.Frame::.ctor(System.Object,System.NativeFunction)" };
$[308].d = { Name: "XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::get_KernelTask()" };
$[309].d = { Name: "XaeiOS.Kernel.Task XaeiOS.Kernel.Scheduler::get_CurrentTask()" };
$[310].d = { Name: "System.Boolean XaeiOS.Kernel.Scheduler::get_InCriticalSection()" };
$[311].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::EnterCriticalSection()" };
$[312].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::LeaveCriticalSection()" };
$[313].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::Initialize()" };
$[314].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::SetWindowStatus(XaeiOS.Kernel.Task)" };
$[315].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::CpuCycle()" };
$[316].d = { Name: "System.Exception XaeiOS.Kernel.Scheduler::ConvertToManagedException(System.var)" };
$[317].d = { Name: "System.Exception XaeiOS.Kernel.Scheduler::BuildManagedException(System.var)" };
$[318].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::CleanupTask(XaeiOS.Kernel.Task,System.var,XaeiOS.Kernel.TaskExitStatus)" };
$[319].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::StartCpu()" };
$[320].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::PauseCpu()" };
$[321].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::ResumeCpu()" };
$[322].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::Shutdown()" };
$[323].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::Cleanup()" };
$[324].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::Halt()" };
$[325].d = { Name: "System.Int32 XaeiOS.Kernel.Scheduler::DynamicPriority(XaeiOS.Kernel.TaskPriority)" };
$[326].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::ScheduleTask(XaeiOS.Kernel.Task)" };
$[327].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::ScheduleTaskChecked(XaeiOS.Kernel.Task)" };
$[328].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::BlockTask(XaeiOS.Kernel.Task)" };
$[329].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::UnblockTask(XaeiOS.Kernel.Task)" };
$[330].d = { Name: "System.Void XaeiOS.Kernel.Scheduler::KillTask(XaeiOS.Kernel.Task)" };
$[331].d = { Name: "XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::get_RootContinuation()" };
$[332].d = { Name: "System.Void XaeiOS.Kernel.Continuation::Initialize()" };
$[333].d = { Name: "XaeiOS.Kernel.Continuation XaeiOS.Kernel.Continuation::Create(System.Object,System.NativeFunction)" };
$[334].d = { Name: "System.Void XaeiOS.Kernel.Continuation::.ctor()" };
$[335].d = { Name: "XaeiOS.Kernel.Task XaeiOS.SystemCalls::GetTask(System.Int32)" };
$[336].d = { Name: "System.Void XaeiOS.SystemCalls::InitializeKernel()" };
$[337].d = { Name: "System.Void XaeiOS.SystemCalls::ScheduleTask(System.Int32)" };
$[338].d = { Name: "System.Void XaeiOS.SystemCalls::BlockTask(System.Int32)" };
$[339].d = { Name: "System.Void XaeiOS.SystemCalls::UnblockTask(System.Int32)" };
$[340].d = { Name: "System.Void XaeiOS.SystemCalls::Yield()" };
$[341].d = { Name: "System.Void XaeiOS.SystemCalls::KillTask(System.Int32)" };
$[342].d = { Name: "System.Int32 XaeiOS.SystemCalls::GetCurrentTaskId()" };
$[343].d = { Name: "System.Int32 XaeiOS.SystemCalls::CreateTask(System.Object,XaeiOS.Kernel.TaskFunction,XaeiOS.Kernel.TaskCallback,XaeiOS.Kernel.TaskPriority,System.String)" };
$[344].d = { Name: "System.String XaeiOS.SystemCalls::GetStackTrace(System.NativeObject)" };
t0 = $[37]("XaeiOS.Kernel","TaskPriorityQueue")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskPriorityQueue")*/;
_[315].c = t0;
t1 = $[37]("XaeiOS.Kernel","Task")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "Task")*/;
_[319].c = t1;
t2 = $[37]("XaeiOS.Kernel","TaskCallback")/*t2 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskCallback")*/;
_[325].c = t2;
t3 = $[37]("XaeiOS.Kernel","TaskFunction")/*t3 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskFunction")*/;
_[327].c = t3;
t4 = $[37]("XaeiOS.Kernel","TaskExitStatus")/*t4 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskExitStatus")*/;
_[329].c = t4;
t5 = $[37]("XaeiOS.Kernel","TaskPriority")/*t5 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskPriority")*/;
_[335].c = t5;
t6 = $[37]("XaeiOS.Kernel","Frame")/*t6 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "Frame")*/;
_[342].c = t6;
t7 = $[37]("XaeiOS.Kernel","FrameFlags")/*t7 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "FrameFlags")*/;
_[344].c = t7;
t8 = $[37]("XaeiOS.Kernel","Scheduler")/*t8 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "Scheduler")*/;
_[348].c = t8;
t9 = $[37]("","ScheduleTaskDelegate")/*t9 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "ScheduleTaskDelegate")*/;
_[357].c = t9;
t10 = $[37]("XaeiOS.Kernel","TaskStatus")/*t10 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "TaskStatus")*/;
_[359].c = t10;
t11 = $[37]("XaeiOS.Kernel","Continuation")/*t11 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS.Kernel", "Continuation")*/;
_[363].c = t11;
t12 = $[37]("XaeiOS","SystemCalls")/*t12 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("XaeiOS", "SystemCalls")*/;
_[366].c = t12;
_[368].b = _[0];// System.Text.RegularExpressions.Regex extends System.Object
_[370].b = _[0];// System.Text.StringBuilder extends System.Object
$[345].d = { Name: "System.Boolean System.Text.RegularExpressions.Regex::IsMatch(System.String,System.String)" };
$[346].d = { Name: "System.Void System.Text.RegularExpressions.Regex::.ctor()" };
$[347].d = { Name: "System.Void System.Text.StringBuilder::Append(System.String)" };
$[348].d = { Name: "System.String System.Text.StringBuilder::ToString()" };
$[349].d = { Name: "System.Void System.Text.StringBuilder::.ctor()" };
t0 = $[37]("System.Text.RegularExpressions","Regex")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Text.RegularExpressions", "Regex")*/;
_[368].c = t0;
t1 = $[37]("System.Text","StringBuilder")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Text", "StringBuilder")*/;
_[370].c = t1;
_[372].b = _[0];// System.Browser.XmlHttpRequest.XmlHttpRequest extends System.Object
_[391].b = _[0];// System.Browser.Dom.DomManager extends System.Object
_[393].b = _[0];// System.Browser.Dom.DomManager/DomElementResourceWrapper extends System.Object
_[395].b = _[0];// System.Browser.XmlHttpRequest.XmlHttpRequestManager extends System.Object
_[397].b = _[0];// System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler extends System.Object
_[403].b = _[4];// System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException extends System.Exception
$[350].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Abort()" };
$[351].d = { Name: "System.String System.Browser.XmlHttpRequest.XmlHttpRequest::GetAllResponseHeaders()" };
$[352].d = { Name: "System.String System.Browser.XmlHttpRequest.XmlHttpRequest::GetResponseHeader(System.String)" };
$[353].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String)" };
$[354].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean)" };
$[355].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String)" };
$[356].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Open(System.String,System.String,System.Boolean,System.String,System.String)" };
$[357].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::Send(System.String)" };
$[358].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::SetRequestHeader(System.String,System.String)" };
$[359].d = { Name: "System.String System.Browser.XmlHttpRequest.XmlHttpRequest::get_ResponseText()" };
$[360].d = { Name: "System.Int32 System.Browser.XmlHttpRequest.XmlHttpRequest::get_Status()" };
$[361].d = { Name: "System.String System.Browser.XmlHttpRequest.XmlHttpRequest::get_StatusText()" };
$[362].d = { Name: "System.Browser.XmlHttpRequest.ReadyState System.Browser.XmlHttpRequest.XmlHttpRequest::get_ReadyState()" };
$[363].d = { Name: "System.NativeFunction System.Browser.XmlHttpRequest.XmlHttpRequest::get_OnReadyStateChange()" };
$[364].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::set_OnReadyStateChange(System.NativeFunction)" };
$[365].d = { Name: "System.String System.Browser.XmlHttpRequest.XmlHttpRequest::ToString()" };
$[366].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequest::.ctor(System.Browser.XmlHttpRequest.IXmlHttpRequest)" };
$[367].d = { Name: "System.Browser.Dom.IDomElement System.Browser.Dom.DomManager::CreateElement(System.String)" };
$[368].d = { Name: "System.Void System.Browser.Dom.DomManager::RegisterElement(System.Browser.Dom.IDomElement)" };
$[369].d = { Name: "System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::Dispose()" };
$[370].d = { Name: "System.String System.Browser.Dom.DomManager/DomElementResourceWrapper::ToString()" };
$[371].d = { Name: "System.Void System.Browser.Dom.DomManager/DomElementResourceWrapper::.ctor(System.Browser.Dom.IDomElement)" };
$[372].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::GetXmlHttpRequest()" };
$[373].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String)" };
$[374].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod)" };
$[375].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String,System.Int32)" };
$[376].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::DoSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String)" };
$[377].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestManager::_doSimpleXmlHttpRequest(System.String,System.Browser.XmlHttpRequest.RequestMethod,System.String,System.String,System.String,System.Int32)" };
$[378].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::OnReadyStateChange()" };
$[379].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequestManager/OnReadyStateChangeHandler::.ctor()" };
$[380].d = { Name: "System.Browser.XmlHttpRequest.XmlHttpRequest System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException::get_XmlHttpRequest()" };
$[381].d = { Name: "System.Void System.Browser.XmlHttpRequest.XmlHttpRequestTimeoutException::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest)" };
t0 = $[37]("System.Browser.XmlHttpRequest","XmlHttpRequest")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "XmlHttpRequest")*/;
_[372].c = t0;
t1 = $[37]("System.Browser.Css","IStyle")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.Css", "IStyle")*/;
_[374].c = t1;
t2 = $[37]("System.Browser.Dom","IDomNode")/*t2 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.Dom", "IDomNode")*/;
_[376].c = t2;
t3 = $[37]("System.Browser.XmlHttpRequest","IXmlHttpRequest")/*t3 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "IXmlHttpRequest")*/;
_[378].c = t3;
t4 = $[37]("System.Browser.XmlHttpRequest","ReadyState")/*t4 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "ReadyState")*/;
_[380].c = t4;
t5 = $[37]("System.Browser.Dom","IDomDocument")/*t5 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.Dom", "IDomDocument")*/;
_[387].c = t5;
t6 = $[37]("System.Browser.Dom","IDomElement")/*t6 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.Dom", "IDomElement")*/;
_[389].c = t6;
t7 = $[37]("System.Browser.Dom","DomManager")/*t7 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.Dom", "DomManager")*/;
_[391].c = t7;
t8 = $[37]("","DomElementResourceWrapper")/*t8 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "DomElementResourceWrapper")*/;
_[393].c = t8;
t9 = $[37]("System.Browser.XmlHttpRequest","XmlHttpRequestManager")/*t9 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "XmlHttpRequestManager")*/;
_[395].c = t9;
t10 = $[37]("","OnReadyStateChangeHandler")/*t10 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "OnReadyStateChangeHandler")*/;
_[397].c = t10;
t11 = $[37]("System.Browser.XmlHttpRequest","RequestMethod")/*t11 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "RequestMethod")*/;
_[399].c = t11;
t12 = $[37]("System.Browser.XmlHttpRequest","XmlHttpRequestTimeoutException")/*t12 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Browser.XmlHttpRequest", "XmlHttpRequestTimeoutException")*/;
_[403].c = t12;
_[405].b = _[0];// System.Net.Socket extends System.Object
_[407].b = _[0];// System.Net.JsonRpc.JsonRpcClient extends System.Object
_[410].b = _[0];// System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler extends System.Object
_[420].b = _[105];// System.Net.Comet.CometMessageEventArgs extends System.EventArgs
_[423].b = _[4];// System.Net.JsonRpc.JsonRpcException extends System.Exception
_[425].b = _[423];// System.Net.JsonRpc.JsonRpcCallTimedOutException extends System.Net.JsonRpc.JsonRpcException
_[427].b = _[0];// System.Net.Comet.CometConnection extends System.Object
$[382].d = { Name: "System.Void System.Net.Socket::Connect()" };
$[383].d = { Name: "System.Void System.Net.Socket::.ctor()" };
$[384].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::get_ServerUrl()" };
$[385].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient::set_ServerUrl(System.String)" };
$[386].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::get_Username()" };
$[387].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient::set_Username(System.String)" };
$[388].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::get_Password()" };
$[389].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient::set_Password(System.String)" };
$[390].d = { Name: "System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String)" };
$[391].d = { Name: "System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String,System.Object[])" };
$[392].d = { Name: "System.Object System.Net.JsonRpc.JsonRpcClient::Call(System.String,System.Object[],System.Int32)" };
$[393].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::Serialize(System.Object)" };
$[394].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::SerializeNull()" };
$[395].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::SerializeString(System.String)" };
$[396].d = { Name: "System.Boolean System.Net.JsonRpc.JsonRpcClient::CanSerializeWithToString(System.Object)" };
$[397].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::SerializeWithToString(System.Object)" };
$[398].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::SerializeArray(System.NativeArray`1<System.Object>)" };
$[399].d = { Name: "System.String System.Net.JsonRpc.JsonRpcClient::SerializeNativeObject(System.NativeObject)" };
$[400].d = { Name: "System.Object System.Net.JsonRpc.JsonRpcClient::Deserialize(System.String)" };
$[401].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient::.ctor(System.String)" };
$[402].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient::.ctor(System.String,System.String,System.String)" };
$[403].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::OnReadyStateChange()" };
$[404].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcClient/OnReadyStateChangeHandler::.ctor(System.Browser.XmlHttpRequest.XmlHttpRequest,System.Threading.Condition)" };
$[405].d = { Name: "System.String System.Net.Comet.CometMessageEventArgs::get_Message()" };
$[406].d = { Name: "System.Void System.Net.Comet.CometMessageEventArgs::set_Message(System.String)" };
$[407].d = { Name: "System.Void System.Net.Comet.CometMessageEventArgs::.ctor(System.String)" };
$[408].d = { Name: "System.Net.JsonRpc.JsonRpcClient System.Net.JsonRpc.JsonRpcException::get_Client()" };
$[409].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcException::set_Client(System.Net.JsonRpc.JsonRpcClient)" };
$[410].d = { Name: "System.String System.Net.JsonRpc.JsonRpcException::get_Method()" };
$[411].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcException::set_Method(System.String)" };
$[412].d = { Name: "System.Object[] System.Net.JsonRpc.JsonRpcException::get_Arguments()" };
$[413].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcException::set_Arguments(System.Object[])" };
$[414].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.String)" };
$[415].d = { Name: "System.Void System.Net.JsonRpc.JsonRpcCallTimedOutException::.ctor(System.Net.JsonRpc.JsonRpcClient,System.String,System.Object[],System.Int32)" };
$[416].d = { Name: "System.String System.Net.Comet.CometConnection::get_ServerUrl()" };
$[417].d = { Name: "System.Void System.Net.Comet.CometConnection::set_ServerUrl(System.String)" };
$[418].d = { Name: "System.Net.Comet.CometConnectionState System.Net.Comet.CometConnection::get_State()" };
$[419].d = { Name: "System.Void System.Net.Comet.CometConnection::set_State(System.Net.Comet.CometConnectionState)" };
$[420].d = { Name: "System.String System.Net.Comet.CometConnection::get_Username()" };
$[421].d = { Name: "System.Void System.Net.Comet.CometConnection::set_Username(System.String)" };
$[422].d = { Name: "System.String System.Net.Comet.CometConnection::get_Password()" };
$[423].d = { Name: "System.Void System.Net.Comet.CometConnection::set_Password(System.String)" };
$[424].d = { Name: "System.Void System.Net.Comet.CometConnection::add_Established(System.EventHandler)" };
$[425].d = { Name: "System.Void System.Net.Comet.CometConnection::remove_Established(System.EventHandler)" };
$[426].d = { Name: "System.Void System.Net.Comet.CometConnection::add_Restablishing(System.EventHandler)" };
$[427].d = { Name: "System.Void System.Net.Comet.CometConnection::remove_Restablishing(System.EventHandler)" };
$[428].d = { Name: "System.Void System.Net.Comet.CometConnection::add_Reestablished(System.EventHandler)" };
$[429].d = { Name: "System.Void System.Net.Comet.CometConnection::remove_Reestablished(System.EventHandler)" };
$[430].d = { Name: "System.Void System.Net.Comet.CometConnection::add_Failed(System.EventHandler)" };
$[431].d = { Name: "System.Void System.Net.Comet.CometConnection::remove_Failed(System.EventHandler)" };
$[432].d = { Name: "System.Void System.Net.Comet.CometConnection::add_MessageReceived(System.EventHandler)" };
$[433].d = { Name: "System.Void System.Net.Comet.CometConnection::remove_MessageReceived(System.EventHandler)" };
$[434].d = { Name: "System.Void System.Net.Comet.CometConnection::Open()" };
$[435].d = { Name: "System.Void System.Net.Comet.CometConnection::DataReceived(System.Object,System.EventArgs)" };
$[436].d = { Name: "System.Void System.Net.Comet.CometConnection::.ctor(System.String,System.String,System.String)" };
$[437].d = { Name: "System.Void System.Net.Comet.CometConnection::.ctor(System.String)" };
t0 = $[37]("System.Net","Socket")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net", "Socket")*/;
_[405].c = t0;
t1 = $[37]("System.Net.JsonRpc","JsonRpcClient")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.JsonRpc", "JsonRpcClient")*/;
_[407].c = t1;
t2 = $[37]("","OnReadyStateChangeHandler")/*t2 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("", "OnReadyStateChangeHandler")*/;
_[410].c = t2;
t3 = $[37]("System.Net.Comet","CometConnectionState")/*t3 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Comet", "CometConnectionState")*/;
_[412].c = t3;
t4 = $[37]("System.Net.Comet","CometMessageEventArgs")/*t4 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Comet", "CometMessageEventArgs")*/;
_[420].c = t4;
t5 = $[37]("System.Net.JsonRpc","JsonRpcException")/*t5 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.JsonRpc", "JsonRpcException")*/;
_[423].c = t5;
t6 = $[37]("System.Net.JsonRpc","JsonRpcCallTimedOutException")/*t6 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.JsonRpc", "JsonRpcCallTimedOutException")*/;
_[425].c = t6;
t7 = $[37]("System.Net.Comet","CometConnection")/*t7 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Comet", "CometConnection")*/;
_[427].c = t7;
_[429].b = _[0];// System.Net.Tests.Program extends System.Object
_[433].b = _[0];// System.Net.Tests.User extends System.Object
_[435].b = _[0];// System.Net.Tests.ProcessViewer extends System.Object
$[438].d = { Name: "System.Void System.Net.Tests.Program::Main(System.String[])" };
$[439].d = { Name: "System.Void System.Net.Tests.Program::Start()" };
$[440].d = { Name: "System.Void System.Net.Tests.Program::RunProcessViewer()" };
$[441].d = { Name: "System.Void System.Net.Tests.Program::Authenticate()" };
$[442].d = { Name: "System.Void System.Net.Tests.Program::<RunProcessViewer>b__0()" };
$[443].d = { Name: "System.Void System.Net.Tests.Program::<RunProcessViewer>b__1()" };
$[444].d = { Name: "System.Void System.Net.Tests.Program::.ctor()" };
$[445].d = { Name: "System.String System.Net.Tests.User::get_EmailAddress()" };
$[446].d = { Name: "System.Void System.Net.Tests.User::set_EmailAddress(System.String)" };
$[447].d = { Name: "System.String System.Net.Tests.User::get_PasswordHash()" };
$[448].d = { Name: "System.Void System.Net.Tests.User::set_PasswordHash(System.String)" };
$[449].d = { Name: "System.String System.Net.Tests.User::ToString()" };
$[450].d = { Name: "System.Void System.Net.Tests.User::.ctor(System.NativeObject)" };
$[451].d = { Name: "System.Void System.Net.Tests.ProcessViewer::Start()" };
$[452].d = { Name: "System.Void System.Net.Tests.ProcessViewer::UpdateInnerHTML(System.Text.StringBuilder)" };
$[453].d = { Name: "System.Void System.Net.Tests.ProcessViewer::BuildSIPTable(System.Text.StringBuilder)" };
$[454].d = { Name: "System.Void System.Net.Tests.ProcessViewer::BuildThreadTable(System.Text.StringBuilder)" };
$[455].d = { Name: "System.Void System.Net.Tests.ProcessViewer::.ctor()" };
t0 = $[37]("System.Net.Tests","Program")/*t0 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Tests", "Program")*/;
_[429].c = t0;
t1 = $[37]("System.Net.Tests","User")/*t1 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Tests", "User")*/;
_[433].c = t1;
t2 = $[37]("System.Net.Tests","ProcessViewer")/*t2 = System.Runtime.CompilerServices.RuntimeHelpers::CreateClass("System.Net.Tests", "ProcessViewer")*/;
_[435].c = t2;
},EntryPoint:$[438]};