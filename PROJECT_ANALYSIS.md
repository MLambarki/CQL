# Project Analysis

## Repository Overview

- The repository is data-centric and currently contains only two content areas:
  - `src/cql/`: a collection of CQL query libraries (18 files).
  - `src/bundles/`: one FHIR R4 XML bundle (`fhir_bundle_test.xml`).
- There are no build scripts, dependency manifests, test harnesses, CI definitions, or README documentation in the current tree.

## What the Project Appears To Be

- A working set of **FHIR R4 + CQL artifacts** for oncology-oriented cohort or stratification logic.
- CQL files consistently declare `using FHIR version '4.0.0'` and include `FHIRHelpers`, indicating intended use with a CQL engine that supports FHIR model info.
- The XML bundle appears to be a realistic synthetic/example oncology dataset compatible with DKTK/FHIR onco-core profiles.

## Key Findings

1. **Mixed maturity across CQL files**
   - Most CQL files define executable expressions (`define ...`).
   - Four files (`cql-query.cql`, `cql-query_alterErstdiagnose.cql`, `cql-query_gender-male.cql`, `cql-query_khan43_04.cql`) contain placeholder macro tokens such as `DKTK_STRAT_*` and have no `define` expressions, so they are likely templates or pre-processed inputs rather than directly executable CQL.

2. **Large manually enumerated ICD-10 logic**
   - Several files (especially `cql_Cortex_Shaefer_TUM_05.cql`) contain extensive `exists [Condition: Code '...']` OR chains.
   - This approach is explicit but hard to maintain and error-prone for updates/versioning.

3. **FHIR example bundle is substantial and internally diverse**
   - The bundle has 32 `<entry>` elements and 11 resource types.
   - Observation resources dominate, followed by Procedure and AdverseEvent entries.

4. **In-repo TODOs indicate unfinished modeling decisions**
   - The FHIR bundle includes TODO comments around identifiers/classes/coding-system fixed values, suggesting profiling/normalization decisions are still pending.

## Risks / Technical Debt

- **Maintainability risk:** hand-maintained ICD code lists across many CQL files can drift and duplicate.
- **Execution ambiguity:** template-style CQL files mixed with executable CQL in same folder make automation difficult.
- **Operational risk:** no documented execution path, validation command, or CI checks.
- **Interoperability risk:** TODO-marked fields in the bundle may cause profile validation inconsistencies.

## Recommended Next Steps

1. Add a root `README.md` that documents:
   - purpose of the repository,
   - how to run CQL validation/execution,
   - which CQL files are templates vs executable.
2. Separate template CQL into `src/cql/templates/` (or suffix `*.template.cql`) to prevent accidental execution.
3. Reduce repeated ICD logic by:
   - introducing reusable `valueset` references where possible,
   - or generating code lists from a source table/script.
4. Add a minimal validation workflow:
   - syntax check all CQL files,
   - XML schema/profile validation for the bundle,
   - fail CI on parse errors.
5. Normalize naming conventions (`cql-query_*`, `CQL_*`, spaces in filenames) for easier tooling.

## Commands Used For Analysis

- `rg --files`
- `find . -maxdepth 4 -type f -not -path './.git/*'`
- `wc -l src/cql/*.cql src/bundles/fhir_bundle_test.xml`
- `nl -ba src/cql/cql-query.cql | sed -n '1,120p'`
- `nl -ba src/cql/CQL_CDSG_FFM_PAN_2025_01.cql | sed -n '1,180p'`
- `sed -n '1,220p' src/bundles/fhir_bundle_test.xml`
- `rg -n "DKTK_STRAT|TODO|@ TODO" src/cql src/bundles/fhir_bundle_test.xml`
- `python` scripts for:
  - resource-type counting in the FHIR bundle,
  - lightweight CQL structure checks (`library`/`define` presence).
