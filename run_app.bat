::
:: Standalone script for running a Python app in Windows.
:: 

set pyv=%UserProfile%\AppData\Local\Programs\Python\Python37\
set py=%pyv%\python.exe

set exe="%~dp0\main.py"
%py% %exe% && ( pause ) || ( pause )

