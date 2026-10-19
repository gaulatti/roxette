# Roxette ownership and disposition audit

Historical audit notes dated: 2026-09-07

Default branch and audited commit: `main` at
`40f98b18ce0913fdb2b073c35df5e1b0e800f02e`

## Decision

**Disposition: archive.**

Roxette is an iOS 17 SwiftUI prototype last changed on 2023-11-15. It plays one
hard-coded, third-party Radio Cooperativa playlist and contains placeholder
playlist/menu UI. No current product owner, repository consumer, application
backend, source-owned data, public App Store listing, release artifact,
deployment record, or automated delivery path was found.

The source and Git history remain the recovery artifact. The repository setting
must stay unchanged until the owner confirms the private Apple distribution
boundary. That external gate does not make the application a retained product;
it prevents us from claiming that the archive operation itself is complete.

## Historical audit notes and evidence limits

The table preserves September reports. Underlying GitHub, Apple, signing,
stream, portfolio-search and build receipts, including an exact Xcode version,
are not retained with this PR. Those observations have not been reproduced in
the 2026-10-19 documentation review and are not current verification or evidence
of exhaustive absence. Repository source establishes the configured inputs,
not live stream health, installed identities, distribution or current build status.

| Surface | Recorded method | Recorded result (external/build reports unverified) |
| --- | --- | --- |
| Repository | Local Git plus GitHub repository and branch APIs | Public, unarchived repository; sole unprotected `main` at `40f98b18ce0913fdb2b073c35df5e1b0e800f02e`; 22 commits; last commit 2023-11-15. The only other open repository issue is the 2023 swipe-enhancement task. |
| GitHub delivery metadata | Actions workflow/run, deployment, environment, hook, secret-name, and variable APIs | No workflow, run, deployment, environment, repository webhook, Actions secret name, or Actions variable exists. GitHub Pages is not configured. |
| Releases and dependency controls | Release, tag, and Dependabot APIs | No release or tag exists. Dependabot alerts are disabled. Private package and private artifact ownership are not visible through these public surfaces. |
| Application identity | Xcode build settings and project inspection | One iOS application target uses bundle ID `io.oxozon.yearn.roxette`, version `1.0` build `1`, iOS 17, and Apple team `N32N2U54JS`. A valid local development identity exists, but local signing capability is not distribution or installation evidence. |
| Apple public distribution | Apple's public iTunes lookup for the exact bundle ID | No public App Store record was returned. App Store Connect/TestFlight history and registered-device installations remain unverified because no authorized account surface was used. |
| Product behavior | Full Swift-source and plist review | The only network product dependency is a hard-coded Radio Cooperativa M3U URL. There is no application backend or catalog integration. Apollo and SQLite packages are linked but not imported by application source. Background audio is enabled. |
| External stream | Read-only HTTP requests to the exact playlist and both advertised stream URLs | The dated notes report HTTP 200 and two responding cleartext HTTP streams; current reachability is unknown. Reachability would establish only third-party infrastructure health, not Roxette ownership or device playback. |
| Clean build | Package resolution, project enumeration, and generic iOS Simulator build with signing disabled | The dated notes report resolving Apollo 1.7.0 and SQLite.swift 0.14.1, then an ApolloSQLite ambiguous `Expression` failure before application compilation. Without the exact toolchain and log this is not a verified current build result. The source defines no test target. |
| Portfolio references | Exact repository/origin/bundle-ID search under `/Users/gaulatti/source/gaulatti` and `/Users/gaulatti/source/fifthbell`, plus GitHub issue search | No external source reference or consumer was found. The only historical external record is open Eleni issue #7, “Provide radios list to Roxette,” unchanged since 2023 and never implemented in Roxette. |

## Ownership and recovery contract

- **Administrative owner:** repository owner `gaulatti` owns source-history and
  GitHub archive decisions.
- **Product owner:** none identified. The Radio Cooperativa streams and branding
  are third-party assets, not owned by this repository.
- **Delivery target:** none verified. There is no supported build, release,
  signing, TestFlight, App Store, or device-installation contract.
- **Secrets owner:** no repository credential or runtime secret was found. Apple
  signing/account access is an external administrative boundary and was not
  exercised.
- **Recovery:** restore source from Git history only for a newly approved product
  effort. Recovery requires a rights review, a named content/stream owner,
  removal or upgrade of unused dependencies, a passing clean build and tests,
  a new bundle/release decision, and exact-device playback verification.

## Before and after

Before this audit, the repository had no README or ownership warning; a working
third-party stream and resolvable packages could be mistaken for product health.

After this audit, the archive disposition is prominent, the public and private
distribution boundaries are separated, the historical build report is qualified,
and restoration conditions are explicit. There was no active automation to
disable.

No repository archive, source or Xcode change, dependency update, signing or
distribution action, device mutation, stream playback, credential access,
deployment, or source-history deletion was performed.

## Residual risks and archive gate

- An authorized App Store Connect owner must confirm that bundle ID
  `io.oxozon.yearn.roxette` has no active TestFlight build, app record,
  subscription, entitlement, or recovery dependency.
- The owner must decide whether Eleni issue #7 and Roxette issue #2 should be
  closed as historical before or during repository archival.
- The hard-coded Radio Cooperativa stream and branding require a new rights and
  transport-security review if anyone revives the prototype.
- No physical-device install or playback was attempted. Current build status
  remains unverified; the September failure report lacks a retained toolchain/log.
- Only the public App Store surface was checked; private distribution and prior
  ad hoc installs cannot be disproved from repository evidence.

After those checks and this documentation merge, the repository owner may apply
the GitHub archive setting and verify that the repository is read-only. Any
revival must unarchive into a new, separately planned product lane rather than
treating this snapshot as shippable.
