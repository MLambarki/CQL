library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem morph: 'urn:oid:2.16.840.1.113883.6.43.1'

context Patient

define InInitialPopulation:
(
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
(exists [Condition: Code 'C17.-' from icd10]) or
(exists [Condition: Code 'C17.0' from icd10]) or
(exists [Condition: Code 'C17.1' from icd10]) or
(exists [Condition: Code 'C17.2' from icd10]) or
(exists [Condition: Code 'C17.3' from icd10]) or
(exists [Condition: Code 'C17.8' from icd10]) or
(exists [Condition: Code 'C17.9' from icd10]) or
(exists [Condition: Code 'C17' from icd10]) or
(exists [Condition: Code 'C21.-' from icd10]) or
(exists [Condition: Code 'C21.0' from icd10]) or
(exists [Condition: Code 'C21.1' from icd10]) or
(exists [Condition: Code 'C21.2' from icd10]) or
(exists [Condition: Code 'C21.8' from icd10]) or
(exists [Condition: Code 'C21' from icd10]) or
(exists [Condition: Code 'C22.-' from icd10]) or
(exists [Condition: Code 'C22.0' from icd10]) or
(exists [Condition: Code 'C22.1' from icd10]) or
(exists [Condition: Code 'C22.2' from icd10]) or
(exists [Condition: Code 'C22.3' from icd10]) or
(exists [Condition: Code 'C22.4' from icd10]) or
(exists [Condition: Code 'C22.7' from icd10]) or
(exists [Condition: Code 'C22.9' from icd10]) or
(exists [Condition: Code 'C22' from icd10]) or
(exists [Condition: Code 'C26.-' from icd10]) or
(exists [Condition: Code 'C26.0' from icd10]) or
(exists [Condition: Code 'C26.1' from icd10]) or
(exists [Condition: Code 'C26.8' from icd10]) or
(exists [Condition: Code 'C26.9' from icd10]) or
(exists [Condition: Code 'C26' from icd10]) or
(exists [Condition: Code 'C40.-' from icd10]) or
(exists [Condition: Code 'C40.0' from icd10]) or
(exists [Condition: Code 'C40.1' from icd10]) or
(exists [Condition: Code 'C40.2' from icd10]) or
(exists [Condition: Code 'C40.3' from icd10]) or
(exists [Condition: Code 'C40.8' from icd10]) or
(exists [Condition: Code 'C40.9' from icd10]) or
(exists [Condition: Code 'C40' from icd10]) or
(exists [Condition: Code 'C41.-' from icd10]) or
(exists [Condition: Code 'C41.0-' from icd10]) or
(exists [Condition: Code 'C41.01' from icd10]) or
(exists [Condition: Code 'C41.02' from icd10]) or
(exists [Condition: Code 'C41.1' from icd10]) or
(exists [Condition: Code 'C41.2' from icd10]) or
(exists [Condition: Code 'C41.3-' from icd10]) or
(exists [Condition: Code 'C41.30' from icd10]) or
(exists [Condition: Code 'C41.31' from icd10]) or
(exists [Condition: Code 'C41.32' from icd10]) or
(exists [Condition: Code 'C41.4' from icd10]) or
(exists [Condition: Code 'C41.8' from icd10]) or
(exists [Condition: Code 'C41.9' from icd10]) or
(exists [Condition: Code 'C41' from icd10]) or
(exists [Condition: Code 'C43.-' from icd10]) or
(exists [Condition: Code 'C43.0' from icd10]) or
(exists [Condition: Code 'C43.1' from icd10]) or
(exists [Condition: Code 'C43.2' from icd10]) or
(exists [Condition: Code 'C43.3' from icd10]) or
(exists [Condition: Code 'C43.4' from icd10]) or
(exists [Condition: Code 'C43.5' from icd10]) or
(exists [Condition: Code 'C43.6' from icd10]) or
(exists [Condition: Code 'C43.7' from icd10]) or
(exists [Condition: Code 'C43.8' from icd10]) or
(exists [Condition: Code 'C43.9' from icd10]) or
(exists [Condition: Code 'C43' from icd10]) or
(exists [Condition: Code 'C44.-' from icd10]) or
(exists [Condition: Code 'C44.0' from icd10]) or
(exists [Condition: Code 'C44.1' from icd10]) or
(exists [Condition: Code 'C44.2' from icd10]) or
(exists [Condition: Code 'C44.3' from icd10]) or
(exists [Condition: Code 'C44.4' from icd10]) or
(exists [Condition: Code 'C44.5-' from icd10]) or
(exists [Condition: Code 'C44.50' from icd10]) or
(exists [Condition: Code 'C44.59' from icd10]) or
(exists [Condition: Code 'C44.6' from icd10]) or
(exists [Condition: Code 'C44.7' from icd10]) or
(exists [Condition: Code 'C44.8' from icd10]) or
(exists [Condition: Code 'C44.9' from icd10]) or
(exists [Condition: Code 'C44' from icd10]) or
(exists [Condition: Code 'C45.-' from icd10]) or
(exists [Condition: Code 'C45.0' from icd10]) or
(exists [Condition: Code 'C45.1' from icd10]) or
(exists [Condition: Code 'C45.2' from icd10]) or
(exists [Condition: Code 'C45.7' from icd10]) or
(exists [Condition: Code 'C45.9' from icd10]) or
(exists [Condition: Code 'C45' from icd10]) or
(exists [Condition: Code 'C46.-' from icd10]) or
(exists [Condition: Code 'C46.0' from icd10]) or
(exists [Condition: Code 'C46.1' from icd10]) or
(exists [Condition: Code 'C46.2' from icd10]) or
(exists [Condition: Code 'C46.3' from icd10]) or
(exists [Condition: Code 'C46.7' from icd10]) or
(exists [Condition: Code 'C46.8' from icd10]) or
(exists [Condition: Code 'C46.9' from icd10]) or
(exists [Condition: Code 'C46' from icd10]) or
(exists [Condition: Code 'C47.-' from icd10]) or
(exists [Condition: Code 'C47.0' from icd10]) or
(exists [Condition: Code 'C47.1' from icd10]) or
(exists [Condition: Code 'C47.2' from icd10]) or
(exists [Condition: Code 'C47.3' from icd10]) or
(exists [Condition: Code 'C47.4' from icd10]) or
(exists [Condition: Code 'C47.5' from icd10]) or
(exists [Condition: Code 'C47.6' from icd10]) or
(exists [Condition: Code 'C47.8' from icd10]) or
(exists [Condition: Code 'C47.9' from icd10]) or
(exists [Condition: Code 'C47' from icd10]) or
(exists [Condition: Code 'C48.-' from icd10]) or
(exists [Condition: Code 'C48.0' from icd10]) or
(exists [Condition: Code 'C48.1' from icd10]) or
(exists [Condition: Code 'C48.2' from icd10]) or
(exists [Condition: Code 'C48.8' from icd10]) or
(exists [Condition: Code 'C48' from icd10]) or
(exists [Condition: Code 'C49.-' from icd10]) or
(exists [Condition: Code 'C49.0' from icd10]) or
(exists [Condition: Code 'C49.1' from icd10]) or
(exists [Condition: Code 'C49.2' from icd10]) or
(exists [Condition: Code 'C49.3' from icd10]) or
(exists [Condition: Code 'C49.4' from icd10]) or
(exists [Condition: Code 'C49.5' from icd10]) or
(exists [Condition: Code 'C49.6' from icd10]) or
(exists [Condition: Code 'C49.8' from icd10]) or
(exists [Condition: Code 'C49.9' from icd10]) or
(exists [Condition: Code 'C49' from icd10]) or
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
(exists [Condition: Code 'C80.-' from icd10]) or
(exists [Condition: Code 'C80.0' from icd10]) or
(exists [Condition: Code 'C80.9' from icd10]) or
(exists [Condition: Code 'C80' from icd10])

)
and
  (
exists [Condition] C
where AgeInYearsAt(FHIRHelpers.ToDateTime(C.onset)) >= 18
  )
  