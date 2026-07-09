# Leviathan

The **social-science, power, and human-behaviour knowledge base** — a point-in-time
corpus of scholarly open-access literature on how people, states, and organizations
compete, cooperate, deceive, and coordinate.

*Named for Hobbes' figure of organized power — the domain this corpus studies:
politics, war, propaganda, and human nature.*

Sibling of [`aqueduct`](https://github.com/AmunRaPtah/aqueduct) (the life-science
knowledge base) and [`numeraire`](https://github.com/AmunRaPtah/numeraire) (the
financial one) — **same proven corpus framework, deliberately separate data and topics.**

## Scope

Psychology · political science · history · game theory · international relations ·
media & communication studies, plus focused strands on **social engineering,
propaganda, war (tactics & strategy), politics, history, human nature, business
strategy, deception & manipulation, espionage, cults, money laundering, organized
crime & cartels, and arms-control policy.**

All entries are academic searches over open-access research literature
(**OpenAlex** across all fields + **arXiv** for game theory / computational social
science / security). This is a research corpus for study and analysis.

## Pipeline

```
OpenAlex / arXiv ──▶ ingest ──▶ DuckDB warehouse ──▶ sections + chunks ──▶ LSA index ──▶ RAG / report
```

Built on the aqueduct corpus engine (DuckDB, zero-config, in-process).

```bash
python -m leviathan harvest --topics topics.json --limit 15   # fetch + build
python -m leviathan corpus search "deterrence" -k 5           # lexical search
python -m leviathan facts                                     # corpus metrics
```

## Operations

A daily GitHub Actions harvest (`.github/workflows/leviathan-harvest.yml`) pulls the
corpus state from OneDrive (`onedrive:leviathan-state/state.tgz`), harvests, emails a
report, and pushes state back. Public repo → free unlimited Actions minutes.
