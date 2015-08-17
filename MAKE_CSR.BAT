REM RideCheck SSL make_csr.bat version 1.0
REM
REM Batch file to generate a key and Certificate Signing Request for use with Stunnel and HFS
REM Outputs: stun-key.pem and stun-csr.pem
REM See your CA's website for instructions on how to submit your CSR and start the 
REM   the key generation process.
REM
REM You must enter your country, state, city, company, department,
REM   and the server's full name, e.g. theserver.yourdomain.com 
REM 
@echo off
setlocal
SET /P genCSR= "DANGER! DANGER!: This script will overwrite stun-key.pem. Enter Y to continue, anything else to Quit: "
IF /I "%genCSR%" NEQ "Y" GOTO END

openssl req -new -nodes -days 365 -config stunnel.cnf -out stun-csr.pem -keyout stun-key.pem

:END
endlocal