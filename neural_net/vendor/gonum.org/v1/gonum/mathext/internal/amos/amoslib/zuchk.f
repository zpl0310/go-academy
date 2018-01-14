      SUBROUTINE ZUCHK(YR, YI, NZ, ASCLE, TOL)
C***BEGIN PROLOGUE  ZUCHK
C***REFER TO ZSERI,ZUOIK,ZUNK1,ZUNK2,ZUNI1,ZUNI2,ZKSCL
C
C      Ytr ENTERS AS A SCALED QUANTITY WHOSE MAGNITUDE IS GREATER THAN
C      EXP(-ALIM)=ASCLE=1.0E+3*D1MACH(1)/TOL. THE TEST IS MADE TO SEE
C      IF THE MAGNITUDE OF THE REAL OR IMAGINARY PART WOULD UNDERFLOW
C      WHEN Ytr IS SCALED (BY TOL) TO ITS PROPER VALUE. Ytr IS ACCEPTED
C      IF THE UNDERFLOW IS AT LEAST ONE PRECISION BELOW THE MAGNITUDE
C      OF THE LARGEST COMPONENT; OTHERWISE THE PHASE ANGLE DOES NOT HAVE
C      ABSOLUTE ACCURACY AND AN UNDERFLOW IS ASSUMED.
C
C***ROUTINES CALLED  (NONE)
C***END PROLOGUE  ZUCHK
C
C     COMPLEX Ytr
      DOUBLE PRECISION ASCLE, SS, ST, TOL, WR, WI, YR, YI
      INTEGER NZ
      NZ = 0
      WR = DABS(YR)
      WI = DABS(YI)
      ST = DMIN1(WR,WI)
      IF (ST.GT.ASCLE) RETURN
      SS = DMAX1(WR,WI)
      ST = ST/TOL
      IF (SS.LT.ST) NZ = 1
      RETURN
      END