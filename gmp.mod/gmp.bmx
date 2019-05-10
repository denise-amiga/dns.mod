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
Module dns.gmp

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
Import "-lgmp"

Type TGMPz

	Field mz:Byte ptr

	Method New()
		mz = MemAlloc(12)
		mpz_init(mz)
	EndMethod

	Method New(value:Int = 0)
		mz = MemAlloc(12)
		mpz_init_set_si(mz, value)
	EndMethod

	Method New(value:String, base:Int = 10)
		mz = MemAlloc(12)
		mpz_init_set_str(mz, value, base)
	EndMethod

	Method Delete()
		mpz_clear(mz)
		MemFree(mz)
		mz = null
	EndMethod

	Method Set(value:Int)
		mpz_set_si(mz, value)
	EndMethod
	
	Method Set(value:String, base:Int = 10)
		mpz_set_str(mz, value, base)
	EndMethod

	Method ToString:String(base:Int = 10)
		return mpz_get_str(null, base, mz)
	EndMethod
	
	Method Operator +:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_add(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator -:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_sub(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator *:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_mul(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator /:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_fdiv_q(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator Mod:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_mod(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator Shl:TGMPz(i:Int)
		Local n:TGMPz = New TGMPz(0)
		mpz_mul_2exp(n.mz, mz, i)
		Return n
	EndMethod
	
	Method Operator Shr:TGMPz(i:Int)
		Local n:TGMPz = New TGMPz(0)
		mpz_fdiv_q_2exp(n.mz, mz, i)
		Return n
	EndMethod
	
	Method Operator &:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_and(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator |:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_ior(n.mz, mz, a.mz)
		Return n
	EndMethod
	
	Method Operator ~:TGMPz(a:TGMPz)
		Local n:TGMPz = New TGMPz(0)
		mpz_xor(n.mz, mz, a.mz)
		Return n
	EndMethod

	Method Operator :+(a:TGMPz)
		mpz_add(mz, mz, a.mz)
	EndMethod
	
	Method Operator :-(a:TGMPz)
		mpz_sub(mz, mz, a.mz)
	EndMethod
	
	Method Operator :*(a:TGMPz)
		mpz_mul(mz, mz, a.mz)
	EndMethod
	
	Method Operator :/(a:TGMPz)
		mpz_fdiv_q(mz, mz, a.mz)
	EndMethod
	
	Method Operator :Mod(a:TGMPz)
		mpz_mod(mz, mz, a.mz)
	EndMethod

	Method Operator :Shl(i:Int)
		mpz_mul_2exp(mz, mz, i)
	EndMethod
	
	Method Operator :Shr(i:Int)
		mpz_fdiv_q_2exp(mz, mz, i)
	EndMethod
		
	Method Operator :&(a:TGMPz)
		mpz_and(mz, mz, a.mz)
	EndMethod
	
	Method Operator :|(a:TGMPz)
		mpz_ior(mz, mz, a.mz)
	EndMethod
	
	Method Operator :~(a:TGMPz)
		mpz_xor(mz, mz, a.mz)
	EndMethod
	
	Method Operator +:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(0)
		mpz_add_ui(n.mz, mz, i)
		Return n
	EndMethod

	Method Operator -:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(0)
		mpz_sub_ui(n.mz, mz, i)
		Return n
	EndMethod

	Method Operator *:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(0)
		mpz_mul_ui(n.mz, mz, i)
		Return n
	EndMethod

	Method Operator /:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(0)
		mpz_fdiv_q_ui(n.mz, mz, i)
		Return n
	EndMethod

	Method Operator Mod:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(0)
		mpz_mod_ui(n.mz, mz, i)
		Return n
	EndMethod

'	Method Operator Shl:TGMPz(i:Int)
'		local n:TGMPz = New TGMPz
'		mpz_mul_2exp(n.mz, mz, i)
'		Return n		
'	EndMethod
	
'	Method Operator Shr:TGMPz(i:Int)
'		local n:TGMPz = New TGMPz
'		mpz_fdiv_q_2exp(n.mz, mz, i)
'		Return n		
'	EndMethod
	
	Method Operator &:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_and(n.mz, mz, n.mz)
		Return n
	EndMethod
	
	Method Operator |:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_ior(n.mz, mz, n.mz)
		Return n
	EndMethod
	
	Method Operator ~:TGMPz(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_xor(n.mz, mz, n.mz)
		Return n
	EndMethod
	
	Method Operator :+(i:Int)
		mpz_add_ui(mz, mz, i)
	EndMethod
	
	Method Operator :-(i:Int)
		mpz_sub_ui(mz, mz, i)
	EndMethod
	
	Method Operator :*(i:Int)
		mpz_mul_ui(mz, mz, i)
	EndMethod
	
	Method Operator :/(i:Int)
		mpz_fdiv_q_ui(mz, mz, i)
	EndMethod
	
	Method Operator :Mod(i:Int)
		mpz_mod_ui(mz, mz, i)
	EndMethod
	
'	Method Operator :Shl(i:Int)
'		mpz_mul_2exp(mz, mz, i)
'	EndMethod
	
'	Method Operator :Shr(i:Int)
'		mpz_fdiv_q_2exp(mz, mz, i)
'	EndMethod
	
	Method Operator :&(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_and(mz, mz, n.mz)
		mpz_clear(n.mz)
		MemFree(n.mz)
		n.mz = null
		n = null
	EndMethod
	
	Method Operator :|(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_ior(mz, mz, n.mz)
		mpz_clear(n.mz)
		MemFree(n.mz)
		n.mz = null
		n = null
	EndMethod
	
	Method Operator :~(i:Int)
		local n:TGMPz = New TGMPz(i)
		mpz_xor(mz, mz, n.mz)
		mpz_clear(n.mz)
		MemFree(n.mz)
		n.mz = null
		n = null
	EndMethod

	Method Pow(expo:Int)
		mpz_pow_ui(mz, mz, expo)
	EndMethod
	
	Method Fac(i:Int)
		mpz_fac_ui(mz, i)
	EndMethod
	
	Method Fib(i:Int)
		mpz_fib_ui(mz, i)
	EndMethod
	
End Type

Extern
	Global gmp_version_$z="__gmp_version"
	Function mpz_init(a:Byte ptr)="__gmpz_init"
	Function mpz_init_set_si(a:Byte ptr, value:Int)="__gmpz_init_set_si"
	Function mpz_init_set_str:Int(a:Byte ptr, value$z, base:Int)="__gmpz_init_set_str"
	Function mpz_clear(a:Byte ptr)="__gmpz_clear"

	Function mpz_set_si(a:Byte ptr, value:Int)="__gmpz_set_si"
	Function mpz_set_str(a:Byte ptr, value$z, base:Int)="__gmpz_set_str"
	Function mpz_get_si:Int(a:Byte ptr)="__gmpz_get_si"
	Function mpz_get_str$z(s$z, base:Int, a:Byte ptr)="__gmpz_get_str"

	Function mpz_add(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_add"
	Function mpz_add_ui(a:Byte ptr, b:Byte ptr, c:Int)="__gmpz_add_ui"
	Function mpz_sub(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_sub"
	Function mpz_sub_ui(a:Byte ptr, b:Byte ptr, c:Int)="__gmpz_sub_ui"
	Function mpz_mul(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_mul"
	Function mpz_mul_ui(a:Byte ptr, b:Byte ptr, c:Int)="__gmpz_mul_ui"
	Function mpz_cdiv_q(q:Byte ptr, n:Byte ptr, d:Byte ptr)="__gmpz_cdiv_q"
	Function mpz_cdiv_q_ui:UInt(q:Byte ptr, n:Byte ptr, d:Int)="__gmpz_cdiv_q_ui"
	Function mpz_fdiv_q(q:Byte ptr, n:Byte ptr, d:Byte ptr)="__gmpz_fdiv_q"
	Function mpz_fdiv_q_ui:UInt(q:Byte ptr, n:Byte ptr, d:Int)="__gmpz_fdiv_q_ui"
	Function mpz_tdiv_q(q:Byte ptr, n:Byte ptr, d:Byte ptr)="__gmpz_tdiv_q"
	Function mpz_tdiv_q_ui:UInt(q:Byte ptr, n:Byte ptr, d:Int)="__gmpz_tdiv_q_ui"
	Function mpz_mod(r:Byte ptr, q:Byte ptr, d:Byte ptr)="__gmpz_mod"
	Function mpz_mod_ui:UInt(r:Byte ptr, q:Byte ptr, d:Int)="__gmpz_fdiv_r_ui"

	Function mpz_mul_2exp(a:Byte ptr, b:Byte ptr, bits:Int)="__gmpz_mul_2exp"
	Function mpz_fdiv_q_2exp(a:Byte ptr, b:Byte ptr, bits:Int)="__gmpz_fdiv_q_2exp"

	Function mpz_and(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_and"
	Function mpz_ior(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_ior"
	Function mpz_xor(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_xor"

	Function mpz_pow_ui(a:Byte ptr, base:Byte ptr, expo:Int)="__gmpz_pow_ui"
	Function mpz_ui_pow_ui(a:Byte ptr, base:Int, expo:Int)="__gmpz_ui_pow_ui"

	Function mpz_gcd(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_gcd"
	Function mpz_gcd_ui:Int(a:Byte ptr, b:Byte ptr, c:Int)="__gmpz_gcd_ui"
	Function mpz_lcm(a:Byte ptr, b:Byte ptr, c:Byte ptr)="__gmpz_lcm"
	Function mpz_lcm_ui(a:Byte ptr, b:Byte ptr, c:Int)="__gmpz_lcm_ui"
	Function mpz_fac_ui(a:Byte ptr, i:Int)="__gmpz_fac_ui"
	Function mpz_fib_ui(a:Byte ptr, i:Int)="__gmpz_fib_ui"
End Extern

Function gmp_version:String()
	Return gmp_version_
EndFunction

?