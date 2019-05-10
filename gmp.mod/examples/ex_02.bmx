SuperStrict

Framework brl.standardio
Import dns.gmp

local a:TGMPz = New TGMPz(1)
local b:TGMPz = New TGMPz(31)
local c:TGMPz = New TGMPz(255)

For Local i:Int = 2 To 100
'	b.set(i)
	a :* i
Next

print gmp_version()
print a.tostring()

mpz_fac_ui(a.mz, 100)
Print a.tostring()

mpz_ui_pow_ui(a.mz, 2, 100)
Print a.tostring()

a.set(1000)
print a.tostring()

a :| 31
print a.tostring()

a :~ 255
print a.tostring()
