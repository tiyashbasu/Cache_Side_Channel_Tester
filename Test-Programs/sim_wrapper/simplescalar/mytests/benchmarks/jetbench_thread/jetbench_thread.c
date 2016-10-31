/*
	Engine Simulator

	Program to perform turbomachinery design and analysis
	a)   dry turbojet
	b)   afterburning turbojet
	c)   turbofan with separate nozzle

	Written by Dorian Matichard _ July 2009

	Modified by Sudipta Chattopadhyay (for getting the work station of a single thread)
		  -- Remove all library/print functions (revert with _PRINT)
		  -- Remove all dynamic meemory allocations (revert with _DYNAMIC)
		  -- Remove file operations and implement them in memory (revert with _FILEIO)
		  -- Remove openmp API/directives to represent a single thread of execution 
		  -- (revert with _OPENMP)
		  -- Check whether its working (enable _PRINT_FINAL gcc flag)

		  PS: When reverting to the original mode aprt from enabling all the 
		  above gcc define flags, you also need to uncomment the three #pragma 
		  directives (to enable the openmp features). 

*/


#include"jetbench.h"
#define INPUT_LENGTH 35 

/* sudiptac :::: note that the following are the inputs for this benchmark */
/* Bringing the input memory to exclude file IO operation */
#ifndef _FILEIO
#define ENGINE_TYPE 1
input_data inp[INPUT_LENGTH] = 
		  { 
					 0, 0, 90, 0.05,
					 100, 0, 90, 0.05,
					 200, 1000, 90, 0.05,
					 300, 2000, 90, 0.05,
					 300, 3000, 90, 0.05,
					 300, 4000, 90, 0.05,
					 300, 5000, 90, 0.05,
					 300, 6000, 90, 0.05,
					 300, 7000, 90, 0.05,
					 300, 8000, 90, 0.05,
					 300, 9000, 90, 0.05,
					 350, 10000, 90, 0.05,
					 350, 15000, 90, 0.05,
					 400, 20000, 90, 0.05,
					 450, 25000, 90, 0.05,
					 500, 30000, 90, 0.05,
					 600, 30000, 90, 0.05,
					 600, 30000, 60, 0.05,
					 600, 25000, 50, 0.05,
					 600, 20000, 50, 0.05,
					 600, 15000, 50, 0.05,
					 500, 15000, 50, 0.05,
					 400, 15000, 50, 0.05,
					 400, 10000, 50, 0.05,
					 300, 10000, 50, 0.05,
					 285, 9000, 50, 0.05,
					 270, 8000, 50, 0.05,
					 255, 7000, 50, 0.05,
					 240, 6000, 50, 0.05,
					 225, 5000, 50, 0.05,
					 210, 4000, 50, 0.05,
					 195, 3000, 50, 0.05,
					 180, 2000, 50, 0.05,
					 165, 1000, 50, 0.05,
					 150, 0, 50, 0.05
		  };
#endif

int main(int argc,char *argv[])
{
		  int i=0, lid;
#ifdef _FILEIO
		  FILE * file;
#endif
		  double a,b,c,d;
		  int NumPoints=0,NumMissed=0;
		  double x, pi, sum;
		  double step = 1.0/(double) num_steps;
		  int tid1, tid2, tid3;
		  double used, usedTime, TotalUsed;
		  double TotalTime=0, StartTime, EndTime, ExecTime, ExecTotTime;
		  double TimePoint, TotalTimePoint=0;
#if _DYNAMIC
		  double *StartPiTime, *EndPiTime, *PiTime;
#else
		  double StartPiTime[16], EndPiTime[16], PiTime[16];
#endif


#ifdef _DYNAMIC
		  StartPiTime = (double *)calloc(16,sizeof(double));
		  EndPiTime = (double *)calloc(16,sizeof(double));
		  PiTime = (double *)calloc(16,sizeof(double));
#endif

#ifdef _OPENMP
		  omp_set_num_threads(NUM_THREADS);
#endif

#ifdef _PRINT
		  if(argv[1]==NULL)
		  {
					 printf("Choose your engine :\n");
					 printf("   1:Turbojet\n");
					 printf("   2:Afterburner\n");
					 printf("   3:Turbofan\n");
					 return(0);
		  }
		  if(argc != 2)
		  {
					 printf("invalid number of arguments\n");
					 return(0);
		  }
#endif

		  //define paramaters
		  defaultParam();

#if _PRINT
		  engine = atoi(argv[1]);
#else
		  engine = ENGINE_TYPE;
#endif

		  if(engine == 1)
		  {
#ifdef _PRINT
					 printf("engine %d : Turbojet\n",engine);
#endif
		  }
		  else if(engine == 2)
		  {
#ifdef _PRINT
					 printf("engine %d : Afterburner\n",engine);
#endif
		  }
		  else if(engine == 3)
		  {
#ifdef _PRINT
		  			 printf("Engine %d : Turbofan\n",engine);
#endif
		  }
		  else
		  {
#ifdef _PRINT
					 printf("Wrong engine choice\n");
#endif
					 return(0);
		  }


#ifdef _PRINT 
		  //header for results
		  printf("T,ExecTime,  Spd| Alt |  Thr| Mach|Press| Temp| Fnet|Fgros|RamDr|FlFlo|TSFC|Airfl|Weight|Fn/W\n");
#endif

#ifdef _FILEIO
		  //open the Inputs file
		  file=fopen( "myfile.txt", "r" );
#endif

//#pragma omp parallel private(i) shared(u0d,altd,throtl)
		  {
					 // read line by line
#if _FILEIO
					 while (!feof(file))
#else
					 for (lid = 0; lid < INPUT_LENGTH; lid++)
#endif
					 {
#if _OPENMP
								tid1 = omp_get_thread_num();
								//Pi calculation
								StartPiTime[tid1] = omp_get_wtime();

//#pragma omp parallel reduction(+:sum) private(x,i)	//only the variables updated are categorized as private/shared
#else
								tid1 = 0;
#endif
								{
										  for (i=0 ; i< num_steps ; i++)
										  {
													 x = (i+0.5)*step;
																sum += 4.0/(1.0+x*x);
										  }
#ifdef _OPENMP
		  //#pragma omp single	//entry for a single thread
#endif
										  {
													 pi = sum * step;
										  }
								}

#if _OPENMP
								tid2 = omp_get_thread_num();
								EndPiTime[tid2] = omp_get_wtime();
								PiTime[tid2] = EndPiTime[tid2] - StartPiTime[tid2];
#else
								tid2 = 0;
#endif

#ifdef _FILEIO
								// Read a line, Speed Altitude and Throttle
								fscanf(file,"%lf%lf%lf%lf",&a,&b,&c,&d);

								// Avoid the last point to be execute twice because of the while loop
								if(!feof(file))
#endif
								{
										  if(a<0 || a>1500)
										  {
#ifdef _PRINT
													 printf("Warning : incorrect speed for point %d\n",NumPoints);
#endif
													 u0d=0;
										  }
										  else {
#if _FILEIO
													 // Input speed in mph
													 u0d = a;
#else
													 u0d = inp[lid].a;
#endif
										  }

										  if(b<0 || b>50000)
										  {
#ifdef _PRINT
													 printf("Warning : incorrect altitude for point %d\n",NumPoints);
#endif
													 altd = 0;
										  }
										  else {
#if _FILEIO
													 // Input altitude in feet
													 altd=b;
#else
													 altd = inp[lid].b;
#endif
										  }

										  if(c<45 || c>90)
										  {
#ifdef _PRINT
													 printf("Warning : incorrect throttle for point %d\n",NumPoints);
#endif
													 throtl = 100;
										  }
										  else {
#if _FILEIO
													 // Converting input throttle in %
													 throtl=deg2rad(c,pi)*100*2/pi;
#else
													 throtl=deg2rad(inp[lid].c,pi)*100*2/pi;
#endif
													 
										  }

										  if(d<0)
										  {
#ifdef _PRINT
													 printf("Warning : incorrect throttle for point %d\n",NumPoints);
#endif
													 TimePoint = 0;
										  }
										  else {
#if _FILEIO
													 // Input time point
													 TimePoint = d;
#else
													 TimePoint = inp[lid].d;
#endif
										  }

										  TotalTimePoint += TimePoint;

#ifdef _OPENMP
										  //********* START CALCULATIONS **********
										  StartTime = omp_get_wtime();
#endif

#ifdef _PRINT
										  printf("starting thread = %d\n", omp_get_thread_num());
										  printf("value of parameters = [%lf,%lf,%lf,%lf]\n", u0d, altd, throtl, TimePoint);
#endif

										  /* sudiptac :::: operations performed by a single thread of execution. These 
											* operations only read shared variables but do not update them */
											printf("Start computation.....\n");	
										  deduceInputs();
										  getThermo();
										  getGeo();
										  calcPerf();
											printf("End computation.....\n");	

#if _OPENMP
										  EndTime = omp_get_wtime();
										  ExecTime = EndTime - StartTime;

										  // Get the thread number
										  tid3 = omp_get_thread_num();

										  //deadline time
										  used = (ExecTime+PiTime[tid3]) / TimePoint;
										  ExecTotTime = ExecTime + PiTime[tid3];
										  TotalTime += ExecTotTime;
										  usedTime = (ExecTime + PiTime[tid3]) - TimePoint;
#else
										  tid3 = 0;
#endif
										  TotalUsed += used;

										  // Count the number of points
										  NumPoints++;
										  
#ifdef _PRINT
										  printf("ending thread = %d\n", omp_get_thread_num());
#endif

										  //*********** PRINT RESULTS ************
										  if(used > 1)
										  {
#ifdef _PRINT_FINAL
													 printf("%d,%7lf, %4.0lf|%5.0lf|%5.1lf|%5.3lf|%5.2lf|%5.1lf|%5.0lf|%5.0lf|%5.0lf|%5.0lf|%4.2lf|%5.1lf|%6.2lf|%4.2lf\nDeadline missed : %3.1lf%% used for point %d\n"
																		  ,tid3,ExecTotTime,u0d,altd,throtl,fsmach,psout,tsout,fnlb,fglb,drlb,flflo,sfc,eair,weight,fnlb/weight, used*100, NumPoints);
#endif
													 NumMissed ++;
													 TotalTimePoint += usedTime;
										  }

										  else {
#ifdef _PRINT_FINAL
													 printf("%d,%7lf, %4.0lf|%5.0lf|%5.1lf|%5.3lf|%5.2lf|%5.1lf|%5.0lf|%5.0lf|%5.0lf|%5.0lf|%4.2lf|%5.1lf|%6.2lf|%4.2lf\n     %3.1lf%% used for point %d\n"
																		  , tid3,ExecTotTime,u0d,altd,throtl,fsmach,psout,tsout,fnlb,fglb,drlb,flflo,sfc,eair,weight,fnlb/weight, used*100, NumPoints);
#endif
										  }


								}// End of if(!feof)
					 }// End of while(!feof)


		  }// End of parallel aera


#ifdef _FILEIO
		  // Close the file
		  fclose( file );
#endif


#ifdef _PRINT
		  printf("\nTotal execution time is : %lf with %d missed deadline\n", (TotalTime)/NUM_THREADS, NumMissed);
		  printf("  Which represents %3.1lf%% of\n",TotalUsed*100/NumPoints);
		  printf("    Real time used : %lf\n", TotalTimePoint/NUM_THREADS);
		  printf("Number of threads : %d\n", NUM_THREADS);
		  printf("Number of points : %d\n",NumPoints);
#endif

#ifdef _DYNAMIC
		  free(trat);
		  free(tt);
		  free(prat);
		  free(pt);
		  free(eta);
		  free(gam);
		  free(cp);
		  free(StartPiTime);
		  free(EndPiTime);
		  free(PiTime);
#endif
		  
		  return(0);
}
//***end of main***//


/* Utility to convert degree in radian */
double deg2rad(double deg,double pi)
{
		  return(deg/180*pi);
}

/* Utility to get gamma as a function of temperature */
double getGama(double temp)
{
		  double number,a,b,c,d ;
					 a =  -7.6942651e-13;
					 b =  1.3764661e-08;
					 c =  -7.8185709e-05;
					 d =  1.436914;
					 number = a*temp*temp*temp + b*temp*temp + c*temp +d ;
					 return(number) ;
}

/* Utility to get cp as a function of temperature */
double getCp(double temp)
{
		  double number,a,b,c,d ;
					 // BTU/R
					 a =  -4.4702130e-13;
					 b =  -5.1286514e-10;
					 c =  2.8323331e-05;
					 d =  0.2245283;
					 number = a*temp*temp*temp + b*temp*temp + c*temp +d ;
					 return(number) ;
}

/* Utility to get the Mach number given the corrected airflow per area */
double getMach (int sub, double corair, double gama1)
{
		  double number,chokair;                  // iterate for mach number
		  double deriv,machn,macho,airo,airn;int iter ;
					 chokair = getAir(1.0, gama1) ;
					 if (corair > chokair) {
								number = 1.0 ;
										  return (number) ;
					 }
					 else {
								airo = .25618 ;                  // initial guess
								if (sub == 1) macho = 1.0 ;      // sonic
								else {
										  if (sub == 2) macho = 1.703 ; // supersonic
										  else macho = .5;              // subsonic
										  iter = 1 ;
													 machn = macho - .2  ;
													 /* sudiptac :::: shouldn't it be "fabs" instead of abs ? */
													 while (fabs(corair - airo) > .0001 && iter < 20) {
																airn =  getAir(machn,gama1) ;
																		  deriv = (airn-airo)/(machn-macho) ;
																		  airo = airn ;
																		  macho = machn ;
																		  machn = macho + (corair - airo)/deriv ;
																		  ++ iter ;
													 }
								}
								number = macho ;
					 }
		  return(number) ;
}

/* Utility to get the corrected airflow per area given the Mach number */
double getAir(double mach, double gama2)
{
		  double number,fac1,fac2;
					 fac2 = (gama2+1.0)/(2.0*(gama2-1.0)) ;
					 fac1 = fpow((1.0+.5*(gama2-1.0)*mach*mach),fac2);
					 number =  .50161*sqroot(gama2) * mach/ fac1 ;
					 
					 return(number) ;
}

/* Analysis for Rayleigh flow */
double getRayleighLoss(double mach1, double ttrat, double tlow)
{
		  double number ;
					 double wc1,wc2,mgueso,mach2,g1,gm1,g2,gm2 ;double fac1,fac2,fac3,fac4;
					 g1 = getGama(tlow);
					 gm1 = g1 - 1.0 ;
					 wc1 = getAir(mach1,g1);
					 g2 = getGama(tlow*ttrat);
					 gm2 = g2 - 1.0 ;
					 number = .95 ;
					 // iterate for mach downstream
					 mgueso = .4 ;                 // initial guess
					 mach2 = .5 ;
					 
					 /* sudiptac :::: shouldn't it be "fabs" instead of abs ? */
					 while (fabs(mach2 - mgueso) > .0001) {
								mgueso = mach2 ;
										  fac1 = 1.0 + g1 * mach1 * mach1 ;
										  fac2 = 1.0 + g2 * mach2 * mach2 ;
										  fac3 = fpow((1.0 + .5 * gm1 * mach1 * mach1),(g1/gm1)) ;
										  fac4 = fpow((1.0 + .5 * gm2 * mach2 * mach2),(g2/gm2)) ;
										  number = fac1 * fac4 / fac2 / fac3 ;
										  wc2 = wc1 * sqroot(ttrat) / number ;
										  mach2 = getMach(0,wc2,g2) ;
					 }
		  return(number) ;
}


/* Default parameters */
void defaultParam()
{
		  int i ;
		  
#ifdef _DYNAMIC
		  //allocate memory for arrays
		  trat = (double *)calloc(20,sizeof(double));
		  tt = (double *)calloc(20,sizeof(double));
		  prat = (double *)calloc(20,sizeof(double));
		  pt = (double *)calloc(20,sizeof(double));
		  eta = (double *)calloc(20,sizeof(double));
#endif
		  
					 tref = 459.6;
					 g0 = g0d = 32.2 ;
					 gama = 1.4 ;
		  for(i=0;i<=19;++i)
		  {
					 trat[i]=1.0;
					 tt[i]=518.6;
					 prat[i]=1.0;
					 pt[i]=14.7;
					 eta[i]=1.0;
		  }

		  tt[4] = tt4 = tt4d = 2500. ;
					 tt[7] = tt7 = tt7d = 2500. ;
					 prat[3] = p3p2d = 8.0 ;
					 prat[13] = p3fp2d = 2.0 ;
					 byprat = 1.0 ;
					 abflag = 0 ;
					 
					 fhvd = fhv = 18600. ;
					 a2 = acore = 2.0 ;
					 acap = .9*a2 ;
					 a8rat = .35 ;
					 a8 = .7 ;
					 a8d = .40 ;
					 arsched = 0 ;
					 afan = 2.0 ;
					 a4 = .418 ;
					 
					 u0min  = 0.0 ;   u0max = 1500.;
					 altmin = 0.0 ;   altmax = 60000. ;
					 thrmin = 30;     thrmax = 100 ;
					 etmin  = .5;     etmax  = 1.0 ;
					 cprmin = 1.0;   cprmax = 50.0 ;
					 bypmin = 0.0;   bypmax = 10.0 ;
					 fprmin = 1.0;   fprmax = 2.0 ;
					 t4min = 1000.0;   t4max = 3200.0 ;
					 t7min = 1000.0;   t7max = 4000.0 ;
					 a8max = 0.4 ;
					 
					 pmax = 20.0;  tmin = -100.0 + tref;  tmax = 100.0 + tref ;
					 
					 weight = 1000. ;
					 dfan = 293.02 ;
		  dcomp = 293.02 ;
					 dburner  = 515.2 ;
		  dturbin = 515.2 ;
					 dnozl = 515.2 ;
}

/* Utility to have mach speed, atmospheric pressure and temperature */
void deduceInputs()
{
		  Rgas = 1718. ;                /* ft2/sec2 R */
					 
					 alt = altd ;
					 if (alt < 36152. ) {
								ts0 = 518.6 - 3.56 * alt / 1000. ;
										  ps0 = 2116. * fpow(ts0/518.6, 5.256) ;
					 }
		  if (alt >= 36152. && alt <= 82345.) {   // Stratosphere
					 ts0 = 389.98 ;
								ps0 = 2116. * .2236 *
								expo((36000.-alt)/(53.35*389.98)) ;
		  }
		  if (alt >= 82345.) {
					 ts0 = 389.98 + 1.645 * (alt-82345)/1000. ;
								ps0 = 2116. *.02456 * fpow(ts0/389.98,-11.388) ;
		  }
		  
					 a0 = sqroot(gama*Rgas*ts0) ;             // speed of sound ft/sec
		  
					 u0 = u0d *5280./3600. ;               // airspeed ft/sec
		  fsmach = u0/a0 ;
					 q0 = gama / 2.0*fsmach*fsmach*ps0 ;
					 
					 if (u0 > .0001) rho0 = q0 /(u0*u0) ;
					 else rho0 = 1.0 ;
								
										  tt[0] = ts0*(1.0 + .5 * (gama -1.0) * fsmach * fsmach) ;
										  pt[0] = ps0 * fpow(tt[0]/ts0,gama/(gama-1.0)) ;
										  ps0 = ps0 / 144. ;
										  pt[0] = pt[0] / 144. ;
										  cpair = getCp(tt[0]);              //BTU/lbm R
		  tsout = ts0-459.6 ;
					 psout = ps0 ;
}

/* Utility to have Thermodynamic parameters */
void getThermo()
{

		  double m5;
		  double delhc,delhht,delhf,delhlt;
		  double deltc,deltht,deltf,deltlt;

#ifdef _DYNAMIC
		  gam = (double *)calloc(20,sizeof(double));
		  cp = (double *)calloc(20,sizeof(double));
#endif

		  //  inlet recovery
		  if (fsmach > 1.0 )   // supersonic
		  {
					 prat[2] = 1.0 - .075*fpow(fsmach - 1.0, 1.35) ;
		  }
		  else {
					 prat[2] = 1.0 ;
		  }
		  eta[2] = prat[2] ;

		  //protection for overwriting input
		  if (eta[3] < .5) eta[3] = .5 ;
		  if (eta[5] < .5) eta[5] = .5 ;
		  trat[7] = 1.0 ;
		  prat[7] = 1.0 ;
		  tt[2] = tt[1] = tt[0];
		  pt[1] = pt[0] ;
		  gam[2] = getGama(tt[2]) ;
		  cp[2]  = getCp(tt[2]);
		  pt[2] = pt[1] * prat[2] ;

		  // design - p3p2 specified - tt4 specified
		  if (engine <= 2) //turbojet
		  {
					 prat[3] = p3p2d ;                      // core compressor
					 if (prat[3] < .5) prat[3] = .5 ;

					 delhc = (cp[2]*tt[2]/eta[3])*(fpow(prat[3],(gam[2]-1.0)/gam[2])-1.0) ; //0.25
					 deltc = delhc / cp[2] ;
					 pt[3] = pt[2] * prat[3] ;
					 tt[3] = tt[2] + deltc ;
					 trat[3] = tt[3]/tt[2] ;
					 gam[3] = getGama(tt[3]) ;
					 cp[3]  = getCp(tt[3]);
					 tt[4] = tt4 * throtl/100.0 ;
					 gam[4] = getGama(tt[4]) ;
					 cp[4]  = getCp(tt[4]);
					 trat[4] = tt[4] / tt[3] ;
					 pt[4] = pt[3] * prat[4] ;
					 delhht = delhc ;
					 deltht = delhht / cp[4] ;
					 tt[5] = tt[4] - deltht ;
					 gam[5] = getGama(tt[5]) ;
					 cp[5]  = getCp(tt[5]);
					 trat[5] = tt[5]/tt[4] ;
					 prat[5] = fpow((1-delhht/cp[4]/tt[4]/eta[5]),(gam[4]/(gam[4]-1.0)));
					 pt[5] = pt[4] * prat[5] ;

					 // fan conditions
					 prat[13] = 1.0 ;
					 trat[13] = 1.0 ;
					 tt[13]   = tt[2] ;
					 pt[13]   = pt[2] ;
					 gam[13]  = gam[2] ;
					 cp[13]   = cp[2] ;
					 prat[15] = 1.0 ;
					 pt[15]   = pt[5] ;
					 trat[15] = 1.0 ;
					 tt[15]   = tt[5] ;
					 gam[15]  = gam[5] ;
					 cp[15]   = cp[5] ;
		  }

		  if(engine == 3)    //turbofan
		  {
					 prat[13] = p3fp2d ;
					 if (prat[13] < .5) prat[13] = .5 ;

					 delhf = (cp[2]*tt[2]/eta[13])*(fpow(prat[13],(gam[2]-1.0)/gam[2])-1.0) ;
					 deltf = delhf / cp[2] ;
					 tt[13] = tt[2] + deltf ;
					 pt[13] = pt[2] * prat[13] ;
					 trat[13] = tt[13]/tt[2] ;
					 gam[13] = getGama(tt[13]) ;
					 cp[13]  = getCp(tt[13]);
					 prat[3] = p3p2d ;                      // core compressor
					 if (prat[3] < .5) prat[3] = .5 ;

					 delhc = (cp[13]*tt[13]/eta[3])*(fpow(prat[3],(gam[13]-1.0)/gam[13])-1.0) ;
					 deltc = delhc / cp[13] ;
					 tt[3] = tt[13] + deltc ;
					 pt[3] = pt[13] * prat[3] ;
					 trat[3] = tt[3]/tt[13] ;
					 gam[3] = getGama(tt[3]) ;
					 cp[3]  = getCp(tt[3]);
					 tt[4] = tt4 * throtl/100.0 ;
					 pt[4] = pt[3] * prat[4] ;
					 gam[4] = getGama(tt[4]) ;
					 cp[4]  = getCp(tt[4]);
					 trat[4] = tt[4]/tt[3] ;
					 delhht = delhc ;
					 deltht = delhht / cp[4] ;
					 tt[5] = tt[4] - deltht ;
					 gam[5] = getGama(tt[5]) ;
					 cp[5]  = getCp(tt[5]);
					 trat[5] = tt[5]/tt[4] ;
					 prat[5] = fpow((1.0-delhht/cp[4]/tt[4]/eta[5]),(gam[4]/(gam[4]-1.0))) ;
					 pt[5] = pt[4] * prat[5] ;
					 delhlt = (1.0 + byprat) * delhf ;
					 deltlt = delhlt / cp[5] ;
					 tt[15] = tt[5] - deltlt ;
					 gam[15] = getGama(tt[15]) ;
					 cp[15]  = getCp(tt[15]);
					 trat[15] = tt[15]/tt[5] ;
					 prat[15] = fpow((1.0-delhlt/cp[5]/tt[5]/eta[5]),(gam[5]/(gam[5]-1.0))) ;
					 pt[15] = pt[5] * prat[15] ;
		  }

		  tt[7] = tt7;

		  prat[6] = 1.0;
		  pt[6] = pt[15];
		  trat[6] = 1.0 ;
		  tt[6] = tt[15] ;
		  gam[6] = getGama(tt[6]) ;
		  cp[6]  = getCp(tt[6]);

		  if (abflag > 0)   // afterburner
		  {
					 trat[7] = tt[7] / tt[6] ;
					 m5 = getMach(0,getAir(1.0,gam[5])*a4/acore,gam[5]) ;
					 prat[7] = getRayleighLoss(m5,trat[7],tt[6]) ;
		  }
		  tt[7] = tt[6] * trat[7] ;
		  pt[7] = pt[6] * prat[7] ;
		  gam[7] = getGama(tt[7]) ;
		  cp[7]  = getCp(tt[7]);

		  // engine press ratio EPReair
		  epr = prat[7]*prat[15]*prat[5]*prat[4]*prat[3]*prat[13];
		  // engine temp ratio ETR
		  etr = trat[7]*trat[15]*trat[5]*trat[4]*trat[3]*trat[13];
}

/* Utility to determine engine performance */
void calcPerf()
{
		  double fac1,game,cpe,cp3,rg,rg1 ;

		  rg1 = 53.3 ;
		  rg = cpair * (gama-1.0)/gama ;
		  cp3 = getCp(tt[3]);                  //BTU/lbm R
		  g0 = 32.2 ;
		  ues = 0.0 ;
		  game = getGama(tt[5]) ;
		  fac1 = (game - 1.0)/game ;
		  cpe = getCp(tt[5]) ;
		  if (eta[7] < .8) eta[7] = .8 ;    // protection during overwriting
		  if (eta[4] < .8) eta[4] = .8 ;

		  //  specific net thrust  - thrust / (g0*airflow) -   lbf/lbm/sec

		  // turbine engine core

		  // airflow determined at choked nozzle exit
		  pt[8] = epr*prat[2]*pt[0] ;
		  eair = getAir(1.0,game) * 144.*a8 * pt[8]/14.7/sqroot(etr*tt[0]/518.) ;
		  m2 = getMach(0,eair*sqroot(tt[0]/518.)/(prat[2]*pt[0]/14.7*acore*144.),gama) ;
		  npr = pt[8]/ps0;
		  uexit = sqroot(2.0*Rgas/fac1*etr*tt[0]*eta[7]*(1.0-fpow(1.0/npr,fac1)));

		  if (npr <= 1.893) pexit = ps0 ;
		  else pexit = .52828 * pt[8] ;

		  fgros = (uexit + (pexit - ps0) * 144. *  a8 /eair) / g0 ;

		  // turbo fan -- added terms for fan flow
		  if (engine == 3)
		  {
					 fac1 = (gama - 1.0)/gama ;
					 snpr = pt[13]/ps0;
					 ues = sqroot(2.0*Rgas/fac1*tt[13]*eta[7]*(1.0-fpow(1.0/snpr,fac1)));
					 m2 = getMach(0,eair*(1.0+byprat)*sqroot(tt[0]/518.)/
										  (prat[2]*pt[0]/14.7*afan*144.),gama) ;

					 if (snpr <= 1.893) pfexit = ps0 ;
					 else pfexit = .52828 * pt[13] ;
					 fgros = fgros + (byprat*ues+(pfexit - ps0)*144.*byprat*acore/eair)/g0 ;
		  }

		  // ram drag
		  dram = u0 / g0 ;
		  if (engine == 3) dram = dram + u0 * byprat / g0 ;

		  // mass flow ratio
		  if (fsmach > .01) mfr = getAir(m2,gama)*prat[2]/getAir(fsmach,gama) ;
		  else mfr = 5.;

		  // net thrust
		  fnet = fgros - dram;

		  // thrusts in pounds
		  fnlb = fnet * eair ;
		  fglb = fgros * eair ;
		  drlb = dram * eair ;

		  //fuel-air ratio and sfc
		  fa = (trat[4]-1.0)/(eta[4]*fhv/(cp3*tt[3])-trat[4]) +
					 (trat[7]-1.0)/(fhv/(cpe*tt[15])-trat[7]) ;
		  if ( fnet > 0.0)  {
					 sfc = 3600. * fa /fnet ;
					 if(sfc<0) sfc=0.0;
					 flflo = sfc*fnlb ;
					 isp = (fnlb/flflo) * 3600. ;
		  }
		  else {
					 fnlb = 0.0 ;
					 flflo = 0.0 ;
					 sfc = 0.0 ;
					 isp = 0.0 ;
		  }

		  // weight  calculation
		  if (engine == 1) {
					 weight = .12754 * sqroot(acore*acore*acore) *
								(dcomp * lcomp + dburner * lburn + dturbin * lturb + dnozl * lnoz);
		  }
		  if (engine == 2) {
					 weight = .08533 * sqroot(acore*acore*acore) *
								(dcomp * lcomp + dburner * lburn + dturbin * lturb + dnozl * lnoz);
		  }
		  if (engine == 3) {
					 weight = .08955 * acore * ((1.0 + byprat) * dfan * 4.0 + dcomp * (ncomp -3) +
										  dburner + dturbin * nturb + dburner * 2.0) * sqroot(acore / 6.965) ;
		  }
}

/* Utility to determine geometric variables */
void getGeo ()
{
		  if (afan < acore) afan = acore ;

		  // limits compressor face
		  a8max = .75 * sqroot(etr) / epr ;

		  // mach number  to < .5
		  if (a8max > 1.0) a8max = 1.0 ;

		  if (a8rat > a8max) a8rat = a8max ;

		  // dumb down limit - a8 schedule
		  if (arsched == 0) a8rat = a8max ;

		  a8 = a8rat * acore ;
		  a8d = a8 * prat[7] / sqroot(trat[7]) ;

		  // assumes choked a8 and a4
		  a4 = a8*prat[5]*prat[15]*prat[7]/sqroot(trat[7]*trat[5]*trat[15]);
		  a4p = a8*prat[15]*prat[7]/sqroot(trat[7]*trat[15]);
		  acap = .9 * a2 ;

		  //size parameters for weight
		  ncomp = (int) (1.0 + p3p2d / 1.5) ;
					 if (ncomp > 15) ncomp = 15 ;
								
										  sblade = .02;
										  hblade = sqroot(2.0/3.1415926);
										  tblade = .2*hblade;
										  
										  xcomp = ncomp*(tblade+sblade) ;
										  ncompd = ncomp ;
										  if (engine == 3) {                    // fan geometry
													 ncompd = ncomp + 3 ;
																xcomp = ncompd*(tblade+sblade) ;
										  }
		  
					 lcomp = xcomp ;
					 lburn = hblade ;
					 
					 
					 nturb = 1 + ncomp/4 ;
					 if (engine == 3) nturb = nturb + 1 ;
								
										  lturb = nturb*(tblade+sblade) ;
										  lnoz = lburn ;
										  if (engine == 2) lnoz = 3.0 * lburn ;

}

// *********** Math utilities ***********
double sqroot(double number)
{
		  double x0, x, prec=1;
		  if(number < 0)
		  {
#ifdef _PRINT
					 printf("error sqroot\n");
#endif
					 return(0);
		  }

		  x=(1+number)/2;
		  while((prec>0.0001) || (prec<-0.0001))
		  {
					 x0=x;
					 x=0.5*(x0+number/x0);
					 prec=(x-x0)/x0;
		  }
		  return(x);
}

double fabs(double x)
{
		  if (x < 0) return -x;
		  else return x;
}

double log(double x)
{
		  double number = 0;
		  double coeff = -1;
		  int i = 1;
		  
		  if (x<=0)
		  {
#ifdef _PRINT
					 printf("error log undefined\n");
#endif
					 return 0;
		  }

		  if (x==1)
					 return 0;

		  if (x>1)
					 return -log(1/x);

		  // 0<x<1
		  // log : x - x^2/2 + x^3/3 - x^4/4...
		  while(fabs(coeff)>PRECISION)
		  {
					 coeff *= 1-x;
					 number += coeff/i;
					 i++;
		  }
		  return number;
}

double expo(double x)
{
		  double number = 1;
		  double coeff = 1;
		  int i = 1;
		  // if x > log(DBL_MAX)
		  if (x>709.782712893384)
					 return expo(709.78); // Infinite value

		  // exp : x^0/0! + x^1/1! + x^2/2! + x^3/3!
		  while(fabs(coeff)>PRECISION)
		  {
					 coeff *= x/i;
					 number += coeff;
					 i++;
		  }

		  return number;
}

double fpow(double x, double y)
{
		  int partieEntiere = y;

		  // If x<0 and y not integer
		  if (x<0 && (double)partieEntiere!=y)
		  {
#ifdef _PRINT
					 printf("error power undefined\n");
#endif

					 return 0;
		  }

		  // If x<0 and y integer
		  else if (x<0)
					 return power(x, partieEntiere);

		  // now x>0
		  // factorize y into integer and decimal parts
		  // For example : 12.345^67.890123 = (12.345^67) * (12.345^0.890123)
		  // integer part : pow(double, int) and the decimal par : x^y = exp(y*ln(x))
		  return power(x, partieEntiere) * expo((y-partieEntiere)*log(x));
}

double power(double x, int y)
{
		  double number = 1;
		  int i;
		  // x^(-y) = 1/(x^y)
		  if (y<0)
					 return 1/(power(x,-y));

		  for (i=0; i<y; i++)
					 number *= x;

		  return number;
}
