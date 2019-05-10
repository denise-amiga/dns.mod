SuperStrict

Framework brl.standardio
Import dns.gmp

Local a:TGMPz = New TGMPz(0)
Local b:TGMPz = New TGMPz("1")
Local c:TGMPz = New TGMPz(0)

Print gmp_version()
'6.1.2

Print a.ToString()
'0

a.Set(1)
Print a.ToString()
'1

a = a + 1
Print a.ToString()
'2

a:- 1
Print a.ToString()
'1

a = a + b
Print a.ToString()
'2

a:- b
Print a.ToString()
'1

c = a shl 4
print c.ToString()
'16

c:shr 2
print c.ToString()
'4
