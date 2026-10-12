## Summary

Briefly describe what changed and why.

## Context

Optional background that helps the reviewer understand the lesson state, pedagogical problem, or workflow stage.

## Stage

- Current stage:
- Related stage record:
- Next intended step:

If relevant, link supporting files from `Workflow/records/` or `Workflow/STAGE_LOG.md`.

## Main changes

- 
- 
- 

## Review focus

What should the reviewer pay most attention to?

- 
- 

## Validation

- Rendered locally / CI checked:
- Specific checks run:
- Known limitations:

## Quick checks

Use only the items that fit this PR.

### General

- [ ] The change still matches the week's learning goals.
- [ ] The next intended step is clear.

### If Stage 1 dataset selection changed

- [ ] At least 8 credible examples from at least 4 independent sources were reviewed, or a human-approved exception is documented.
- [ ] The broad scan records exact variables/models, observational units, sampling stories, provenance, and reuse conditions.
- [ ] Two or three finalists were compared and numerically probed.
- [ ] Rejection reasons and transferable teaching patterns are recorded.
- [ ] The selected dataset was approved by the human reviewer before being marked locked.

### If `Learning_materials/` changed

- [ ] The Stage 2 record contains a completed story map and knowledge-state ledger.
- [ ] Internal roles and speaker notes did not leak into student-facing headings or prose.
- [ ] Written materials are teachable and usable for self-study.
- [ ] The narrative still follows intuition -> interpretation -> method -> formula.

### If `Presentation/` changed

- [ ] The Stage 4 record contains a completed one-row-per-slide story map and knowledge-state ledger.
- [ ] The heading-strip, visible-copy, and first-use audits were completed.
- [ ] Slides follow a clear prompt -> evidence -> interpretation -> bridge rhythm.
- [ ] Slides stay text-light and use staged reveal where it matters.
- [ ] Key visuals are followed immediately by interpretation.
- [ ] Interaction cadence and fallback wording were checked when relevant.

### If `Exercises/` changed

- [ ] The exercise blueprint maps every core task to an approved outcome and records prerequisites, timing, dependencies, and out-of-scope concepts.
- [ ] The unfilled public script parsed and ran from a clean R session.
- [ ] Every task was solved in an untracked reference harness and every expected result was verified.
- [ ] The core route is feasible within the practical and optional tasks are clearly marked.
- [ ] A separate exercise reviewer inspected the complete script, credible findings were resolved, and human review remains explicit.

### If render/release artefacts changed

- [ ] Typst-safe image paths and release artefacts were checked.
