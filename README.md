# LIFEOS — My Daily System

A responsive personal operating-system starter built with React + Vite, Lucide icons and Supabase Auth/Postgres cloud sync.

## Run locally

1. Install Node.js 20+.
2. In this folder run `npm install`
3. Run `npm run dev`
4. Open the local URL printed by Vite.

The app works immediately in **local preview mode** and saves state in this browser. It includes a sample day, task status updates, editable activities, a deterministic schedule rearranger, food and water logs, habit checklists, a weight field, workout records, skincare checklists, learning roadmap, theme switch, JSON backup and restore.

## Enable secure cross-device sync

1. Create a Supabase project in your own Supabase account.
2. In Supabase SQL Editor, run `supabase/schema.sql`.
3. Copy `.env.example` to `.env` and add your project URL and publishable key.
4. Restart `npm run dev`.
5. Create an account in Supabase Authentication (or enable email/password sign-up in your deployed auth screen). This starter currently includes sign-in; create the first user in Supabase Dashboard → Authentication → Users, then sign in.
6. Press **Sync data** after signing in. Your LIFEOS state is saved in a private row protected by Row Level Security.

Never put a Supabase secret/service-role key in a browser environment variable. Only use the publishable key.

## Important scope notes

- This is a working MVP foundation, not a deployed production service. No Supabase project was connected to this workspace, so no live backend was provisioned.
- The cloud table stores the current structured app state as JSONB per user. For a production multi-user product with richer reporting, migrate the nested arrays into normalized tables and add server-side validation, audit history, storage policies for progress photos, email verification/password reset, and automated tests.
- Adaptive scheduling uses deterministic rules: completed/skipped/fixed events are preserved and flexible pending tasks are moved forward without overlapping. Review every proposed change; this is intentionally not an AI agent that silently edits your plan.
- The 2,400 kcal / 100 g protein dashboard figures are editable planning placeholders, not a personalised prescription. Confirm nutrition targets with a qualified professional if you have health or dietary constraints.
- The initial ₹3,000 monthly food budget is extremely constrained for a complete muscle-gain diet; the app flags this rather than pretending it is sufficient.
- Sample activities, calorie values and roadmap topics are editable starter data.

## Money Tracker

The Money Tracker page lets you record daily income and expenses in INR, choose a date and category, add an optional note, and review totals for any selected month. Transactions are retained in the app's saved state, so previous months remain available when you switch the month selector. The monthly report shows total income, total expenses, net balance, and a dated transaction list. Transactions are included in JSON backups and in the LIFEOS Supabase state payload when cloud sync is configured.

For accurate records, enter each earning or expense on the day it happens. The monthly net balance is calculated as that month's income minus that month's expenses; it is not a bank-account balance or an automatic carry-forward calculation.
