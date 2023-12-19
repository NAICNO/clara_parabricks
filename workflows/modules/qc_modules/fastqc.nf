#!/usr/bin/env nextflow

// Using DSL-2
nextflow.enable.dsl=2

process fastqc {
    publishDir "Results/${PROCESSOR}/${S_NAME}/QC/fastqc", mode: 'symlink', overwrite: true

    input:
    tuple val(S_NAME), path(R1), path(R2)
    val(PROCESSOR)

    output:
    file "*.{zip,html}"
    
    script:
    """
    fastqc -q ${R1} ${R2}
    """

    stub:
    """
    touch fastqc.zip
    touch fastqc.html
    sleep 5
    """

}
