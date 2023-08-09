cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  aneurysm---primary:
    run: aneurysm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  abdominal-aortic-aneurysm-replace---primary:
    run: abdominal-aortic-aneurysm-replace---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: aneurysm---primary/output
  abdominal-aortic-aneurysm-graft---primary:
    run: abdominal-aortic-aneurysm-graft---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-replace---primary/output
  abdominal-aortic-aneurysm-emergency---primary:
    run: abdominal-aortic-aneurysm-emergency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-graft---primary/output
  abdominal-aortic-aneurysm-rupture---primary:
    run: abdominal-aortic-aneurysm-rupture---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-emergency---primary/output
  abdominal-aortic-aneurysm---primary:
    run: abdominal-aortic-aneurysm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-rupture---primary/output
  abdominal-aortic-aneurysm-repair---primary:
    run: abdominal-aortic-aneurysm-repair---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm---primary/output
  abdominal-aortic-aneurysm-rupture---secondary:
    run: abdominal-aortic-aneurysm-rupture---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-repair---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-rupture---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
