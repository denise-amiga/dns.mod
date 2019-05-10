' Copyright (c) 2019 Denise Amiga
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'
' 1. Redistributions of source code must retain the above copyright notice, this
'    list of conditions and the following disclaimer.
' 
' 2. Redistributions in binary form must reproduce the above copyright notice,
'    this list of conditions and the following disclaimer in the documentation
'    and/or other materials provided with the distribution.
'
' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS''
' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
' IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
' FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
' DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
' SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
' CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
' OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
' OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Rem
bbdoc: BSD Bignum Library
End Rem
Module dns.bigz

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Denise Amiga"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."

?bmxng
?win32x86
ModuleInfo "LD_OPTS: -L%PWD%/lib32"
?win32x64
ModuleInfo "LD_OPTS: -L%PWD%/lib64"
?
Import "-lbigz"

'Import "src/*.h"

'Import "src/bign.c"
'Import "src/bigz.c"
'Import "src/bigq.c"
'Import "src/bzf.c"

Global TBZzero:TBZ = New TBZ(0)
Global TBZone:TBZ = New TBZ(1)

Type TBZ

	Field bz:Byte ptr

	Method New()
		bz = BzCreate(1)
	End Method

	Method New(Value:Int = 0)
'		bz = BzCreate(1)
		bz = BzFromInteger(Value)
	End Method

	Method New(Value:String, base:Int = 10, flag:Int = 0)
'		bz = BzCreate(1)
		bz = BzFromString(Value, base, flag)
	End Method

	Method Delete()
		BzFree(bz)
		bz = null
	End Method

	Method ToString:String(base:Int = 10, flag:Int = 0)
		Return BzToString(bz, base, flag)
	End Method

	Method Set(Value:Int)
		bz = BzFromInteger(Value)
	End Method

	Method Operator +:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzAdd(bz, a.bz)
		Return n
	End Method

	Method Operator -:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzSubtract(bz, a.bz)
		Return n
	End Method

	Method Operator *:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzMultiply(bz, a.bz)
		Return n
	End Method

	Method Operator /:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzDiv(bz, a.bz)
		Return n
	End Method

	Method Operator Mod:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzMod(bz, a.bz)
		Return n
	End Method

	Method Operator Shl:TBZ(i:Int)
		local n:TBZ = New TBZ(0)
		n.bz = BzAsh(bz, i)
		Return n
	End Method

	Method Operator Shr:TBZ(i:Int)
		local n:TBZ = New TBZ(0)
		n.bz = BzAsh(bz, -i)
		Return n
	End Method

'	Method Operator Pow:TBZ(a:TBZ)
'		local n:TBZ = New TBZ
'		n.bz=BzPow(bz,a.bz)
'		Return n
'	End Method

	Method Operator &:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzAnd(bz, a.bz)
		Return n
	End Method

	Method Operator |:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzOr(bz, a.bz)
		Return n
	End Method

	Method Operator ~:TBZ(a:TBZ)
		local n:TBZ = New TBZ(0)
		n.bz = BzXor(bz, a.bz)
		Return n
	End Method

'	Method Operator Not:TBZ()
'		local n:TBZ = New TBZ
'		n.bz=BzNot(bz)
'		Return n
'	End Method

'	Method Operator Nand:TBZ(a:TBZ)
'		local n:TBZ = New TBZ
'		n.bz=BzNand(bz,a.bz)
'		Return n
'	End Method

'	Method Operator Nor:TBZ(a:TBZ)
'		local n:TBZ = New TBZ
'		n.bz=BzNor(bz,a.bz)
'		Return n
'	End Method

	Method Operator :+(a:TBZ)
		bz = BzAdd(bz, a.bz)
	End Method

	Method Operator :-(a:TBZ)
		bz = BzSubtract(bz, a.bz)
	End Method

	Method Operator :*(a:TBZ)
		bz = BzMultiply(bz, a.bz)
	End Method

	Method Operator :/(a:TBZ)
		bz = BzDiv(bz, a.bz)
	End Method

	Method Operator :Mod(a:TBZ)
		bz = BzMod(bz, a.bz)
	End Method

	Method Operator :Shl(i:Int)
		bz = BzAsh(bz, i)
	End Method
	
	Method Operator :Shr(i:Int)
		bz = BzAsh(bz, -i)
	End Method
	
	Method Operator :&(a:TBZ)
		bz = BzAnd(bz, a.bz)
	End Method

	Method Operator :|(a:TBZ)
		bz = BzOr(bz, a.bz)
	End Method

	Method Operator :~(a:TBZ)
		bz = BzXor(bz, a.bz)
	End Method

	Method Operator +:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzAdd(bz, n.bz)
		Return n
	End Method

	Method Operator -:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzSubtract(bz, n.bz)
		Return n
	End Method

	Method Operator *:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzMultiply(bz, n.bz)
		Return n
	End Method

	Method Operator /:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzDiv(bz, n.bz)
		Return n
	End Method

	Method Operator Mod:TBZ(i:Int)
		local n:TBZ = New TBZ(0)
		n.bz = BzMod(bz, n.bz)
		Return n
	End Method

'	Method Operator Shl:TBZ(i:Int)
'		local n:TBZ = New TBZ(0)
'		n.bz = BzAsh(bz, i)
'		Return n
'	End Method

'	Method Operator Shr:TBZ(i:Int)
'		local n:TBZ = New TBZ(0)
'		n.bz = BzAsh(bz, -i)
'		Return n
'	End Method

	Method Operator &:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzAnd(bz, n.bz)
		Return n
	End Method

	Method Operator |:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzOr(bz, n.bz)
		Return n
	End Method

	Method Operator ~:TBZ(i:Int)
		local n:TBZ = New TBZ(i)
		n.bz = BzXor(bz, n.bz)
		Return n
	End Method

	Method Operator :+(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzAdd(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :-(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzSubtract(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :*(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzMultiply(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :/(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzDiv(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :Mod(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzMod(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :&(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzAnd(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :|(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzOr(bz, n.bz)
		BzFree(n)
	End Method

	Method Operator :~(i:Int)
		local n:TBZ = New TBZ(i)
		bz = BzXor(bz, n.bz)
		BzFree(n)
	End Method

End Type

Extern
	Function BzVersion$z()
	Function BzCreate:Byte ptr (Size:Int)
	Function BzFree(a:Byte ptr)="void free( void * )"
	Function BzDebug(m$z, a:Byte ptr)

	Function BzNumDigits:Int (a:Byte ptr)	
	Function BzLength:Int (a:Byte ptr)	

	Function BzCopy:Byte ptr (a:Byte ptr)	
	Function BzNegate:Byte ptr (a:Byte ptr)	
	Function BzAbs:Byte ptr (a:Byte ptr)	
	Function BzCompare:Int (a:Byte ptr, b:Byte ptr)	

	Function BzAdd:Byte ptr (a:Byte ptr, b:Byte ptr)
	Function BzSubtract:Byte ptr (a:Byte ptr, b:Byte ptr)
	Function BzMultiply:Byte ptr (a:Byte ptr, b:Byte ptr)
	Function BzDiv:Byte ptr (a:Byte ptr, b:Byte ptr)

	Function BzTruncate:Byte ptr (a:Byte ptr, b:byte ptr)	
	Function BzFloor:Byte ptr (a:Byte ptr, b:Byte ptr)
	Function BzCeiling:Byte ptr (a:Byte ptr, b:Byte ptr)
	Function BzRound:Byte ptr (a:Byte ptr, b:Byte ptr)

	Function BzIsEven:Int (a:Byte ptr)
	Function BzIsOdd:Int (a:Byte ptr)

	Function BzMod:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzRem:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzPow:Byte ptr(base:Byte ptr, exponent:Int)

	Function BzNot:Byte ptr(a:Byte ptr)
	Function BzAnd:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzOr:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzXor:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzNand:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzNor:Byte ptr(a:Byte ptr, b:Byte ptr)

	Function BzAsh:Byte ptr (a:Byte ptr, b:Int)
	Function BzSqrt:Byte ptr(a:Byte ptr)
	Function BzFactorial:Byte ptr(a:Byte ptr)
	Function BzLcm:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzGcd:Byte ptr(a:Byte ptr, b:Byte ptr)
	Function BzModExp:Byte ptr(base:Byte ptr, exponent:Byte ptr, modulus:Byte ptr)

	Function BzFromInteger:Byte ptr (i:Int)
	Function BzFromUnsignedInteger:Byte ptr (i:UInt)
	Function BzFromString:Byte ptr (s$z, base:Int, flag:Int)
	Function BzToString$z(z:Byte ptr, base:Int, sign:Int)
End Extern
?