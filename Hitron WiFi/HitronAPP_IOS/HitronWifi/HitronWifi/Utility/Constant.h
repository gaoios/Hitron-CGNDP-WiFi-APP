//
//  Constant.h
//  linju
//
//  Created by Nathan.Li on 9/17/15.
//  Copyright (c) 2015 Movit. All rights reserved.
//



//************************************* PROD Server ***************************************************
#ifdef PROD

//************************************* UAT Server ***************************************************
#elif UAT

//************************************* QA Server ***************************************************
#elif QA

//**************************************** DEV Server ************************************************
#else
#define APP_SCHEME @"com.movit-tech.HitronWifi"

#define UPLOADURL @""
#define BASEURL  @"http://101.200.157.251:8081"

#endif