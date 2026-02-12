library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'

context Patient

define InInitialPopulation:

(

(exists [Condition: Code 'C64' from icd10])
)

and
  (
exists from [Condition] C
  where year from C.onset between 2013 and 2022
  )

