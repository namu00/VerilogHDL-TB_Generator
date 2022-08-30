# 2022 Summer Study  *(June 30th ~ August 31st)*
+ ### Agenda
    >1. Review Python
    >2. Study Verilog
    >3. Make __*Testbench Generator*__ Using __*Python*__  
+ ### Directory Information

    |Directory|Description|  
    |:---:|:--------:|  
    |*Study*|Verilog & Python Study Directory |  
    |*Verilog_Testcase*| Verilog TestSamples |
    |*Wavedrom_Testcase*| Wavedrom json TestSamples |  

# Product Info.
+ ### Final Product
    >__*TB_Gen.py*__ 

+ ### Usage  
```bash
    tbgen.py                [TARGET_MODULE.v] [WAVEDROM.json] or
    tbgen.py -v             [TARGET_MODULE.v] [WAVEDROM.json] or
    tbgen.py --verbose      [TARGET_MODULE.v] [WAVEDROM.json] or
    tbgen.py -p [NUM]       [TARGET_MODULE.v] [WAVEDROM.json] or
    tbgen.py -period [NUM]  [TARGET_MODULE.v] [WAVEDROM.json]
```

>        __PLEASE FOLLOW RULES BELLOW__
> 1. Do not Designate Groups in Wavdrom.  
> 2. Split Input/Output Signals Using "{ }".  
> 3. Please Match the __*Signal Names in JSON*__ With __*module.v*__.    
> 4. Please Keep Argument Sequence.  
      

```json
"Json Example"
["signal":{                          "# Do not designate Groups"
    {"name":"input", "wave":"hlhl"}, "# input list"
    {},                              "# Split"
    {"name":"output", "wave":"lhlh"} "# output list"
  }
]    
```

+ ### Status
    > ~Adding CLK Processing Block~  
    > ~Adding BUS Processing Block~  
    > ~Fixing Verilog Syntax Error~  
    > ~Fixing Timing Error~  
    > ~Fixing Sim Stop Error~  
    >_All Testcase Passed!_  
    > *Ver 1.4.5* Release  
+ ### Version Information
    *Ver 1.0.0*    Initial Release  
    *Ver 1.1.0*    Add Exception Handller    
    *Ver 1.2.0*    Add CLK Processing Block  
    *Ver 1.3.0*    Add BUS Processing Block  
    *Ver 1.3.1*    Patch Syntax Error  
    *Ver 1.4.0*    Add Simulation Stop Time  
    *Ver 1.4.1*    Add Comment  
    *Ver 1.4.2*    Patch Testvector Syntax  
    *Ver 1.4.3*    Patch Minor Errors  
    *Ver 1.4.4*    Patch Timing Error  
    *Ver 1.4.5*    Algorithm Optimization  
    *Ver 1.4.6*    Patch Sim Stop Error  
    *Ver 1.4.7*    Patch Indent Error & Rename Functions
