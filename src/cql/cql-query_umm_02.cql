library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem Therapieart: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SYSTTherapieartCS'
codesystem ops: 'http://fhir.de/CodeSystem/bfarm/ops'

// Define individual codes
code "OP": 'OP' from Therapieart
code "5-864": '5-864' from ops
code "5-864.0": '5-864.0' from ops
code "5-864.2": '5-864.2' from ops
code "5-864.5": '5-864.5' from ops
code "5-864.6": '5-864.6' from ops
code "5-864.7": '5-864.7' from ops


context Patient

define InInitialPopulation:
  (
  (exists [Condition: Code 'C49' from icd10])  or  
  (exists [Condition: Code 'C49.0' from icd10]) or
  (exists [Condition: Code 'C49.1' from icd10]) or
  (exists [Condition: Code 'C49.2' from icd10]) or
  (exists [Condition: Code 'C49.3' from icd10]) or
  (exists [Condition: Code 'C49.4' from icd10]) or
  (exists [Condition: Code 'C49.5' from icd10]) or
  (exists [Condition: Code 'C49.6' from icd10]) 
  )
and exists (
    [Procedure: category ~ "OP"] P
    where P.code ~ "5-864" or P.code ~ "5-864.0" or P.code ~ "5-864.2" or P.code ~ "5-864.5" or P.code ~ "5-864.6" or P.code ~ "5-864.7"
    )