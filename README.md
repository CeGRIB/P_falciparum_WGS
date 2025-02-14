# P_falciparum_WGS
# ANALYSIS PIPELINE

## Quality control (Using FastQC)
We used this to get the detailed report of the sequence reads: \
  >a. Quality Assessment\
  b. Detection of Adapter Sequences\
  c. Base Composition Analysis\
  d. Sequence Duplication Levels\
  e. GC Content Distribution\
  f. Overall Data Integrity\
The output includes visual plots that make it easier to interpret the quality metrics at a glance.


## Trimming (Using Trimmomatic)
  a. Removing Low-Quality Bases
  b. Eliminating Adapter Sequences
  c. Reducing Noise:
Trimming can help reduce background noise and improve the overall quality of the data, leading to more accurate results in analyses such as variant calling and assembly.
