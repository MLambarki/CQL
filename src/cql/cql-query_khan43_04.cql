library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'

context Patient

DKTK_STRAT_DEF_IN_INITIAL_POPULATION
(
(exists [Condition: Code 'C43.8' from icd10]) or
(exists [Condition: Code 'C43.9' from icd10]) or
(exists [Condition: Code 'C43.0' from icd10]) or
(exists [Condition: Code 'C43.4' from icd10]) or
(exists [Condition: Code 'C43.6' from icd10]) or
(exists [Condition: Code 'C43.7' from icd10]) or
(exists [Condition: Code 'C43.1' from icd10]) or
(exists [Condition: Code 'C43.2' from icd10]) or
(exists [Condition: Code 'C43.5' from icd10]) or
(exists [Condition: Code 'C43.3' from icd10])
)