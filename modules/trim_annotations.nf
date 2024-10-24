process TRIM_ANNOTATIONS {

    errorStrategy { task.attempt < 3 ? 'retry' : 'ignore' }
    maxRetries 2

    input:
    path prelim_annotations

    output:
    path "cdna.gff"

    script:
    """
    trim_annotations.py
    """

}

process NOVEL_TRIM_ANNOTATIONS {

    publishDir "${params.results}/novel", mode: 'copy', overwrite: true

    errorStrategy { task.attempt < 3 ? 'retry' : 'ignore' }
    maxRetries 2

    input:

    output:
    path "cdna.gff"

    script:
    """
    trim_annotations.py
    """

}

