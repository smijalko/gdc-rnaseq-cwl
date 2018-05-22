#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 1
    coresMax: 1
    ramMin: 1000
    ramMax: 1000
    tmpdirMin: 1
    tmpdirMax: 1
    outdirMin: 1
    outdirMax: 1

class: CommandLineTool

inputs:
  input: 
    type:
      type: array
      items: File 
      inputBinding:
        prefix: -i 

  job_uuid: 
    type: string
    inputBinding:
      prefix: -j

  bam: 
    type: File 
    inputBinding:
      prefix: --bam

outputs:
  db: 
    type: File
    outputBinding:
      glob: $(inputs.job_uuid + '.rnaseq_metrics.db')

baseCommand:
  - /home/ubuntu/Programming/cri-bio-376-gdc/tool_dev/gdc-qc-tool/venv/bin/python
  - /home/ubuntu/Programming/cri-bio-376-gdc/tool_dev/gdc-qc-tool/quick.py 
  - readgroupmodule

arguments:
  - valueFrom: $(inputs.job_uuid + '.rnaseq_metrics.db')
    position: 0
    prefix: --output_sqlite
