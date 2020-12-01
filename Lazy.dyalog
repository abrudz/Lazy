:Namespace Lazy ⍝ V 1.01
⍝ True lazy (late-binding) editable SALTable ⎕FIXable definition
⍝ Allows defintion of arrays and tacit functions
⍝ 2018 06 07 Adam: Initial definition

    ⎕IO←1 ⋄ ⎕ML←1

    ∇ r←List
      (r←⎕NS ⍬).(Name Group Desc Parse)←'Lazy' 'Tools' 'Lazily evaluated (late-binding) definition' ''
    ∇

    ∇ r←Run(cmd input);T;nl;∆NR;id;rx;a;nr
      T←##.THIS
      ∆NR←']',cmd,' ',∘⊃1↓T.⎕NR
      id←a/⍨¯1≠⎕NC⍪a←⎕UCS⍳255+1113856×{6::80=⎕DR'' ⋄ ⎕SE.SALTUtils.UNICODE}⍬
      ⍝      ∇   name                  ← name ⋄  [1]  name ←def ⋄ [2] SALT tag? ⋄ ∇
      rx←'^ *∇ *([',id,'][',id,'\d]*) *← *\1 *\r\[1\] *\1 *←.*\r(\[2\] *⍝∇.*\r)? *∇ *$'
      LooksRight←0∊rx ⎕S 0⍠'Mode' 'D'∘T.⎕VR
      :If ' '∧.=input ⍝ show all defs
          nl←T.⎕NL ¯3.1
          nl/⍨←1 0 0∘≡¨⊣/T.⎕AT nl
          nl/⍨←LooksRight¨nl
          r←↑∆NR¨nl
      :Else
          :Select T.⎕NC⊂,input
          :Case 0 ⍝ open editor
              r←'* Undefined!'
          :CaseList 3.1 ⍝ show definition
              :If LooksRight input
                  r←∆NR input
              :Else
                  r←'* Not a lazy definition!'
              :EndIf
          :Case ¯1 ⍝ define
              nr←,⊂(⊃,'←',⊃)'[^←]+'⎕S'&'⊢input
              nr,←⊂{6::⍵ ⋄ (⍳∘' '↓⊢)##.##.msg}input
              :If ∨/input⍷⍨T.⎕FX nr ⍝ success
                  r←⍬⊤⍬
              :Else ⍝ failure
                  r←'* Invalid definition!'
              :EndIf
          :Else ⍝ fail
              r←'* Already not a lazy definition!'
          :EndSelect
      :EndIf
    ∇

    ∇ r←level Help cmd;c
      c←'    ]',cmd,' '
      r←,⊂'Creates and reports lazily evaluated (late-binding) definitions.'
      r,←⊂'This allows SALTing, ⎕FIXing, and commenting both arrays and tacit functions. Note that operators are not supported.'
      r,←⊂c,'         ⍝ list all lazy definitions'
      r,←⊂c,'fn       ⍝ show lazy definition'
      r,←⊂c,'fn←code  ⍝ define lazily'
      :If ×level
          r,←'' 'Examples:'
          r,←⊂c,'Avg←Sum÷1⌈≢     ⍝ allowed even though Sum is not defined yet'
          r,←⊂c,'Sum←+⌿'
          r,←⊂c,'matrix←3 4⍴⍳12  ⍝ formula will be kept rather than executed, so this array is dynamically ⎕IO-dependent'
      :EndIf
    ∇

:EndNamespace
