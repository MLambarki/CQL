library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'

context Patient

define ICD10Codes: { 'C00', 'C00.0', 'C00.1', 'C00.2', 'C00.3'}

define InInitialPopulation:
  Count([Condition] C where C.code.coding.code in ICD10Codes) > 0
