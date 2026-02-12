library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'

context Patient

define InInitialPopulation:
(
(exists [Condition: Code 'C34.-' from icd10]) or
(exists [Condition: Code 'C34.0' from icd10]) or
(exists [Condition: Code 'C34.1' from icd10]) or
(exists [Condition: Code 'C34.2' from icd10]) or
(exists [Condition: Code 'C34.3' from icd10]) or
(exists [Condition: Code 'C34.8' from icd10]) or
(exists [Condition: Code 'C34.9' from icd10]) or
(exists [Condition: Code 'C34' from icd10]) or
(exists [Condition: Code 'C61' from icd10]) or
(exists [Condition: Code 'C50.-' from icd10]) or
(exists [Condition: Code 'C50.0' from icd10]) or
(exists [Condition: Code 'C50.1' from icd10]) or
(exists [Condition: Code 'C50.2' from icd10]) or
(exists [Condition: Code 'C50.3' from icd10]) or
(exists [Condition: Code 'C50.4' from icd10]) or
(exists [Condition: Code 'C50.5' from icd10]) or
(exists [Condition: Code 'C50.6' from icd10]) or
(exists [Condition: Code 'C50.8' from icd10]) or
(exists [Condition: Code 'C50.9' from icd10]) or
(exists [Condition: Code 'C50' from icd10]) or
(exists [Condition: Code 'C18.-' from icd10]) or
(exists [Condition: Code 'C18.0' from icd10]) or
(exists [Condition: Code 'C18.1' from icd10]) or
(exists [Condition: Code 'C18.2' from icd10]) or
(exists [Condition: Code 'C18.3' from icd10]) or
(exists [Condition: Code 'C18.4' from icd10]) or
(exists [Condition: Code 'C18.5' from icd10]) or
(exists [Condition: Code 'C18.6' from icd10]) or
(exists [Condition: Code 'C18.7' from icd10]) or
(exists [Condition: Code 'C18.8' from icd10]) or
(exists [Condition: Code 'C18.9' from icd10]) or
(exists [Condition: Code 'C18' from icd10]) or
(exists [Condition: Code 'C19' from icd10]) or
(exists [Condition: Code 'C20' from icd10]) or
(exists [Condition: Code 'C67.-' from icd10]) or
(exists [Condition: Code 'C67.0' from icd10]) or
(exists [Condition: Code 'C67.1' from icd10]) or
(exists [Condition: Code 'C67.2' from icd10]) or
(exists [Condition: Code 'C67.3' from icd10]) or
(exists [Condition: Code 'C67.4' from icd10]) or
(exists [Condition: Code 'C67.5' from icd10]) or
(exists [Condition: Code 'C67.6' from icd10]) or
(exists [Condition: Code 'C67.7' from icd10]) or
(exists [Condition: Code 'C67.8' from icd10]) or
(exists [Condition: Code 'C67.9' from icd10]) or
(exists [Condition: Code 'C67' from icd10]) or
(exists [Condition: Code 'C25.-' from icd10]) or
(exists [Condition: Code 'C25.0' from icd10]) or
(exists [Condition: Code 'C25.1' from icd10]) or
(exists [Condition: Code 'C25.2' from icd10]) or
(exists [Condition: Code 'C25.3' from icd10]) or
(exists [Condition: Code 'C25.4' from icd10]) or
(exists [Condition: Code 'C25.7' from icd10]) or
(exists [Condition: Code 'C25.8' from icd10]) or
(exists [Condition: Code 'C25.9' from icd10]) or
(exists [Condition: Code 'C25' from icd10]) or
(exists [Condition: Code 'C64' from icd10]) or
(exists [Condition: Code 'C16.-' from icd10]) or
(exists [Condition: Code 'C16.0' from icd10]) or
(exists [Condition: Code 'C16.1' from icd10]) or
(exists [Condition: Code 'C16.2' from icd10]) or
(exists [Condition: Code 'C16.3' from icd10]) or
(exists [Condition: Code 'C16.4' from icd10]) or
(exists [Condition: Code 'C16.5' from icd10]) or
(exists [Condition: Code 'C16.6' from icd10]) or
(exists [Condition: Code 'C16.8' from icd10]) or
(exists [Condition: Code 'C16.9' from icd10]) or
(exists [Condition: Code 'C16' from icd10]) or
(exists [Condition: Code 'C15.-' from icd10]) or
(exists [Condition: Code 'C15.0' from icd10]) or
(exists [Condition: Code 'C15.1' from icd10]) or
(exists [Condition: Code 'C15.2' from icd10]) or
(exists [Condition: Code 'C15.3' from icd10]) or
(exists [Condition: Code 'C15.4' from icd10]) or
(exists [Condition: Code 'C15.5' from icd10]) or
(exists [Condition: Code 'C15.8' from icd10]) or
(exists [Condition: Code 'C15.9' from icd10]) or
(exists [Condition: Code 'C15' from icd10]) or
(exists [Condition: Code 'C54.-' from icd10]) or
(exists [Condition: Code 'C54.0' from icd10]) or
(exists [Condition: Code 'C54.1' from icd10]) or
(exists [Condition: Code 'C54.2' from icd10]) or
(exists [Condition: Code 'C54.3' from icd10]) or
(exists [Condition: Code 'C54.8' from icd10]) or
(exists [Condition: Code 'C54.9' from icd10]) or
(exists [Condition: Code 'C54' from icd10])
)