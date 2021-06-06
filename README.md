
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
#> Version  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Version,8.8;$/;"  kind:v  line:91
#> Timestep C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Timestep,4;$/;"   kind:v  line:93
#> Building C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Simple One Zone (Wireframe DXF),  !- Name$/;" kind:v  line:95
#> Simple One Zone (Wireframe DXF)  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Simple One Zone (Wireframe DXF),  !- Name$/;" kind:v  line:96
#> HeatBalanceAlgorithm C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^HeatBalanceAlgorithm,ConductionTransferFunction;$/;"  kind:v  line:105
#> SurfaceConvectionAlgorithm:Inside    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SurfaceConvectionAlgorithm:Inside,TARP;$/;"   kind:v  line:107
#> SurfaceConvectionAlgorithm:Outside   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SurfaceConvectionAlgorithm:Outside,DOE-2;$/;" kind:v  line:109
#> SimulationControl    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^SimulationControl,$/;"    kind:v  line:111
#> RunPeriod    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^,                        !- Name$/;"  kind:v  line:118
#>  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^,                        !- Name$/;"  kind:v  line:119
#> Site:Location    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N_CO_USA Design_Conditions,  !- Name$/;"  kind:v  line:131
#> Denver Centennial  Golden   N_CO_USA Design_Conditions   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N_CO_USA Design_Conditions,  !- Name$/;"  kind:v  line:132
#> SizingPeriod:DesignDay   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Htg 99% Condns DB,  !- Name$/;" kind:v  line:144
#> Denver Centennial  Golden   N Ann Htg 99% Condns DB  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Htg 99% Condns DB,  !- Name$/;" kind:v  line:145
#> SizingPeriod:DesignDay   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB,  !- Name$/;" kind:v  line:176
#> Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Denver Centennial  Golden   N Ann Clg 1% Condns DB=>MWB,  !- Name$/;" kind:v  line:177
#> Material:NoMass  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13LAYER,                !- Name$/;"  kind:v  line:204
#> R13LAYER C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13LAYER,                !- Name$/;"  kind:v  line:205
#> Material:NoMass  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R31LAYER,                !- Name$/;"  kind:v  line:212
#> R31LAYER C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R31LAYER,                !- Name$/;"  kind:v  line:213
#> Material C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^C5 - 4 IN HW CONCRETE,   !- Name$/;"  kind:v  line:220
#> C5 - 4 IN HW CONCRETE    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^C5 - 4 IN HW CONCRETE,   !- Name$/;"  kind:v  line:221
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13WALL,                 !- Name$/;"  kind:v  line:231
#> R13WALL  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^R13WALL,                 !- Name$/;"  kind:v  line:232
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^FLOOR,                   !- Name$/;"  kind:v  line:235
#> FLOOR    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^FLOOR,                   !- Name$/;"  kind:v  line:236
#> Construction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ROOF31,                  !- Name$/;"  kind:v  line:239
#> ROOF31   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ROOF31,                  !- Name$/;"  kind:v  line:240
#> Zone C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ZONE ONE,                !- Name$/;"  kind:v  line:243
#> ZONE ONE C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ZONE ONE,                !- Name$/;"  kind:v  line:244
#> ScheduleTypeLimits   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Fraction,                !- Name$/;"  kind:v  line:254
#> Fraction C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Fraction,                !- Name$/;"  kind:v  line:255
#> GlobalGeometryRules  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^GlobalGeometryRules,$/;"  kind:v  line:260
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall001,           !- Name$/;"  kind:v  line:265
#> Zn001:Wall001    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall001,           !- Name$/;"  kind:v  line:266
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall002,           !- Name$/;"  kind:v  line:281
#> Zn001:Wall002    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall002,           !- Name$/;"  kind:v  line:282
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall003,           !- Name$/;"  kind:v  line:297
#> Zn001:Wall003    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall003,           !- Name$/;"  kind:v  line:298
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall004,           !- Name$/;"  kind:v  line:313
#> Zn001:Wall004    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Wall004,           !- Name$/;"  kind:v  line:314
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Flr001,            !- Name$/;"  kind:v  line:329
#> Zn001:Flr001 C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Flr001,            !- Name$/;"  kind:v  line:330
#> BuildingSurface:Detailed C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Roof001,           !- Name$/;"  kind:v  line:345
#> Zn001:Roof001    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Zn001:Roof001,           !- Name$/;"  kind:v  line:346
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Outdoor Air Drybulb Temperature,hourly;$/;"    kind:v  line:361
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Daylight Saving Time Status,daily;$/;" kind:v  line:363
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Site Day Type Index,daily;$/;"  kind:v  line:365
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Mean Air Temperature,hourly;$/;"   kind:v  line:367
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Total Internal Latent Gain Energy,hourly;$/;"  kind:v  line:369
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Mean Radiant Temperature,hourly;$/;"   kind:v  line:371
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Air Heat Balance Surface Convection Rate,hourly;$/;"   kind:v  line:373
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Air Heat Balance Air Energy Storage Rate,hourly;$/;"   kind:v  line:375
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Inside Face Temperature,daily;$/;"  kind:v  line:377
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Outside Face Temperature,daily;$/;" kind:v  line:379
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Inside Face Convection Heat Transfer Coefficient,daily;$/;" kind:v  line:381
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Surface Outside Face Convection Heat Transfer Coefficient,daily;$/;"    kind:v  line:383
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Other Equipment Total Heating Energy,monthly;$/;"   kind:v  line:385
#> Output:Variable  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Variable,*,Zone Other Equipment Total Heating Energy,monthly;$/;"  kind:v  line:387
#> Output:VariableDictionary    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:VariableDictionary,IDF;$/;"    kind:v  line:389
#> Output:Surfaces:Drawing  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Surfaces:Drawing,dxf:wireframe;$/;"    kind:v  line:391
#> Output:Constructions C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Constructions,Constructions;$/;"   kind:v  line:393
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,ExteriorLights:Electricity,hourly;$/;" kind:v  line:395
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,EnergyTransfer:Building,hourly;$/;"    kind:v  line:397
#> Output:Meter:MeterFileOnly   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Meter:MeterFileOnly,EnergyTransfer:Facility,hourly;$/;"    kind:v  line:399
#> OutputControl:Table:Style    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^OutputControl:Table:Style,$/;"    kind:v  line:401
#> Output:Table:SummaryReports  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Output:Table:SummaryReports,$/;"  kind:v  line:404
#> Exterior:Lights  C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ExtLights,               !- Name$/;"  kind:v  line:407
#> ExtLights    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^ExtLights,               !- Name$/;"  kind:v  line:408
#> ScheduleTypeLimits   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^On/Off,                  !- Name$/;"  kind:v  line:414
#> On/Off   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^On/Off,                  !- Name$/;"  kind:v  line:415
#> OtherEquipment   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352a,               !- Name$/;"  kind:v  line:420
#> Test 352a    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352a,               !- Name$/;"  kind:v  line:421
#> OtherEquipment   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352 minus,          !- Name$/;"  kind:v  line:433
#> Test 352 minus   C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Test 352 minus,          !- Name$/;"  kind:v  line:434
#> Schedule:Constant    C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Schedule:Constant,AlwaysOn,On/Off,1.0;$/;"    kind:v  line:446
#> AlwaysOn,On/Off,1.0; C:\Users\hongy\R\win-library\4.1\eplusr\extdata\1ZoneUncontrolled.idf   /^Schedule:Constant,AlwaysOn,On/Off,1.0;$/;"    kind:v  line:446
```

## Use together with Vim

-   Install
    [vista.vim](https://raw.githubusercontent.com/liuchengxu/vista.vim)
    using [vim-plug](https://github.com/junegunn/vim-plug)

``` vim
Plug 'liuchengxu/vista.vim'
```

-   Add below to your vimrc

``` vim
let g:vista_ctags_cmd = {
    \ 'idf': 'Rscript -e "idftags::build_idf_tag(cmd = TRUE)"'
    \ }
```
