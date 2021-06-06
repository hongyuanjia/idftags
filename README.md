
<!-- README.md is generated from README.Rmd. Please edit that file -->

# idftags

<!-- badges: start -->
<!-- badges: end -->

The goal of idftags is to create
[ctags](https://github.com/universal-ctags/ctags)-compatible tag file
for [EnergyPlus](https://energyplus.net) IDFs.

## Installation

You can install the released version of idftags from
[GitHub](https://github.com/hongyuanjia/idftags) with:

``` r
# install.packages("remotes")
remotes::install_github("hongyuanjia/idftags")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(idftags)
file <- system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr")
build_idf_tag(file)
#> !_TAG_FILE_FORMAT    2   /
#> !_TAG_FILE_SORTED    1   /
#> !_TAG_PROGRAM_AUTHOR Hongyuan Jia    /hongyuanjia@outlook.com/
#> !_TAG_PROGRAM_NAME   idftags /
#> !_TAG_PROGRAM_VERSION    0.0.1   /
#> Version  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Version,8.8;$/;"  kind:c  line:91
#> Timestep C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Timestep,4;$/;"   kind:c  line:93
#> Building C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Simple One Zone (Wireframe DXF),  !- Name$/;" kind:c  line:95
#> Simple One Zone (Wireframe DXF)  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Simple One Zone (Wireframe DXF),  !- Name$/;" kind:m  line:96
#> HeatBalanceAlgorithm C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^HeatBalanceAlgorithm,ConductionTransferFunction;$/;"  kind:c  line:105
#> SurfaceConvectionAlgorithm:Inside    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SurfaceConvectionAlgorithm:Inside,TARP;$/;"   kind:c  line:107
#> SurfaceConvectionAlgorithm:Outside   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SurfaceConvectionAlgorithm:Outside,DOE-2;$/;" kind:c  line:109
#> SimulationControl    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SimulationControl,$/;"    kind:c  line:111
#> RunPeriod    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^,                        !- Name$/;"  kind:c  line:118
#>  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^,                        !- Name$/;"  kind:m  line:119
#> Site:Location    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N_CO_USA Design_Conditions,  !- Name$/;"  kind:c  line:131
#> Denver Centennial  Golden   N_CO_USA Design_Conditions   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N_CO_USA Design_Conditions,  !- Name$/;"  kind:m  line:132
#> SizingPeriod:DesignDay   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Htg 99% Condns DB,  !- Name$/;" kind:c  line:144
#> Denver Centennial  Golden   N Ann Htg 99% Condns DB  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Htg 99% Condns DB,  !- Name$/;" kind:m  line:145
#> SizingPeriod:DesignDay   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB,  !- Name$/;" kind:c  line:176
#> Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB,  !- Name$/;" kind:m  line:177
#> Material:NoMass  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13LAYER,                !- Name$/;"  kind:c  line:204
#> R13LAYER C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13LAYER,                !- Name$/;"  kind:m  line:205
#> Material:NoMass  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R31LAYER,                !- Name$/;"  kind:c  line:212
#> R31LAYER C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R31LAYER,                !- Name$/;"  kind:m  line:213
#> Material C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^C5 - 4 IN HW CONCRETE,   !- Name$/;"  kind:c  line:220
#> C5 - 4 IN HW CONCRETE    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^C5 - 4 IN HW CONCRETE,   !- Name$/;"  kind:m  line:221
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13WALL,                 !- Name$/;"  kind:c  line:231
#> R13WALL  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13WALL,                 !- Name$/;"  kind:m  line:232
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^FLOOR,                   !- Name$/;"  kind:c  line:235
#> FLOOR    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^FLOOR,                   !- Name$/;"  kind:m  line:236
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ROOF31,                  !- Name$/;"  kind:c  line:239
#> ROOF31   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ROOF31,                  !- Name$/;"  kind:m  line:240
#> Zone C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ZONE ONE,                !- Name$/;"  kind:c  line:243
#> ZONE ONE C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ZONE ONE,                !- Name$/;"  kind:m  line:244
#> ScheduleTypeLimits   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Fraction,                !- Name$/;"  kind:c  line:254
#> Fraction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Fraction,                !- Name$/;"  kind:m  line:255
#> GlobalGeometryRules  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^GlobalGeometryRules,$/;"  kind:c  line:260
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall001,           !- Name$/;"  kind:c  line:265
#> Zn001:Wall001    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall001,           !- Name$/;"  kind:m  line:266
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall002,           !- Name$/;"  kind:c  line:281
#> Zn001:Wall002    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall002,           !- Name$/;"  kind:m  line:282
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall003,           !- Name$/;"  kind:c  line:297
#> Zn001:Wall003    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall003,           !- Name$/;"  kind:m  line:298
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall004,           !- Name$/;"  kind:c  line:313
#> Zn001:Wall004    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall004,           !- Name$/;"  kind:m  line:314
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Flr001,            !- Name$/;"  kind:c  line:329
#> Zn001:Flr001 C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Flr001,            !- Name$/;"  kind:m  line:330
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Roof001,           !- Name$/;"  kind:c  line:345
#> Zn001:Roof001    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Roof001,           !- Name$/;"  kind:m  line:346
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Outdoor Air Drybulb Temperature,hourly;$/;"    kind:c  line:361
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Daylight Saving Time Status,daily;$/;" kind:c  line:363
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Day Type Index,daily;$/;"  kind:c  line:365
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Mean Air Temperature,hourly;$/;"   kind:c  line:367
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Total Internal Latent Gain Energy,hourly;$/;"  kind:c  line:369
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Mean Radiant Temperature,hourly;$/;"   kind:c  line:371
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Air Heat Balance Surface Convection Rate,hourly;$/;"   kind:c  line:373
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Air Heat Balance Air Energy Storage Rate,hourly;$/;"   kind:c  line:375
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Inside Face Temperature,daily;$/;"  kind:c  line:377
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Outside Face Temperature,daily;$/;" kind:c  line:379
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Inside Face Convection Heat Transfer Coefficient,daily;$/;" kind:c  line:381
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Outside Face Convection Heat Transfer Coefficient,daily;$/;"    kind:c  line:383
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Other Equipment Total Heating Energy,monthly;$/;"   kind:c  line:385
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Other Equipment Total Heating Energy,monthly;$/;"  kind:c  line:387
#> Output:VariableDictionary    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:VariableDictionary,IDF;$/;"    kind:c  line:389
#> Output:Surfaces:Drawing  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Surfaces:Drawing,dxf:wireframe;$/;"    kind:c  line:391
#> Output:Constructions C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Constructions,Constructions;$/;"   kind:c  line:393
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,ExteriorLights:Electricity,hourly;$/;" kind:c  line:395
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,EnergyTransfer:Building,hourly;$/;"    kind:c  line:397
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,EnergyTransfer:Facility,hourly;$/;"    kind:c  line:399
#> OutputControl:Table:Style    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^OutputControl:Table:Style,$/;"    kind:c  line:401
#> Output:Table:SummaryReports  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Table:SummaryReports,$/;"  kind:c  line:404
#> Exterior:Lights  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ExtLights,               !- Name$/;"  kind:c  line:407
#> ExtLights    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ExtLights,               !- Name$/;"  kind:m  line:408
#> ScheduleTypeLimits   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^On/Off,                  !- Name$/;"  kind:c  line:414
#> On/Off   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^On/Off,                  !- Name$/;"  kind:m  line:415
#> OtherEquipment   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352a,               !- Name$/;"  kind:c  line:420
#> Test 352a    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352a,               !- Name$/;"  kind:m  line:421
#> OtherEquipment   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352 minus,          !- Name$/;"  kind:c  line:433
#> Test 352 minus   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352 minus,          !- Name$/;"  kind:m  line:434
#> Schedule:Constant    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Schedule:Constant,AlwaysOn,On/Off,1.0;$/;"    kind:c  line:446
#> AlwaysOn,On/Off,1.0; C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Schedule:Constant,AlwaysOn,On/Off,1.0;$/;"    kind:m  line:446
```

## Use together with Vim
