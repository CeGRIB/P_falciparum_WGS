# **Plasmodium falciparum** WGS
## ANALYSIS PIPELINE (Using GATK 4.4.0.0)

### Quality control (using FastQC)
We used this to get the detailed report of the sequence reads
  >>a. Quality Assessment\
  >>b. Detection of Adapter Sequences\
  >>c. Base Composition Analysis\
  >>d. Sequence Duplication Levels\
  >>e. GC Content Distribution\
  >>f. Overall Data Integrity\
The output includes visual plots that make it easier to interpret the quality metrics at a glance.


### Trimming (using Trimmomatic)
  >>a. Removing Low-Quality Bases\
  >>b. Eliminating Adapter Sequences\
  >>c. Reducing Noise\
Trimming can help reduce background noise and improve the overall quality of the data, leading to more accurate results in analyses such as variant calling and assembly.

### Alignment of reads to the _P. f_ 3D7 version 3 reference genome 3D7 version 3 (using bwa)
>> Comparative analysis for identification of variants

### Deduplication (using MarkDuplicatesSpark function)
Removing duplicate:\
>> Improves data integrity\
>> Improves performance\
>> Simplifies data management\
>> Storage efficiency, and\
>> Accurate Analysis

### Base Quality Score Recalibration (BQSR)
>>It is a data pre-processing step that detects systematic errors made by the sequencing machine when it estimates the accuracy of each base call.\
>>_Note that this base recalibration process (BQSR) should not be confused with variant recalibration (VQSR)_

### CollectAlignmentSummaryMetrics (Picard)
>>Produces a summary of alignment metrics from a SAM or BAM file. This tool takes a SAM/BAM file input and produces metrics detailing the quality of the read alignments as well as the proportion of the reads that passed machine signal-to-noise threshold quality filters.\
>>_Note that these quality filters are specific to Illumina data; for additional information, please see the corresponding.

### Variant calling (HaplotypeCaller)
>>The HaplotypeCaller is capable of calling SNPs and indels simultaneously.\
>>In the GVCF workflow, HaplotypeCaller runs per sample to generate an intermediate GVCF (not to be used in the final analysis), which can then be used in GenotypeGVCFs for joint genotyping of multiple samples in a very efficient way.

### Combine GVCFs 
>>This combines per-sample gVCF files produced by HaplotypeCaller into a multi-sample gVCF file\
>>**CombineGVCFs** is meant to be used for merging GVCFs that will eventually be input into GenotypeGVCFs.

### GenotypeGVCFs
>>Perform joint genotyping on one or more samples pre-called with HaplotypeCaller.\
>>This tool is designed to perform joint genotyping on a single input, which may contain one or many samples. In any case, the input samples must possess genotype likelihoods produced by **HaplotypeCaller** with `-ERC GVCF` or `-ERC BP_RESOLUTION`

### VariantRecalibrator
>>Build a recalibration model to score variant quality for filtering purposes\
>>This model describes the relationship between variant annotations (such as QD, MQ and ReadPosRankSum, for example) and the probability that a variant is a true genetic variant versus a sequencing or data processing artefact.

### SelectVariants
>>Select a subset of variants from a VCF file\
>>Select variants based on criteria like their type (e.g. INDELs or SNPs only), evidence of Mendelian violation, filtering status, allelicity, etc.

### Annotation (using snpEFF)
>>Variant Interpretation\
>> This aids in interpreting genetic variants by linking them to known phenotypes, diseases, or traits, which is crucial for clinical applications.

