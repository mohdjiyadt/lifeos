-- LIFEOS cloud persistence. Run in Supabase SQL Editor.
-- One private state document per authenticated user. The browser app stores its
-- structured planner state as JSONB; RLS guarantees users can only access their own row.
create table if not exists public.lifeos_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.lifeos_state enable row level security;
drop policy if exists "Users can read their own LIFEOS state" on public.lifeos_state;
create policy "Users can read their own LIFEOS state"
  on public.lifeos_state for select to authenticated
  using ((select auth.uid()) = user_id);
drop policy if exists "Users can insert their own LIFEOS state" on public.lifeos_state;
create policy "Users can insert their own LIFEOS state"
  on public.lifeos_state for insert to authenticated
  with check ((select auth.uid()) = user_id);
drop policy if exists "Users can update their own LIFEOS state" on public.lifeos_state;
create policy "Users can update their own LIFEOS state"
  on public.lifeos_state for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
grant select, insert, update on public.lifeos_state to authenticated;
