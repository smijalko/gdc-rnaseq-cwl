#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: SchemaDefRequirement
    types:
      - $import: readgroup.cwl
  - class: InlineJavascriptRequirement

class: ExpressionTool

inputs:
  forward_fastq:
    type: File

  reverse_fastq:
    type: File?

  readgroup_meta:
    type: readgroup.cwl#readgroup_meta

outputs:
  output:
    type: readgroup.cwl#readgroup_fastq_file

expression: |
  ${
    if( inputs.reverse_fastq ) {
        var output = { "forward_fastq": inputs.forward_fastq,
                       "reverse_fastq": inputs.reverse_fastq,
                       "readgroup_meta": inputs.readgroup_meta
                       };
    }
    else {
        var output = { "forward_fastq": inputs.forward_fastq,
                       "readgroup_meta": inputs.readgroup_meta
                       };
    }
    return {'output': output}
  }
