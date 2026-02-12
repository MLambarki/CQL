library Retrieve

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem icd10: 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem morph: 'urn:oid:2.16.840.1.113883.6.43.1'
codesystem Therapieart: 'http://dktk.dkfz.de/fhir/onco/core/CodeSystem/SYSTTherapieartCS'
codesystem atc: 'http://fhir.de/CodeSystem/bfarm/atc'

context Patient


// Define initial population


define InInitialPopulation:
  ( exists [Condition: Code 'C34.0' from icd10]
      or exists [Condition: Code 'C34.1' from icd10]
      or exists [Condition: Code 'C34.2' from icd10]
      or exists [Condition: Code 'C34.3' from icd10]
      or exists [Condition: Code 'C34.8' from icd10]
      or exists [Condition: Code 'C34.9' from icd10]
  )
    and ( exists from
        [Observation: Code '59847-4' from loinc] O
        where O.value.coding.code in { '8030/3', '8141/3', '8143/3', '8147/3', '8250/3', '8251/3', '8252/3', '8253/3', '8255/3', '8260/3', '8310/3', '8333/3', '8470/3', '8480/3', '8490/3', '8550/3', '8052/3', '8070/3', '8071/3', '8072/3', '8073/3', '8083/3', '8560/3', '8012/3', '8014/3', '8046/3', '8022/3', '8031/3', '8032/3', '8972/3', '8973/3', '8980/3', '8200/3', '8430/3', '8562/3', '8940/3', '8010/3', '8082/3', '8123/3', '8230/3', '8244/3', '8254/3', '8323/3', '8140/3' }
    )
    and ( exists [MedicationStatement: category in Code 'CH' from Therapieart] )
    and ( exists [Procedure: category in Code 'ST' from Therapieart] )
    and ( exists [Procedure: category in Code 'OP' from Therapieart] )
    and ( exists from
        [Procedure: category in Code 'ST' from Therapieart] ST
        where ( ST.extension.where ( url = 'http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Extension-StellungZurOp' ).value.coding.code contains 'N' )
    )
    and ( exists ( [MedicationStatement] MS
          where MS.medication.text.matches ( '(?i).*osimertinib.*' ))
        or exists ( [MedicationStatement] MS
            where MS.medication.text.matches ( '(?i).*gefitinib.*' ))
        or exists ( [MedicationStatement] MS
            where MS.medication.text.matches ( '(?i).*erlotinib.*' ))
        or exists ( [MedicationStatement] MS
            where MS.extension.where ( url = 'http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Extension-SystemischeTherapieProtokoll' ).value.text.matches ( '(?i).*osimertinib.*' ))
        or exists ( [MedicationStatement] MS
            where MS.extension.where ( url = 'http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Extension-SystemischeTherapieProtokoll' ).value.text.matches ( '(?i).*gefitinib.*' ))
        or exists ( [MedicationStatement] MS
            where MS.extension.where ( url = 'http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Extension-SystemischeTherapieProtokoll' ).value.text.matches ( '(?i).*erlotinib.*' ))
        or exists ( ( from [MedicationStatement] MS
              where exists ( MS.medication.coding C
                  where C.system = 'http://fhir.de/CodeSystem/bfarm/atc'
                    and C.code in { 'L01EB01', 'L01EB02', 'L01EB04' })))
    )

    and (
        exists (
  from [Procedure: category in Code 'ST' from Therapieart] ST
  where exists(ST.extension EX
    where EX.url = 'http://dktk.dkfz.de/fhir/StructureDefinition/onco-core-Extension-Bestrahlung'
    and exists (EX.extension EX2
      where EX2.url = 'Gesamtdosis'
      and EX2.value.as(Quantity).value in {60.0, 66.0, 45.0, 46.0}
    )
  )
)
    )