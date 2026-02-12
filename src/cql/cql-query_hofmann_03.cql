library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem Therapieart: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SYSTTherapieartCS'
codesystem ops: 'http://fhir.de/CodeSystem/bfarm/ops'

// Define individual codes
code "OP": 'OP' from Therapieart
code "5-524": '5-524' from ops
code "5-525": '5-525' from ops

context Patient

define InInitialPopulation:
  (
    (exists [Condition: Code 'C25.0' from icd10]) or
    (exists [Condition: Code 'C25.1' from icd10]) or
    (exists [Condition: Code 'C25.2' from icd10]) or
    (exists [Condition: Code 'C25.3' from icd10]) or
    (exists [Condition: Code 'C25.7' from icd10]) or
    (exists [Condition: Code 'C25.8' from icd10]) or
    (exists [Condition: Code 'C25.9' from icd10])
  )
and not exists (
    [Procedure: category ~ "OP"] P
    where P.code ~ "5-524" or P.code ~ "5-525"
  )