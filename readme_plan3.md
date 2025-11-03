# 📘 Cours 3 — Initiation à Zapier (Plan professeur)

## 🎯 Objectifs d'apprentissage (mesurables)
- Créer et activer 1 Zap simple à partir d’un template.
- Concevoir 1 Zap multi-étapes avec 1 Filter et 1 Path.
- Déboguer un Zap via "Zap History" et résoudre 2 erreurs fréquentes.
- Exécuter 1 Webhook (GET ou POST) et mapper une réponse JSON.
- Estimer le coût (Tasks) d’un Zap et proposer 2 optimisations.
- Appliquer 3 bonnes pratiques de sécurité (OAuth, PII, partage d’accès).

## 🧰 Prérequis
- Comptes: Zapier (gratuit), Google (Gmail/Drive/Sheets); optionnel: Notion, Slack.
- Ressources: 1 Google Sheet vierge, dossier Drive test, (facultatif) base Notion.
- Concepts: Trigger, Action, Task, Template, Filter, Path, Webhook, OAuth, JSON.

## ⏱️ Déroulé de séance recommandé (90 min)
- 0–10 min — Introduction: automation no-code, logique Trigger → Action, cas d’usage.
- 10–25 min — Démo "Quick win": Template Gmail → Google Sheets (test + activation).
- 25–50 min — TP guidé: Zap multi-étapes + Filter + Path (mapping de champs).
- 50–60 min — Troubleshooting live: Zap History, erreurs courantes, permissions.
- 60–80 min — TP avancé: Webhook (GET/POST), mapping JSON; option ChatGPT.
- 80–90 min — Debrief: estimation Tasks/coûts, sécurité, Q/R.

## 🧪 Ateliers (TP)
### TP1 (Débutant) — Gmail → Google Sheets
- Trigger: New Email (Gmail) — connecter via OAuth.
- Action: Create Spreadsheet Row (Google Sheets) — mapping des champs (from, subject, date).
- Test: envoyer 1 email et vérifier la ligne créée.

### TP2 (Intermédiaire) — Notion Links → Email de résumé
- Trigger: New Database Item (Notion) — base avec colonne "Type" et "URL".
- Filter: traiter seulement si Type = "lien".
- Path (option): si domaine = youtube.com, envoyer un modèle d’email différent.
- Action: Formatter le texte puis Envoyer un email (Gmail).

### TP3 (Avancé) — Météo → Webhook → Slack/IoT
- Trigger: Schedule (daily) → Webhook GET (params: city, units).
- Condition: s’il pleut → envoyer message Slack; sinon → autre action.
- Option: POST JSON vers une API externe (headers, bearer token), puis agir (IoT/lampe).

## 🧯 Troubleshooting — Checklist
- Zap History: le Trigger reçoit-il des données ? statut vert/rouge ?
- Connections/OAuth: accès valide, scopes suffisants, refresh ok ?
- Champs requis: mapping, types (texte vs nombre), formats (date, email).
- Limites: Tasks mensuelles atteintes, rate limits, retenter plus tard.
- Données réelles vs d’exemple: rejouer le Trigger avec un vrai événement.

## 🔐 Sécurité & conformité
- Minimiser la PII dans les Zaps; anonymiser quand possible.
- Préférer OAuth aux clés statiques; limiter les scopes; rotation des accès.
- Partage maîtrisé: Team Folders, Connections partagées; révoquer les accès obsolètes.
- Logs: éviter de journaliser des secrets; vérifier l’audit d’accès.

## 💸 Coûts & optimisation (Tasks)
- Comprendre la facturation par Task et par étape.
- Réduire les Tasks: placer les Filters tôt; regrouper; éviter les doublons.
- Planifier (Schedule) pour lisser la charge; exploiter les retries/backoffs.

## 🧠 Évaluation (rubric)
- 40% — Zap multi-étapes fonctionnel (Filter + Path).
- 20% — Webhook (GET/POST) + mapping JSON correct.
- 20% — Débogage: 2 erreurs résolues via Zap History.
- 20% — Sécurité/coût: 3 bonnes pratiques + estimation Tasks.

## 📚 Ressources
- Quick Start: https://zapier.com/resources/guides/quick-start
- Zapier Academy: https://zapier.com/learn
- Zapier Community: https://community.zapier.com/
- Templates Library: https://zapier.com/app/templates
- Documentation: https://help.zapier.com/
- Blog (ChatGPT & automations): https://zapier.com/blog/automate-chatgpt/

## 🗒️ Annexes — Glossaire express
- Trigger: événement déclencheur d’un Zap.
- Action: tâche effectuée en réaction au Trigger.
- Task: unité de facturation (chaque action consommée).
- Template: Zap préconfiguré prêt à cloner.
- Filter: condition qui laisse passer ou bloque un run.
- Path: branchement conditionnel multi-voies dans un Zap.
- Webhook: appel HTTP entrant/sortant pour échanger des données.
- OAuth: protocole d’autorisation sécurisée par jetons.
- JSON: format de données clé-valeur pour APIs/webhooks.
