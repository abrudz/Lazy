# Lazily evaluated (late-binding) definition for Dyalog APL
*True lazy (late-binding) editable, SALTable, Linkable, `⎕FIX`able definition*

This user command allows defintion of arrays and tacit functions in a lazy manner, which means that their definitions are not evaluated until runtime. This allows editing, SALTing, Linking, `⎕FIX`ing, and commenting both arrays and tacit functions, and allows tacit top-down programming.

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
