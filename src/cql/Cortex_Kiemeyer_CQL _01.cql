library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'

context Patient

define InInitialPopulation:
  exists (
    [Condition] C
    where exists (
      from C.code.coding D
      where StartsWith(D.code, 'C') and  D.system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
    )
  and AgeInYearsAt(FHIRHelpers.ToDateTime(C.onset)) >= 18
  )