

```
https://hub.docker.com/r/skunklabz/tk4-hercules
```

```
docker run -ti -p 3270:3270 -p8038:8038 skunklabz/tk4-hercules
```

```
docker run -d \
--mount source=tk4-conf,target=/tk4-/conf \
--mount source=tk4-local_conf,target=/tk4-/local_conf \
--mount source=tk4-local_scripts,target=/tk4-/local_scripts \
--mount source=tk4-prt,target=/tk4-/prt \
--mount source=tk4-dasd,target=/tk4-/dasd \
--mount source=tk4-pch,target=/tk4-/pch \
--mount source=tk4-jcl,target=/tk4-/jcl \
--mount source=tk4-log,target=/tk4-/log \
-p 3270:3270 \
-p 8038:8038 tk4
```

connect use
```
127.0.0.1:3270
```

```
https://bradricorigg.medium.com/run-your-own-mainframe-using-hercules-mainframe-emulator-and-mvs-3-8j-tk4-55fa7c982553
```

```
https://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf
```

```
HERC01 is a fully authorized user with full access to the RAKF users and profiles
tables. The logon password is CUL8TR.
 HERC02 is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is CUL8TR.
 HERC03 is a regular user. The logon password is PASS4U.
 HERC04 is a regular user. The logon password is PASS4U.
 IBMUSER is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is IBMPASS. This account is meant to be used for
recovery purposes only.
```
