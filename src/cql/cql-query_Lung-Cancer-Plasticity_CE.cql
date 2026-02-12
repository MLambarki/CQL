library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem loinc: 'http://loinc.org'
codesystem gradingcs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/GradingCS'
codesystem ops: 'http://fhir.de/CodeSystem/bfarm/ops'
codesystem morph: 'urn:oid:2.16.840.1.113883.6.43.1'
codesystem lokalisation_icd_o_3: 'urn:oid:2.16.840.1.113883.6.43.1'
codesystem bodySite: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SeitenlokalisationCS'
codesystem Therapieart: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SYSTTherapieartCS'
codesystem specimentype: 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
codesystem uiccstadiumcs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/UiccstadiumCS'
codesystem lokalebeurteilungresidualstatuscs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/LokaleBeurteilungResidualstatusCS'
codesystem gesamtbeurteilungtumorstatuscs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/GesamtbeurteilungTumorstatusCS'
codesystem verlauflokalertumorstatuscs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/VerlaufLokalerTumorstatusCS'
codesystem verlauftumorstatuslymphknotencs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/VerlaufTumorstatusLymphknotenCS'
codesystem verlauftumorstatusfernmetastasencs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/VerlaufTumorstatusFernmetastasenCS'
codesystem vitalstatuscs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/VitalstatusCS'
codesystem jnucs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/JNUCS'
codesystem fmlokalisationcs: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/FMLokalisationCS'
codesystem TNMTCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMTCS'
codesystem TNMNCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMNCS'
codesystem TNMMCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMMCS'
codesystem TNMySymbolCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMySymbolCS'
codesystem TNMrSymbolCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMrSymbolCS'
codesystem TNMmSymbolCS: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/TNMmSymbolCS'
codesystem molecularMarker: 'http://www.genenames.org'
codesystem BBMRI_icd10: 'http://hl7.org/fhir/sid/icd-10'
codesystem BBMRI_icd10gm: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'
codesystem BBMRI_SampleMaterialType: 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
codesystem BBMRI_StorageTemperature: 'https://fhir.bbmri.de/CodeSystem/StorageTemperature'
codesystem BBMRI_SmokingStatus: 'http://hl7.org/fhir/uv/ips/ValueSet/current-smoking-status-uv-ips'

context Patient

define InInitialPopulation:
(
  (
    (exists [Condition: Code 'C34' from icd10]) or
    (exists [Condition: Code 'C34.0' from icd10]) or 
    (exists [Condition: Code 'C34.1' from icd10]) or 
    (exists [Condition: Code 'C34.2' from icd10]) or 
    (exists [Condition: Code 'C34.3' from icd10]) or 
    (exists [Condition: Code 'C34.8' from icd10]) or 
    (exists [Condition: Code 'C34.9' from icd10])
  ) or 

  (
    (exists [Condition: Code 'C78' from icd10]) or 
    (exists [Condition: Code 'C78.0' from icd10]) or 
    (exists [Condition: Code 'C78.1' from icd10]) or 
    (exists [Condition: Code 'C78.2' from icd10]) or 
    (exists [Condition: Code 'C78.3' from icd10]) or 
    (exists [Condition: Code 'C78.4' from icd10]) or 
    (exists [Condition: Code 'C78.5' from icd10]) or 
    (exists [Condition: Code 'C78.6' from icd10]) or 
    (exists [Condition: Code 'C78.7' from icd10]) or 
    (exists [Condition: Code 'C78.8' from icd10])
  )

) and

(
  (exists from [Procedure: category in Code 'ST' from Therapieart] P) or 
  (exists [MedicationStatement: category in Code 'CH' from Therapieart]) or 
  (exists [MedicationStatement: category in Code 'IM' from Therapieart]) or 
  (exists [MedicationStatement: category in Code 'HO' from Therapieart])

) and 
(
  exists from [Observation: Code '59847-4' from loinc] O
where O.effectiveDateTime between '2020-02-02' and '2026-02-02'
) 

