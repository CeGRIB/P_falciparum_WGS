# P_falciparum_WGS
# ANALYSIS PIPELINE (Using GATK 4.1.4)

## Quality control (using FastQC)
We used this to get the detailed report of the sequence reads: \
  >>a. Quality Assessment\
  >>b. Detection of Adapter Sequences\
  >>c. Base Composition Analysis\
  >>d. Sequence Duplication Levels\
  >>e. GC Content Distribution\
  >>f. Overall Data Integrity\
The output includes visual plots that make it easier to interpret the quality metrics at a glance.


## Trimming (using Trimmomatic)
  a. Removing Low-Quality Bases\
  b. Eliminating Adapter Sequences\
  c. Reducing Noise\
Trimming can help reduce background noise and improve the overall quality of the data, leading to more accurate results in analyses such as variant calling and assembly.

## Alignment of reads to the _P. f_ 3D7 version 3 reference genome 3D7 version 3 (using bwa)
>> Comparative analysis for identification of variants

## Deduplication (using MarkDuplicatesSpark function)
Removing duplicate:
>> Improves data integrity
>> Improves performance
>> Simplifies data management
>> Storage efficiency, and
>> Accurate Analysis

