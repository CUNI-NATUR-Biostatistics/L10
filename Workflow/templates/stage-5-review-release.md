# Release preparation and publication receipt

Follow the [canonical publication workflow](../../../_internal/.ai/core/publication.md#release-preparation-and-recordkeeping) and [Git authorization rules](../../../_internal/.ai/core/git-workflow.md#scoped-release-description-authorization). The filename is retained for compatibility with existing lesson workflows.

## Before merging: preparation in the existing lesson PR

Use this checklist inside the relevant existing workflow record or PR description. A separate record is optional. Keep preparation within that PR's intended scope and review gate.

- Lesson and intended version/tag:
- Lesson changes and relevant PR:
- Written-material, presentation, and exercise review/approval evidence:
- Required lesson-derived title image and provenance:
- Manifest, exercise/data routes, README links, assets, and licenses prepared:
- Privacy, assessment-security, provenance, and reuse checks:
- Known limitations and any explicit release-specific exception:
- Outstanding source changes to resolve before merging:
- Publication and deployment results: pending; not established by preparation.

## After merging: Stage 6 validation and publication

Validate the exact committed revision under the canonical policy, including the mandatory approved exercise and title image, allowlist, licensing, visibility, and distribution checks. Keep the report in temporary storage outside the lesson repository. Actual source problems need a separately authorized release-fix PR and validation of its merged revision. Missing preparation bookkeeping alone does not need a new PR.

Publish only after authorization for the identified release. Add the public-safe receipt below to its GitHub Release description, preserving its existing summary and student links. Update the verification section as actual results arrive. Preserve pending or failed states honestly; recovery dispatches retain their separate authorization. Check repository status before and after and preserve unrelated changes. Do not copy the post-merge receipt into `Workflow/records/` or update `STAGE_LOG.md` solely for the release.

## Public receipt format

Replace placeholders and remove authoring instructions before publishing. Keep private approval conversations and internal operational details in approved private storage.

```markdown
## Release summary

- Lesson: <LXX and title>
- Tag: <exact tag>
- Source commit: <full SHA and commit link>
- Changes: <short summary>
- Release: <release URL>
- Stable materials: <current route>
- Archived materials: <immutable release route>
- Known limitations / release-specific exceptions: <public-safe statement, or none>

## Publication verification

Checked at: <YYYY-MM-DD HH:MM, timezone>. Each status is pending, passed, failed, or not checked; include evidence or the reason for the status.

| Check | Status | Evidence or remaining gap |
| --- | --- | --- |
| Release ZIP integrity, exact allowlist, resource checksums and distribution | pending | <checksum/manifest evidence and release workflow link> |
| Stable Pages manifest and every listed resource | pending | <current route and verification evidence> |
| Immutable Pages manifest and every listed resource | pending | <tagged route and verification evidence> |
| Rendered HUB entry, correct version and stable material links | pending | <rendered HUB URL and verification evidence> |

Relevant Actions runs: <release, Pages, and HUB run URLs where available>.
Remaining gaps: <specific gaps or none; a successful run alone does not prove public availability>.
```
