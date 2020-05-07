-- create schema
CREATE TABLE IF NOT EXISTS accounts(
	id UUID PRIMARY KEY,
	name VARCHAR(512) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users(
	id UUID PRIMARY KEY,
	default_account_id UUID DEFAULT NULL REFERENCES accounts(id),
	name VARCHAR(512) NOT NULL,
	email VARCHAR(320) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS projects(
	id UUID PRIMARY KEY,
	account_id UUID NOT NULL REFERENCES accounts(id),
	name VARCHAR(512) NOT NULL,
	description TEXT,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_accounts(
	user_id UUID NOT NULL REFERENCES users(id),
	account_id UUID NOT NULL REFERENCES accounts(id),
	default_project_id UUID REFERENCES projects(id),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS task_statuses(
	id UUID PRIMARY KEY,
	account_id UUID NOT NULL REFERENCES accounts(id),
	name VARCHAR(256) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tasks(
	id UUID PRIMARY KEY,
	title VARCHAR(512) NOT NULL,
	description TEXT,
	project_id UUID NOT NULL REFERENCES projects(id),
	reporter_id UUID NOT NULL REFERENCES users(id),
	status_id UUID NOT NULL REFERENCES task_statuses(id),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS assigned_users(
	task_id UUID NOT NULL REFERENCES tasks(id),
	user_id UUID NOT NULL REFERENCES users(id),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- load some data
INSERT INTO accounts (id, name)
VALUES (
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'Test Account 1'
),
(
	'c3dd6b60-553c-4995-abda-c1573a720d73',
	'Test Account 2'
) ON CONFLICT DO NOTHING;

INSERT INTO users (id, name, email, default_account_id)
VALUES (
	'd163193e-6f6a-4a71-92a1-c76d3148559a',
	'Test User',
	'test@watdo.app',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac'
) ON CONFLICT DO NOTHING;

INSERT INTO projects (id, account_id, name, description)
VALUES (
	'93305d12-6186-4002-a180-1d93ea9f74cb',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'Test Project',
	'A test project'
) ON CONFLICT DO NOTHING;

INSERT INTO task_statuses (id, account_id, name)
VALUES (
	'95836ddf-a578-4282-8db1-10a04abfd220',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'ToDo'
) ON CONFLICT DO NOTHING;

INSERT INTO task_statuses (id, account_id, name)
VALUES (
	'88a75370-e482-4c14-9181-80ffe238dd60',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'In Progress'
) ON CONFLICT DO NOTHING;

INSERT INTO task_statuses (id, account_id, name)
VALUES ('22451d49-c372-4df6-b629-8cd248bf584b',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'Done'
) ON CONFLICT DO NOTHING;

INSERT INTO user_accounts (user_id, account_id, default_project_id)
VALUES (
	'd163193e-6f6a-4a71-92a1-c76d3148559a',
	'5f2d9a95-b335-493f-a7ed-8dbd81027bac',
	'93305d12-6186-4002-a180-1d93ea9f74cb'
),
(
	'd163193e-6f6a-4a71-92a1-c76d3148559a',
	'c3dd6b60-553c-4995-abda-c1573a720d73',
	NULL
) ON CONFLICT DO NOTHING;
