-- Keep the new enum value in a separate migration: PostgreSQL cannot safely
-- use a newly added enum label in the same transaction.
alter type public.user_role add value if not exists 'author';
