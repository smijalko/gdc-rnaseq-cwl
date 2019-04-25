  - name: readgroup_meta
    type: record
    fields:
      - name: CN
        type: string?
      - name: DS
        type: string?
      - name: DT
        type: string?
      - name: FO
        type: string?
      - name: ID
        type: string
      - name: KS
        type: string?
      - name: LB
        type: string?
      - name: PI
        type: string? 
      - name: PL
        type: string
      - name: PM
        type: string? 
      - name: PU
        type: string? 
      - name: SM
        type: string

  - name: readgroup_fastq_file
    type: record
    fields:
      - name: forward_fastq
        type: File
      - name: reverse_fastq
        type: File?
      - name: readgroup_meta
        type: readgroup_meta

  - name: readgroup_bam_file
    type: record
    fields:
      - name: bam
        type: File
      - name: readgroup_meta_list
        type:
          type: array
          items: readgroup_meta
 
  - name: readgroup_fastq_uuid
    type: record
    fields:
      - name: forward_fastq_uuid
        type: string
      - name: forward_fastq_file_size
        type: long
      - name: reverse_fastq_uuid
        type: string?
      - name: reverse_fastq_file_size
        type: long?
      - name: readgroup_meta
        type: readgroup_meta

  - name: readgroup_bam_uuid
    type: record
    fields:
      - name: bam_uuid
        type: string
      - name: bam_file_size
        type: long
      - name: readgroup_meta_list
        type:
          type: array
          items: readgroup_meta
