SuperStrict

Framework brl.standardio
Import dns.gmp

local a:TGMPz = New TGMPz(1)
local b:TGMPz = New TGMPz(31)
local c:TGMPz = New TGMPz(255)

c.Set(1)
For Local i:Int = 1 To 100
	b.Set(i)
	c:*b
Next
print c.toString()

c.Set(1)
For Local i:Int = 1 To 100
	c:*i
Next
print c.toString()

c.Set(0)
c.Fac(100)
print c.toString()

a.Set(100)
mpz_fac_ui(a.mz, 100)
print a.toString()

