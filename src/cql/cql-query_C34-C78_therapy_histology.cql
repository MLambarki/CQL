library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem loinc: 'http://loinc.org'
codesystem Therapieart: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SYSTTherapieartCS'

context Patient

/*
  Zielkohorte:
  - Diagnose C34* ODER C78*
  - Therapie erhalten: Strahlentherapie (ST) oder Systemtherapie (CH/IM/HO)
  - Für jede relevante Therapie ist Histologie (LOINC 59847-4) vor und nach Therapie dokumentiert

  Hinweis zur Datumslogik:
  - Procedure(ST): nur performedPeriod
  - MedicationStatement(CH/IM/HO): nur effectivePeriod
*/

define HasC34Diagnosis:
  (
    (exists [Condition: Code 'C34' from icd10]) or
    (exists [Condition: Code 'C34.0' from icd10]) or
    (exists [Condition: Code 'C34.1' from icd10]) or
    (exists [Condition: Code 'C34.2' from icd10]) or
    (exists [Condition: Code 'C34.3' from icd10]) or
    (exists [Condition: Code 'C34.8' from icd10]) or
    (exists [Condition: Code 'C34.9' from icd10])
  )

define HasC78Diagnosis:
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
    (exists [Condition: Code 'C78.8' from icd10]) or
    (exists [Condition: Code 'C78.9' from icd10])
  )

define HistologyDates:
  [Observation: Code '59847-4' from loinc] O
    where O.effectiveDateTime is not null
    return FHIRHelpers.ToDateTime(O.effectiveDateTime)

define RadiotherapyIntervalsFromPeriod:
  [Procedure: category in Code 'ST' from Therapieart] P
    where P.performedPeriod.start is not null
    return Interval[
      FHIRHelpers.ToDateTime(P.performedPeriod.start),
      Coalesce(
        FHIRHelpers.ToDateTime(P.performedPeriod.end),
        FHIRHelpers.ToDateTime(P.performedPeriod.start)
      )
    ]

define SystemicTherapyIntervalsFromPeriod:
  (
    [MedicationStatement: category in Code 'CH' from Therapieart]
      union [MedicationStatement: category in Code 'IM' from Therapieart]
      union [MedicationStatement: category in Code 'HO' from Therapieart]
  ) M
    where M.effectivePeriod.start is not null
    return Interval[
      FHIRHelpers.ToDateTime(M.effectivePeriod.start),
      Coalesce(
        FHIRHelpers.ToDateTime(M.effectivePeriod.end),
        FHIRHelpers.ToDateTime(M.effectivePeriod.start)
      )
    ]

define RelevantTherapyIntervals:
  RadiotherapyIntervalsFromPeriod
    union SystemicTherapyIntervalsFromPeriod

define HasRelevantTherapy:
  exists RelevantTherapyIntervals

define HistologyBeforeAndAfterEachTherapy:
  not exists (
    RelevantTherapyIntervals T
      where not (
        exists (HistologyDates H where H before start of T)
          and
        exists (HistologyDates H where H after end of T)
      )
  )

define InInitialPopulation:
  (HasC34Diagnosis
    or HasC78Diagnosis)
    and HasRelevantTherapy
    and HistologyBeforeAndAfterEachTherapy
