# Lazy
*True lazy (late-binding) editable SALTable ⎕FIXable definition*

This user command allows defintion of arrays and tacit functions/operators in a lazy manner, which means that their definitions are not evaluated until runtime. This allows SALTing, ⎕FIXing, and commenting both arrays and tacit functions/operators.                          

## Installation

* Download `Lazy.dyalog` to a location
* From within Dyalog APL issue <code>]Settings cmddir ,*location* -permanent</code>

## Usage
    ]Lazy          ⍝ list all lazy definitions
    ]Lazy fn       ⍝ show lazy definition
    ]Lazy fn←code  ⍝ define lazily

## Examples                                                                                                       
    ]Lazy Avg←Sum÷1⌈≢     ⍝ allowed even though Sum is not defined yet
    ]Lazy Sum←+⌿
    ]Lazy matrix←3 4⍴⍳12  ⍝ formula will be kept rather than executed, so this array is dynamically ⎕IO-dependent
